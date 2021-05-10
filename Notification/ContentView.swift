//
//  ContentView.swift
//  Notification
//
//  Created by Валерий Игнатьев on 10.05.21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentDate = Date()
    var notificationCenter = LocalNotificationManager()
    
    var body: some View {
        VStack {
            Text("Когда напомнить?")
                .fontWeight(.light)
            DatePicker("Время", selection: $currentDate, in: Date()...)
                .datePickerStyle(GraphicalDatePickerStyle())
//                .labelsHidden()
            DesignButton()
            Text("Выбранное время:\n\(currentDate)")
                .fontWeight(.light)
                .font(.subheadline)
                .padding(.top)
                .multilineTextAlignment(.leading)
        }
        .font(.largeTitle)
        .padding()
    }
    
    func setNotification() {
        notificationCenter.requestPermission()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
