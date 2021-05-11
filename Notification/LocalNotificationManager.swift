//
//  LocalNotificationManager.swift
//  Notification
//
//  Created by Валерий Игнатьев on 10.05.21.
//

import UserNotifications

//struct Notification {
//    var id: String
//    var title: String
//}

class LocalNotificationManager: ObservableObject {
    
    //    var notifications: [Notification] = []
    private var notificationCenter = UNUserNotificationCenter.current()
    
    ///Запрос на использование Notification
    func requestPermission() {
        notificationCenter
            .requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                guard granted else { return }
                self.getNotification()
            }
    }
    
    ///Проверка настроек (ведь пользователь может потом запретить)
    func getNotification() {
        notificationCenter
            .getNotificationSettings { settings in
                switch settings.authorizationStatus {
                    case .notDetermined:
                        print("Пользователь еще не выбирал, разрешено ли приложению уведомления")
                    case .authorized, .provisional:
                        print("Приложение авторизовано для получения уведомлений.")
                        print(settings)
                    default: break
                }
            }
    }
    
    ///Создание содержимого для локального уведомления
    func sceduleNotification(notificationType: String) {
        let content = UNMutableNotificationContent()
        
        content.title = notificationType
        content.body = "Это пример уведомлений\nНе жди, что деньги принесут тебе счастье.\nДумай о великом, но находи удовольствие в маленьких радостях."
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        //Вызов .add с тем же identifire заменит уведомление
        notificationCenter.add(request) { error in
            if let error = error {
                print("Ошибка: \(error.localizedDescription)")
            }
        }
    }
}
