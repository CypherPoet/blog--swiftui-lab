//
//  DashedRingLoader.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 12/4/19.
// ✌️
//

import SwiftUI


struct DashedRingLoader {
    var percentage: CGFloat = 0.0

    var ringColor: Color = .primary

    var labelFont: Font = .largeTitle
    var labelFontWeight: Font.Weight = .bold
    var labelColor: Color = .primary
}


// MARK: - Animatable Data
extension DashedRingLoader {
    
    var animatableData: CGFloat {
        get { percentage }
        set { percentage = newValue }
    }
}


// MARK: - AnimatableModifier
extension DashedRingLoader: AnimatableModifier {
    
    func body(content: Content) -> some View {
        content
            .overlay(
                CompletionArc(percentage: percentage)
                    .foregroundColor(ringColor)
            )
            .overlay(
                PercentageLabel(
                    percentage: percentage,
                    font: labelFont,
                    fontWeight: labelFontWeight
                )
                .foregroundColor(labelColor)
            )
    }
}



// MARK: - Preview
struct ClippedRingLoader_Previews: PreviewProvider {

    static var previews: some View {
        EmptyView()
    }
}
