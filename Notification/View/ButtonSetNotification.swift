//
//  ButtonSetNotification.swift
//  Notification
//
//  Created by Валерий Игнатьев on 11.05.21.
//

import SwiftUI

struct ButtonSetNotification: View {
    var date: Date?
    var text: String?
    
    var body: some View {
        Button(action: {
            guard let date = date, let text = text else { return }
            NotificationManager.shared.sceduleNotification(notificationType: text, date: date)
        }) {
            HStack {
                Text("Установить")
                    .padding(.horizontal)
                Image(systemName: "timer")
            }
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 10)
            .foregroundColor(.lightStart)
        }
        .buttonStyle(LightButtonStyle())
    }
}

struct ButtonSetNotification_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSetNotification()
            .previewLayout(.sizeThatFits)
    }
}
