//
//  ContentView.swift
//  Notification
//
//  Created by Валерий Игнатьев on 10.05.21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentDate = Date()
    @Environment(\.scenePhase) private var scenePhase
//    @State private var showFootNote = false
    private var notificationManager = LocalNotificationManager()
    
    var body: some View {
        VStack {
            Text("Когда напомнить?")
                .fontWeight(.light)
            DatePicker("Время", selection: $currentDate, in: Date()...)
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
            Button(action: {
                notificationManager
                    .sceduleNotification(notificationType: "\(currentDate)")
            }) {
                HStack {
                    Text("Установить")
                        .padding(.horizontal)
                    Image(systemName: "timer")
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                .foregroundColor(.blue)
                .overlay(
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(Color.blue, lineWidth: 2))
            }
//            if showFootNote {
//                Text("Уведомление придет через 5 сек")
//                    .font(.footnote)
//            }
        }
        .font(.largeTitle)
        .padding()
        .onChange(of: scenePhase) { phase in
            if phase == .active {
                UIApplication.shared.applicationIconBadgeNumber = 0
                
//                showFootNote = false
            }
        }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
