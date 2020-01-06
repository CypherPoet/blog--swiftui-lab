//
//  CircleArcClipShape.swift
//  StateChanges
//
//  Created by CypherPoet on 1/5/20.
// ✌️
//


import SwiftUI

/// A clip shape that defines its bounds with a circular arc -- whose
/// circumference extends to a full circle according to a `completionPercentage`.
struct CircleArcClipShape {
    var completionPercentage: CGFloat
}


// MARK: - AnimatableData
extension CircleArcClipShape {

    var animatableData: CGFloat {
        get { completionPercentage }
        set { completionPercentage = newValue }
    }
}


// MARK: - Shape
extension CircleArcClipShape: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        path.move(to: center)
        
        path.addArc(
            center: center,
            radius: rect.width / 2,
            startAngle: .radians(0),
            endAngle: .radians((.pi * 2) * Double(completionPercentage)),
            clockwise: false
        )
        
        path.closeSubpath()
        
        return path
    }
}


// MARK: - Computeds
extension CircleArcClipShape {
}


// MARK: - Private Helpers
extension CircleArcClipShape {
}
