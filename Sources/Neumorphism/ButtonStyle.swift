//
//  ButtonStyle.swift
//
//  Copyright © 2022 Ian Creech. All rights reserved.
//  Created by Ian Creech on 2/01/22.
//  Neumorphism UI Package

import SwiftUI

public struct SoftUIButtonStyle<S: Shape>: ButtonStyle {
    var shape: S
    var shapeColor: Color
    var textColor: Color
    var lightShadowColor: Color
    var darkShadowColor: Color
    var padding: CGFloat
    
    public init(_ shape: S, shapeColor: Color, textColor: Color, lightShadowColor: Color, darkShadowColor: Color, padding: CGFloat) {
        self.shape = shape
        self.shapeColor = shapeColor
        self.textColor = textColor
        self.lightShadowColor = lightShadowColor
        self.darkShadowColor = darkShadowColor
        self.padding = padding
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(textColor)
            .padding(padding)
            .background(
                ZStack {
                    if configuration.isPressed == true {
                        shape
                            .fill(shapeColor)
                            .softInnerShadow(shape, darkShadow: darkShadowColor, lightShadow: lightShadowColor, radius: 3)
                            .opacity(configuration.isPressed ? 1 : 0)
                    }
                    
                    shape
                        .fill(shapeColor)
                        .softOuterShadow(lightShadow: lightShadowColor, darkShadow: darkShadowColor, offset: 5, radius: 3)
                        .opacity(configuration.isPressed ? 0 : 1)
                } // ZStack
            ) // background
    }
}

public struct ExtraSoftUIButtonStyle<S: Shape>: ButtonStyle {
    var shape: S
    var shapeColorStart: Color
    var shapeColorEnd: Color
    var textColor: Color
    var lightShadowColor: Color
    var darkShadowColor: Color
    var padding: CGFloat
    
    public init(_ shape: S, shapeColorStart: Color, shapeColorEnd: Color, textColor: Color, lightShadowColor: Color, darkShadowColor: Color, padding: CGFloat) {
        self.shape = shape
        self.shapeColorStart = shapeColorStart
        self.shapeColorEnd = shapeColorEnd
        self.textColor = textColor
        self.lightShadowColor = lightShadowColor
        self.darkShadowColor = darkShadowColor
        self.padding = padding
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(textColor)
            .padding(padding)
            .background(
                ZStack {
                    if configuration.isPressed == true {
                        shape
                            .fill(LinearGradient(shapeColorEnd, shapeColorStart))
                            .softInnerShadow(shape, darkShadow: darkShadowColor, lightShadow: lightShadowColor, radius: 3)
                            .opacity(configuration.isPressed ? 1 : 0)
                    }
                    
                    shape
                        .fill(LinearGradient(shapeColorStart, shapeColorEnd))
                        .softOuterShadow(lightShadow: lightShadowColor, darkShadow: darkShadowColor, offset: 5, radius: 3)
                        .opacity(configuration.isPressed ? 0 : 1)
                }
            )
    }
}

extension Button {
    public func softButtonStyle<S: Shape>(_ content: S, shapeColor: Color = Color.Neumorphism.primaryColor, textColor: Color = Color.Neumorphism.secondaryColor, lightShadowColor: Color = Color.Neumorphism.lightShadow, darkShadowColor: Color = Color.Neumorphism.darkShadow, padding: CGFloat = 20) -> some View {
        self.buttonStyle(SoftUIButtonStyle(content, shapeColor: shapeColor, textColor: textColor, lightShadowColor: lightShadowColor, darkShadowColor: darkShadowColor, padding: padding))
    }
    
    public func extraSoftButtonStyle<S: Shape>(_ content: S, shapeColorStart: Color = Color.Neumorphism.gradientStart, shapeColorEnd: Color = Color.Neumorphism.gradientEnd, textColor: Color = Color.Neumorphism.secondaryColor, lightShadowColor: Color = Color.Neumorphism.lightShadow, darkShadowColor: Color = Color.Neumorphism.darkShadow, padding: CGFloat = 20) -> some View {
        self.buttonStyle(ExtraSoftUIButtonStyle(content, shapeColorStart: shapeColorStart, shapeColorEnd: shapeColorEnd, textColor: textColor, lightShadowColor: lightShadowColor, darkShadowColor: darkShadowColor, padding: padding))
    }
}
