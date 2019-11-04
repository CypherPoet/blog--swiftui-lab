//
//  LayoutIgnorableOffsetEffect.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 11/4/19.
// ✌️
//

import SwiftUI


struct LayoutIgnorableOffsetEffect {
    var offsetX: CGFloat = 0.0
    var offsetY: CGFloat = 0.0
}


// MARK: - Animatable Data
extension LayoutIgnorableOffsetEffect {
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { AnimatablePair(offsetX, offsetY) }
        set {
            offsetX = newValue.first
            offsetY = newValue.second
        }
    }
}


// MARK: - Computeds
extension LayoutIgnorableOffsetEffect {

}


// MARK: - GeometryEffect
extension LayoutIgnorableOffsetEffect: GeometryEffect {

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: offsetX, y: offsetY))
    }
}

