//
//  FlyTransition.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/18/19.
// ✌️
//

import SwiftUI


struct FlyTransition {
    var completionPercentage: CGFloat
}


// MARK: - Animatable Data
extension FlyTransition {

    var animatableData: CGFloat {
        get { completionPercentage }
        set { completionPercentage = newValue }
    }
}


// MARK: - Computeds
extension FlyTransition {

}


// MARK: - GeometryEffect
extension FlyTransition: GeometryEffect {

    func effectValue(size: CGSize) -> ProjectionTransform {
        let rotationPct = completionPercentage
        let radians = CGFloat((.pi / 2) * (1 - rotationPct))
        
        var transform3D = CATransform3DIdentity
        transform3D.m34 = -1 / max(size.width, size.height)
        
        transform3D = CATransform3DRotate(transform3D, radians, 1, 0, 0)
        transform3D = CATransform3DTranslate(transform3D, -size.width/2.0, -size.height/2.0, 0)
        
        let affineTransform1 = ProjectionTransform(
            CGAffineTransform(
                translationX: size.width/2.0,
                y: size.height / 2.0
            )
        )
        
        let affineTransform2 = ProjectionTransform(
            CGAffineTransform(
                scaleX: CGFloat(rotationPct * 2),
                y: CGFloat(rotationPct * 2)
            )
        )
        
        
        if rotationPct <= 0.5 {
            return ProjectionTransform(transform3D)
                .concatenating(affineTransform2)
                .concatenating(affineTransform1)
        } else {
            return ProjectionTransform(transform3D)
                .concatenating(affineTransform1)
        }
        
    }
}

