//
//  WaveTextAnimation.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 12/6/19.
// ✌️
//

import SwiftUI
import CypherPoetSwiftUIKit_ViewModifiers


struct WaveTextAnimation {
    let text: String
    let waveWidth: CGFloat
    
    /// Base font size
    let fontSize: CGFloat
    var isFontScaled: Bool = false
    
    var completionPercentage: CGFloat = 0.0
}


// MARK: - Animatable Data
extension WaveTextAnimation {
    
    var animatableData: CGFloat {
        get { completionPercentage }
        set { completionPercentage = newValue }
    }
}



// MARK: - AnimatableModifier
extension WaveTextAnimation: AnimatableModifier {

    func body(content: Content) -> some View {
        let characterCount = text.count
        
        return HStack(spacing: 0) {
            ForEach(characterPairs, id: \.0) { (index, character) in
                Text(String(character))
                    .font(.custom("Futura", size: self.fontSize))
                    .conditionallyApply(ScaledFont(name: "Futura", size: self.fontSize), if: self.isFontScaled)
                    .scaleEffect(self.scaleEffect(atIndex: index, outOf: characterCount))
            }
        }
    }
}

// MARK: - Computeds
extension WaveTextAnimation {
    var characterPairs: [(Int, Character)] { Array(text.enumerated()) }
    
    var characterCount: Int { text.count }
    
    /// Portion of the text to target for scaling
    var chunkSize: CGFloat { waveWidth / CGFloat(characterCount) }
}


extension WaveTextAnimation {
    
    func scaleEffect(
        atIndex characterIndex: Int,
        outOf characterCount: Int
    ) -> CGFloat {
        1.0 + valueInCurve(atIndex: characterIndex, outOf: characterCount)
    }
    
    
    func valueInCurve(
        atIndex characterIndex: Int,
        outOf characterCount: Int
    ) -> CGFloat {
        let m = 1 / chunkSize
        let offset = (chunkSize - (1 / CGFloat(characterCount))) * completionPercentage
        
        let lowerLimit = (completionPercentage - chunkSize) + offset
        let upperLimit = completionPercentage + offset
        
        let chracterCompletionPercentage = CGFloat(characterIndex) / CGFloat(characterCount)
        
        guard
            chracterCompletionPercentage >= lowerLimit &&
            chracterCompletionPercentage < upperLimit
        else { return 0 }
        
        let radians = (
            ((chracterCompletionPercentage - completionPercentage - offset) * m * (2 * .pi))
            - (.pi / 2)
        )
        
        return (sin(radians) + 1) / 2
    }
}


// MARK: - Preview
struct WaveTextAnimation_Previews: PreviewProvider {

    static var previews: some View {
        EmptyView()
    }
}
