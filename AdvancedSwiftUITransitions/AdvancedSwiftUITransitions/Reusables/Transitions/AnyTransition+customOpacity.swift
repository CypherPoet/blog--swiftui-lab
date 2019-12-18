//
//  AnyTransition+customOpacity.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/18/19.
// ✌️
//

import SwiftUI


// 🔑 Internally, both standard and custom transitions work in the same way.
//
// They need a modifier for the beginning and the end of the animation.
// SwiftUI will figure out the rest, provided the difference between both modifiers is animatable.

extension AnyTransition {
    
    static var customOpacity: AnyTransition {
        get {
            AnyTransition.modifier(
                active: CustomOpacityModifier(opacity: 0),
                identity: CustomOpacityModifier(opacity: 1)
            )
        }
    }
}



struct CustomOpacityModifier {
    var opacity: Double
}


extension CustomOpacityModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content.opacity(opacity)
    }
}
