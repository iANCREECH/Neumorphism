//
//  Colors.swift
//  
//  Copyright © 2022 Ian Creech. All rights reserved.
//  Created by Ian Creech on 1/31/22.
//  Neumorphism UI Package

import SwiftUI

@available(macOS 10.15, *)
@available(iOS 13.0, *)
public extension Color {
    
    struct Neumorphism {
        // Light theme
        private static let lightThemePrimaryColor = NeumorphismKit.packageColor(red: 248/255, green: 248/255, blue: 255/255)
        private static let lightThemeSecondaryColor = NeumorphismKit.packageColor(red: 169/255, green: 169/255, blue: 169/255)
        private static let lightThemeLightShadow = NeumorphismKit.packageColor(red: 1.0, green: 1.0, blue: 1.0)
        private static let lightThemeDarkShadow = NeumorphismKit.packageColor(red: 211/255, green: 211/255, blue: 220/255)
        // Light theme gradient
        private static let lightGradientStart = NeumorphismKit.packageColor(red: 223/255, green: 223/255, blue: 230/255)
        private static let lightGradientEnd = NeumorphismKit.packageColor(red: 1.0, green: 1.0, blue: 1.0)
        // Dark theme
        private static let darkThemePrimaryColor = NeumorphismKit.packageColor(red: 36/255, green: 37/255, blue: 38/255)
        private static let darkThemeSecondaryColor = NeumorphismKit.packageColor(red: 248/255, green: 248/255, blue: 255/255)
        private static let darkThemeLightShadow = NeumorphismKit.packageColor(red: 46/255, green: 46/255, blue: 56/255)
        private static let darkThemeDarkShadow = NeumorphismKit.packageColor(red: 26/255, green: 27/255, blue: 27/255)
        // Dark theme gradient
        private static let darkGradientStart = NeumorphismKit.packageColor(red: 39/255, green: 40/255, blue: 41/255)
        private static let darkGradientEnd = NeumorphismKit.packageColor(red: 32/255, green: 33/255, blue: 34/255)
        
        // perhaps some more colors to come...
        
        
        // Getting and setting the current color scheme
        public static var currentColorScheme: NeumorphismKit.ColorScheme {
            get {
                return NeumorphismKit.currentColorScheme
            } set {
                NeumorphismKit.currentColorScheme = newValue
            }
        }
        
        // Setting colors based on the current color scheme
        public static var primaryColor: Color {
            NeumorphismKit.color(light: lightThemePrimaryColor, dark: darkThemePrimaryColor)
        }
        
        public static var secondaryColor: Color {
            NeumorphismKit.color(light: lightThemeSecondaryColor, dark: darkThemeSecondaryColor)
        }
        
        public static var lightShadow: Color {
            NeumorphismKit.color(light: lightThemeLightShadow, dark: darkThemeLightShadow)
        }
        
        public static var darkShadow: Color {
            NeumorphismKit.color(light: lightThemeDarkShadow, dark: darkThemeDarkShadow)
        }
        
        public static var gradientStart: Color {
            NeumorphismKit.color(light: lightGradientStart, dark: lightGradientEnd)
        }
        
        public static var gradientEnd: Color {
            NeumorphismKit.color(light: lightGradientEnd, dark: darkGradientEnd)
        }
    }
}
