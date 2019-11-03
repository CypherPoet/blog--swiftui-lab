//
//  View+Turnover.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 11/2/19.
// ✌️
//

import SwiftUI


extension View {
    
    public func turnoverEffect(
        isTurnedToFront: Binding<Bool>,
        currentAngle: Angle,
        axis: (x: CGFloat, y: CGFloat)
    ) -> some View {
        modifier(TurnoverEffect(
            isTurnedToFront: isTurnedToFront,
            currentAngle: currentAngle,
            axis: axis
        ))
    }
}
