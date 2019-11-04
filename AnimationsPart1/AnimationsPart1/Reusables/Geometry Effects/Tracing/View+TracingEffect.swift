//
//  View+TracingEffect.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 11/3/19.
// ✌️
//

import SwiftUI


extension View {
    
    public func tracingEffect(
        path pathToTrace: Path,
        animationPct: CGFloat = 0.0,
        orientToPath: Bool = true
    ) -> some View {
        modifier(TracingEffect(
            pathToTrace: pathToTrace,
            animationPct: animationPct,
            orientToPath: orientToPath
        ))
    }
}
