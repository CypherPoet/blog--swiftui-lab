//
//  AnyTransition+Circular.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/19/19.
// ✌️
//

import SwiftUI


extension AnyTransition {
    
    static var circular: AnyTransition {
        get {
            AnyTransition.modifier(
                active: ShapeClipModifier(shape: CircleClipShape(completionPercentage: 1)),
                identity: ShapeClipModifier(shape: CircleClipShape(completionPercentage: 0))
            )
        }
    }
}

