//
//  NotificationView.swift
//  Notification
//
//  Created by Валерий Игнатьев on 10.05.21.
//

import SwiftUI

struct NotificationView: View {
    
    @State private var currentDate = Date()
    @State private var toShowAlert = false
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        VStack {
            Text("Когда напомнить?")
                .fontWeight(.light)
            DatePicker("Время", selection: $currentDate, in: Date()...)
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
            ButtonSetNotification(date: currentDate)
        }
        .font(.largeTitle)
        .padding()
        
        .onChange(of: scenePhase) { phase in
            if phase == .active {
                UIApplication.shared.applicationIconBadgeNumber = 0
            }
        }
        
        .onAppear {
            NotificationManager.shared.getNotification {
                toShowAlert.toggle()
            }
        }
        
        .alert(isPresented: $toShowAlert, content: {
            Alert(title: Text("Уведомление отключено для этого приложения"),
                  message: Text("Пожалуйста, перейдите в настройки, чтобы включить его сейчас"),
                  primaryButton: .default(Text("Открыть настройки")) {
                    goToSettings()
                  },
                  secondaryButton: .cancel())
        })
    }
}

extension NotificationView {
    private func goToSettings() {
        DispatchQueue.main.async {
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
            .preferredColorScheme(.light)
    }
}
