//
//  AnimatableGradient.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 12/5/19.
// ✌️
//

import SwiftUI
import UIKit


struct AnimatableGradient {
    let startColors: [UIColor]
    let endColors: [UIColor]
    
    var cornerRadius: CGFloat = 12.0
    var percentage: CGFloat = 0.0
}


// MARK: - Animatable Data
extension AnimatableGradient {
    
    var animatableData: CGFloat {
        get { percentage }
        set { percentage = newValue }
    }
}


// MARK: - AnimatableModifier
extension AnimatableGradient: AnimatableModifier {

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: self.cornerRadius)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: self.gradientColors),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}



// MARK: - Computeds
extension AnimatableGradient {
    
    var gradientColors: [Color] {
        (0 ..< startColors.count).map { index in
            mix(startColors[index], with: endColors[index], percentage: percentage)
        }
    }
}


extension AnimatableGradient {
    
    /// To interpolate the intermediate colors,
    /// we simply calculate an average of its RGB values.
    func mix(_ firstColor: UIColor, with secondColor: UIColor, percentage: CGFloat) -> Color {
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



// MARK: - Preview
struct AnimatableGradient_Previews: PreviewProvider {

    static var previews: some View {
        EmptyView()
    }
}
