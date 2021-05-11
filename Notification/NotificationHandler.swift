//
//  NotificationHandler.swift
//  Notification
//
//  Created by Валерий Игнатьев on 11.05.21.
//

import Foundation
import NotificationCenter

class NotificationHandler: NSObject, UNUserNotificationCenterDelegate {
    static let shared = NotificationHandler()
    private let center = UNUserNotificationCenter.current()
    
    /** Handle notification when app is in background */
    /** Обработка уведомлений, когда приложение находится в фоновом режиме */
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    /** Handle notification when the app is in foreground */
    /** Обработка уведомлений, когда приложение находится на переднем плане */
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
}

extension NotificationHandler {
    /// Проверка настроек (ведь пользователь может потом запретить).
    func getNotification() {
        
        center.getNotificationSettings { settings in
            switch settings.authorizationStatus {
                case .notDetermined:
                    print("Пользователь еще не выбирал, разрешено ли приложению уведомления")
                    self.requestPermission()
                case .denied:
                    print("Приложение не авторизовано для планирования или получения уведомлений.")
                case .authorized:
                    print("Приложение авторизовано для получения уведомлений.")
                case .provisional:
                    print("Приложению временно разрешено публиковать уведомления пользователей без прерывания работы.")
                case .ephemeral:
                    print("Приложение имеет право планировать или получать уведомления на ограниченный период времени.")
                default: break
            }
        }
        center.delegate = self
    }
    
    ///Запрос на использование Notification.
    func requestPermission() {
        center.requestAuthorization(options: [.alert, .badge, .sound]) { _, error in
            if let error = error {
                print("Хьюстон у нас проблемы: \(error.localizedDescription)")
            }
        }
    }
    
    ///Создание содержимого для локального уведомления
    func sceduleNotification(notificationType: String) {
        let content = UNMutableNotificationContent()
        
        content.title = notificationType
        content.body = "Не жди, что деньги принесут тебе счастье. Думай о великом, но находи удовольствие в маленьких радостях."
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        //Вызов .add с тем же identifire заменит уведомление
        center.add(request) { error in
            if let error = error {
                print("Ошибка: \(error.localizedDescription)")
            }
        }
    }
}
