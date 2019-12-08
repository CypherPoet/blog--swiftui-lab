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
            Color.interpolate(startColors[index], with: endColors[index], percentage: percentage)
        }
    }
}




// MARK: - Preview
struct AnimatableGradient_Previews: PreviewProvider {

    static var previews: some View {
        EmptyView()
    }
}
