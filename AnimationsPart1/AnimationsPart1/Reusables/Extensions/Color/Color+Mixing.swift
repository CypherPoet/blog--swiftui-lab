//
//  Color+Mix.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 12/7/19.
// ✌️
//

import SwiftUI


extension Color {
    
    /// Basic implementation of color interpolation
    static func interpolate(
        _ firstColor: UIColor,
        with secondColor: UIColor,
        percentage: CGFloat
    ) -> Color {
        guard let firstComponents = firstColor.cgColor.components else { return Color(firstColor) }
        guard let secondComponents = secondColor.cgColor.components else { return Color(secondColor) }
        
        let firstRed = firstComponents[0]
        let secondRed = secondComponents[0]
        
        let firstGreen = firstComponents[1]
        let secondGreen = secondComponents[1]
        
        let firstBlue = firstComponents[2]
        let secondBlue = secondComponents[2]
        
        return Color(
            red: Double((firstRed + (secondRed - firstRed)) * percentage),
            green: Double((firstGreen + (secondGreen - firstGreen)) * percentage),
            blue: Double((firstBlue + (secondBlue - firstBlue)) * percentage)
        )
    }
}
