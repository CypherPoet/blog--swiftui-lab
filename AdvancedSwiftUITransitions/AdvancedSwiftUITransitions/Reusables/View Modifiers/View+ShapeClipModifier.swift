//
//  View+ShapeClipModifier.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/19/19.
// ✌️
//

import SwiftUI


extension View {

    public func shapeClipModifier<S: Shape>(
        shape: S
    ) -> some View {
        modifier(
            ShapeClipModifier(
                shape: shape
            )
        )
    }

}
