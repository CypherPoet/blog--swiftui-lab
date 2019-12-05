//
//  View+AnimatableGradient.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 12/5/19.
// ✌️
//

import SwiftUI


extension View {

    public func animatableGradient(
        startColors: [UIColor],
        endColors: [UIColor],
        cornerRadius: CGFloat = 14.0,
        percentage completionPercentage: CGFloat = 0.0
    ) -> some View {
        let (startColors, endColors) = colorsToTake(from: startColors, and: endColors)

        return self.modifier(
            AnimatableGradient(
                startColors: startColors,
                endColors: endColors,
                cornerRadius: cornerRadius,
                percentage: completionPercentage
            )
        )
    }
    
     
    /// Helper to gracefully fall back from unequal color counts
    /// by using the minimum amount of possible colors.
    private func colorsToTake(
        from startColors: [UIColor],
        and endColors: [UIColor]
    ) -> (start: [UIColor], end: [UIColor]) {
        let startCount = startColors.count
        let endCount = endColors.count
        
        if startCount == endCount {
            return (startColors, endColors)
        } else {
            let colorsToTake = min(startCount, endCount)
            let trimmedStartColors = Array(startColors.dropLast(startCount - colorsToTake))
            let trimmedEndColors = Array(endColors.dropLast(endCount - colorsToTake))
            
            
            return (trimmedStartColors, trimmedEndColors)
        }
    }
}
