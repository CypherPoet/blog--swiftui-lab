//
//  View+WaveTextAnimation.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 12/6/19.
// ✌️
//

import SwiftUI


extension View {

    public func waveTextAnimation(
        text: String,
        waveWidth: CGFloat,
        fontSize: CGFloat,
        isFontScaled: Bool = false,
        completionPercentage: CGFloat = 0.0
    ) -> some View {
        self.modifier(
            WaveTextAnimation(
                text: text,
                waveWidth: waveWidth,
                fontSize: fontSize,
                isFontScaled: isFontScaled,
                completionPercentage: completionPercentage
            )
        )
    }

}
