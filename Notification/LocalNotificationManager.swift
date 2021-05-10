//
//  LocalNotificationManager.swift
//  Notification
//
//  Created by Валерий Игнатьев on 10.05.21.
//

import UserNotifications

struct Notification {
    var id: String
    var title: String
}

class LocalNotificationManager {
    var notifications: [Notification] = []
    private var notificationCenter = UNUserNotificationCenter.current()
    
    func requestPermission() {
        notificationCenter
            .requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                guard granted else { return }
                self.notificationCenter.getNotificationSettings { settings in
                    print(settings)
                    guard settings.authorizationStatus == .authorized else { return }
                    
                }
            }
    }
}
