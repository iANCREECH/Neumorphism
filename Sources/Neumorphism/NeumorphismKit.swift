//
//  NeumorphismKit.swift
//  
//  Copyright © 2022 Ian Creech. All rights reserved.
//  Created by Ian Creech on 1/31/22.
//  Neumorphism UI Package

import SwiftUI

public struct NeumorphismKit {
    
    public enum ColorScheme {
        case auto, light, dark
    }
    
    public static var currentColorScheme: ColorScheme = .auto
    
#if os(macOS)
    public typealias PackageColorType = NSColor
    
    public static func packageColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> PackageColorType {
        .init(red: red, green: green, blue: blue, alpha: 1.0)
    }
#else
    public typealias PackageColorType = UIColor
    
    public static func packageColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> PackageColorType {
        .init(red: red, green: green, blue: blue, alpha: 1.0)
    }
#endif
    
    
    @available(macOS 10.15, *)
    @available(iOS 13.0, *)
    public static func color(light: PackageColorType, dark: PackageColorType) -> Color {
#if os(iOS)
        switch NeumorphismKit.currentColorScheme {
        case .light:
            return Color(light)
        case .dark:
            return Color(dark)
        case .auto:
            return Color(.init { $0.userInterfaceStyle == .light ? light: dark })
        }
#else
        switch NeumorphismKit.currentColorScheme {
        case .light:
            return Color(light)
        case .dark:
            return Color(dark)
        case .auto:
            return Color(.init(name: nil, dynamicProvider: { (appearance) -> NSColor in
                return appearance.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua ? dark : light
            }))
        }
#endif
    }
    
}
