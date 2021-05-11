//
//  DesignButton.swift
//  Notification
//
//  Created by Валерий Игнатьев on 10.05.21.
//
/*
import SwiftUI

struct DesignButton: View {
    
    var notificationManager = LocalNotificationManager()
    var contentView = ContentView()
    
    var body: some View {
        Button(action: {
//            notificationManager
//                .sceduleNotification(notificationType: "\(contentView.currentDate)")
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
    }
}

struct DesignButton_Previews: PreviewProvider {
    static var previews: some View {
        DesignButton()
            .previewLayout(.sizeThatFits)
    }
}
*/

/*
 //Кастомизация кнопки огранченна лишь фантазией -> вызов через .buttonStyle()
 //Анимацию и другие плюшки берешь на себя
 struct CustomButton: ButtonStyle {
 
 func makeBody(configuration: Configuration) -> some View {
 configuration.label
 .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
 .foregroundColor(.blue)
 .overlay(
 RoundedRectangle(cornerRadius: 13)
 .stroke(Color.blue, lineWidth: 2))
 .opacity(configuration.isPressed ? 0.3 : 1)
 .scaleEffect(configuration.isPressed ? 0.99 : 1)
 }
 }
 */
