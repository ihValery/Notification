//
//  NotificationApp.swift
//  Notification
//
//  Created by Валерий Игнатьев on 10.05.21.
//

import SwiftUI

@main
struct NotificationApp: App {
    
    private var notificationCenter = LocalNotificationManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    notificationCenter.requestPermission()
                }
        }
    }
}
