//
//  CompassNeedleRotationEffect.swift
//  StateChanges
//
//  Created by CypherPoet on 1/23/20.
// ✌️
//

import SwiftUI


struct CompassNeedleRotationEffect {
    @Binding var cardinalDirection: CompassDirection
    var angle: Angle
}


// MARK: - Animatable Data
extension CompassNeedleRotationEffect {
    
    var animatableData: Double {
        get { angle.radians }
        set { self.angle = .radians(newValue) }
    }
}


// MARK: - Computeds
extension CompassNeedleRotationEffect {}


// MARK: - GeometryEffect
extension CompassNeedleRotationEffect: GeometryEffect {

    func effectValue(size: CGSize) -> ProjectionTransform {
        DispatchQueue.main.async {
            // This will be called as many times as the frame rate allows, while the body owning
            // the state of the binding will only be called if the wrappedValue changed.
//            print("CompassNeedleRotationEffect | effectValue | cardinalDirection = \(self.cardinalDirection)")
            self.cardinalDirection = CompassDirection(from: self.angle)
        }
        
//        print("Angle: \(angle.radians) radians")
        let rotation = CGAffineTransform(rotationAngle: CGFloat(angle.radians))
        
        let offset1 = CGAffineTransform(translationX: size.width / 2.0, y: size.height / 2.0)
        let offset2 = CGAffineTransform(translationX: -size.width / 2.0, y: -size.height / 2.0)
        
        return ProjectionTransform(
            offset2
                .concatenating(rotation)
                .concatenating(offset1)
        )
    }
}

