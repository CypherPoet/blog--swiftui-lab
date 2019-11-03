//
//  TurnoverEffect.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 11/2/19.
// ✌️
//

import SwiftUI


struct TurnoverEffect {
    @Binding var isTurnedToFront: Bool

    var currentAngle: Angle
    
    let axis: (x: CGFloat, y: CGFloat)
}


// MARK: - Animatable Data
extension TurnoverEffect {
    var animatableData: Double {
        get { currentAngle.radians }
        set { currentAngle.radians = newValue }
    }
}


// MARK: - Computeds
extension TurnoverEffect {
    
    func computeIsTurnedToFront() -> Bool {
        currentAngle.radians < (.pi / 2) ||
        currentAngle.radians > (.pi * (3 / 2))
    }
}


// MARK: - GeometryEffect
extension TurnoverEffect: GeometryEffect {

    func effectValue(size: CGSize) -> ProjectionTransform {
        
        // Schedule the change to be done after the view has finished drawing.
        // Otherwise, we would receive a runtime error for changing
        // the state while the view is being drawn.
        DispatchQueue.main.async {
            self.isTurnedToFront = self.computeIsTurnedToFront()
        }
        
        let radians = CGFloat(currentAngle.radians)
        
        var transform3d = CATransform3DIdentity;
        transform3d.m34 = -1 / max(size.width, size.height)
        
        transform3d = CATransform3DRotate(transform3d, radians, axis.x, axis.y, 0)
        transform3d = CATransform3DTranslate(transform3d, -size.width/2.0, -size.height/2.0, 0)
        
        let affineTransform = ProjectionTransform(CGAffineTransform(translationX: size.width/2.0, y: size.height / 2.0))
        
        return ProjectionTransform(transform3d).concatenating(affineTransform)
    }
}
