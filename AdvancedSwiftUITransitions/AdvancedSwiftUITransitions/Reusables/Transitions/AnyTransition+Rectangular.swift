//
//  AnyTransition+Rectangular.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/20/19.
// ✌️
//

import SwiftUI


extension AnyTransition {
    
    static var rectangular: AnyTransition {
        get {
            AnyTransition.modifier(
                active: ShapeClipModifier(shape: RectangleClipShape(completionPercentage: 1)),
                identity: ShapeClipModifier(shape: RectangleClipShape(completionPercentage: 0))
            )
        }
    }
}
