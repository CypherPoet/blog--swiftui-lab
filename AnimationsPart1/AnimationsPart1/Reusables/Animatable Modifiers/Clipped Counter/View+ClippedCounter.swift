//
//  View+ClippedCounter.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 12/6/19.
// ✌️
//

import SwiftUI


extension View {

    public func clippedCounter(
        currentNumber: Double
    ) -> some View {
        self.modifier(
            ClippedCounter(
                currentNumber: currentNumber
            )
        )
    }

}
