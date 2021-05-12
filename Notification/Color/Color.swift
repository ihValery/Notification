//
//  Color.swift
//  Notification
//
//  Created by Валерий Игнатьев on 12.05.21.
//

import SwiftUI

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

extension Color {
    static let lightScheme = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let darkScheme = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    
    static let darkStart = Color(red: 20 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    
    static let lightStart = Color(red: 60 / 255, green: 160 / 255, blue: 240 / 255)
    static let lightEnd = Color(red: 30 / 255, green: 80 / 255, blue: 120 / 255)
    
    static var colorScheme: Color {
        Color(UIColor { $0.userInterfaceStyle == .light ?
                UIColor(red: 225 / 255, green: 225 / 255, blue: 235 / 255, alpha: 1) :
                UIColor(red: 25 / 255, green: 25 / 255, blue: 30 / 255, alpha: 1) })
    }
    
    static var colorSchemeShadowStart: Color {
        Color(UIColor { $0.userInterfaceStyle == .light ?
                UIColor(red: 60 / 255, green: 160 / 255, blue: 240 / 255, alpha: 1) :
                UIColor(red: 20 / 255, green: 60 / 255, blue: 65 / 255, alpha: 1) })
    }
    
    static var colorSchemeShadowEnd: Color {
        Color(UIColor { $0.userInterfaceStyle == .light ?
                UIColor(red: 60 / 255, green: 160 / 255, blue: 240 / 255, alpha: 1) :
                UIColor(red: 25 / 255, green: 25 / 255, blue: 30 / 255, alpha: 1) })
    }
    
}

extension View {
    func shadowNeomorphism() -> some View {
        self.modifier(ShadowNeomorphism())
    }
}

struct ShadowNeomorphism: ViewModifier {
    
    func body(content: Content) -> some View {
        ZStack { content }
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
    }
}
