//
//  InnerShadow.swift
//  
//  Copyright © 2022 Ian Creech. All rights reserved.
//  Created by Ian Creech on 2/01/22.
//  Neumorphism UI Package

import SwiftUI

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

private struct SoftUIInnerShadow<S: Shape>: ViewModifier {
    var shape: S
    var darkShadowColor: Color
    var lightShadowColor: Color
    var radius: CGFloat = 5.0
    var offset: CGFloat
    
    init(shape: S, darkShadowColor: Color, lightShadowColor: Color, radius: CGFloat, offset: CGFloat) {
        self.shape = shape
        self.darkShadowColor = darkShadowColor
        self.lightShadowColor = lightShadowColor
        self.radius = radius
        self.offset = offset
    }
    
    func body(content: Content) -> some View {
        content.overlay(
            shape
                .fill(Color.Neumorphism.primaryColor)
                .overlay(
                    shape
                        .stroke(Color.Neumorphism.secondaryColor, lineWidth: 4)
                        .blur(radius: radius)
                        .offset(x: offset, y: offset)
                        .mask(shape.fill(LinearGradient(Color.Neumorphism.darkShadow, Color.clear)))
                )
                .overlay(
                    shape
                        .stroke(Color.Neumorphism.lightShadow, lineWidth: 8)
                        .blur(radius: radius)
                        .offset(x: -offset, y: -offset)
                        .mask(shape.fill(LinearGradient(Color.clear, Color.Neumorphism.darkShadow)))
                )
        )
    }
}

extension View {
    public func softInnerShadow<S : Shape>(_ content: S, darkShadow: Color = Color.Neumorphism.darkShadow, lightShadow: Color = Color.Neumorphism.lightShadow, radius: CGFloat = 4, offset: CGFloat = 2) -> some View {
        modifier(SoftUIInnerShadow(shape: content, darkShadowColor: darkShadow, lightShadowColor: lightShadow, radius: radius, offset: offset))
    }
}
