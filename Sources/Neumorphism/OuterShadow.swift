//
//  OuterShadow.swift
//  
//  Copyright © 2022 Ian Creech. All rights reserved.
//  Created by Ian Creech on 1/31/22.
//  Neumorphism UI Package

import SwiftUI

@available(macOS 10.15, *)
@available(iOS 13.0, *)
private struct SoftUIOuterShadow: ViewModifier {
    var lightShadowColor: Color
    var darkShadowColor: Color
    var shadowOffset: CGFloat
    var shadowRadius: CGFloat
    
    init(lightShadowColor: Color, darkShadowColor: Color,  shadowOffset: CGFloat, shadowRadius: CGFloat) {
        self.lightShadowColor = lightShadowColor
        self.darkShadowColor = darkShadowColor
        self.shadowOffset = shadowOffset
        self.shadowRadius = shadowRadius
    }

    func body(content: Content) -> some View {
        content
        .shadow(color: darkShadowColor, radius: shadowRadius, x: shadowOffset, y: shadowOffset)
        .shadow(color: lightShadowColor, radius: shadowRadius, x: -shadowOffset, y: -shadowOffset)
    }
}

@available(macOS 10.15, *)
@available(iOS 13.0, *)
extension View {
    public func softOuterShadow(lightShadow: Color = Color.Neumorphism.lightShadow, darkShadow: Color = Color.Neumorphism.darkShadow, offset: CGFloat = 5, radius: CGFloat = 3) -> some View {
        modifier(SoftUIOuterShadow(lightShadowColor: lightShadow, darkShadowColor: darkShadow, shadowOffset: offset, shadowRadius: radius))
    }
}
