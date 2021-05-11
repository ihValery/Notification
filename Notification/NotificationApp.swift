//
//  NotificationApp.swift
//  Notification
//
//  Created by Валерий Игнатьев on 10.05.21.
//

import SwiftUI

@main
struct NotificationApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
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

//Для подписи delegate и реализации метода willPresent notification
class AppDelegate: NSObject, UIApplicationDelegate {
    private var notificationCenter = UNUserNotificationCenter.current()
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        notificationCenter.delegate = self
        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler( [.sound, .banner, .badge] )
    }
}
