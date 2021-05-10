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
    
    var body: some View {
        VStack {
            Text("Когда напомнить?")
                .fontWeight(.light)
            DatePicker("Время", selection: $currentDate, in: Date()...)
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
            DesignButton()
            Text("Выбранное время:\n\(currentDate)")
                .fontWeight(.light)
                .font(.subheadline)
                .padding(.top)
                .multilineTextAlignment(.leading)
        }
        .font(.largeTitle)
        .padding()
        .onChange(of: scenePhase) { phase in
            if phase == .active {
                UIApplication.shared.applicationIconBadgeNumber = 0
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
