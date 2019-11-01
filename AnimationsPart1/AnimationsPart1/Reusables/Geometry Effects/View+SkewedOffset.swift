//
//  View+SkewedOffset.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 11/1/19.
// ✌️
//

import SwiftUI


extension View {
    
    public func skewedOffset(
        offset: CGFloat,
        animationPct: CGFloat
    ) -> some View {
        modifier(SkewedOffset(
            currentOffset: offset,
            animationPct: animationPct,
            direction: offset > 0 ? .right : .left
        ))
    }
}
