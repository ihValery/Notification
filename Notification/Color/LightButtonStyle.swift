//
//  LightButtonStyle.swift
//  Notification
//
//  Created by Валерий Игнатьев on 12.05.21.
//

import SwiftUI

struct LightButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(RoundedRectangle(cornerRadius: 25))
            .background(LightBackground(isHiglighed: configuration.isPressed, shape: RoundedRectangle(cornerRadius: 25)))
            .animation(nil)
    }
}

struct LightBackground<S: Shape>: View {
    
    var isHiglighed: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHiglighed {
              shape
                .fill(Color.colorScheme)
                .overlay(
                    shape
                        .stroke(Color.gray, lineWidth: 4)
                        .blur(radius: 4)
                        .offset(x: 2, y: 2)
                        .mask(RoundedRectangle(cornerRadius: 25).fill(LinearGradient(Color.black, Color.clear))))
                .overlay(
                    shape
                        .stroke(Color.white, lineWidth: 8)
                        .blur(radius: 4)
                        .offset(x: -2, y: -2)
                        .mask(RoundedRectangle(cornerRadius: 25).fill(LinearGradient(Color.clear, Color.black))))
            } else {
                shape
                    .fill(Color.colorScheme)
                    .shadowNeomorphism()
            }
        }
    }
}
