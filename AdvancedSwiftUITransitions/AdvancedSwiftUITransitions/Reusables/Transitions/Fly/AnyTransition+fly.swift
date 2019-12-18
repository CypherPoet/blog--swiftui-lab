//
//  Fly.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/18/19.
// ✌️
//

import SwiftUI


extension AnyTransition {
    
    static var fly: AnyTransition {
        get {
            AnyTransition.modifier(
                active: FlyTransition(completionPercentage: 0),
                identity: FlyTransition(completionPercentage: 1)
            )
        }
    }
}
