//
//  AnyTransition+Stripes.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/20/19.
// ✌️
//

import SwiftUI



extension AnyTransition {
    
    static func stripes(count stripeCount: Int, isHorizontal: Bool) -> AnyTransition {
        let activeInsertionShape = StripeClipShape(
            completionPercentage: 1,
            stripeCount: stripeCount,
            isHorizontal: isHorizontal,
            isInsertion: true
        )
            
        let identityInsertionShape = StripeClipShape(
            completionPercentage: 0,
            stripeCount: stripeCount,
            isHorizontal: isHorizontal,
            isInsertion: true
        )
            
        let activeRemovalShape = StripeClipShape(
            completionPercentage: 1,
            stripeCount: stripeCount,
            isHorizontal: isHorizontal,
            isInsertion: false
        )
            
        let identityRemovalShape = StripeClipShape(
            completionPercentage: 0,
            stripeCount: stripeCount,
            isHorizontal: isHorizontal,
            isInsertion: false
        )
            
        
        return .asymmetric(
            insertion: AnyTransition.modifier(
                active: ShapeClipModifier(shape: activeInsertionShape),
                identity: ShapeClipModifier(shape: identityInsertionShape)
            ),
            removal: AnyTransition.modifier(
                active: ShapeClipModifier(shape: activeRemovalShape),
                identity: ShapeClipModifier(shape: identityRemovalShape)
            )
        )
    }
}

