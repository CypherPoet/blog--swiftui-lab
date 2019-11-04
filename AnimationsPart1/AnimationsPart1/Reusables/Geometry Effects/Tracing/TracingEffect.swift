//
//  TracingEffect.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 11/3/19.
// ✌️
//

import SwiftUI


struct TracingEffect {
    
    /// The path to follow
    let pathToTrace: Path
    
    /// A percentage (between 0.0 and 1.0) representing the position of a view along
    /// the path that its tracing.
    var animationPct: CGFloat = 0.0
    
    var orientToPath: Bool = true
    
    /// The distance between the two points we'll use to estimate the view's
    /// current rotation angle on the path
    private let rotationPointPercentageDiff: CGFloat = 0.01
    
    /// The distance between the two points we'll use to estimate the view's
    /// current bounds on the path
    private let boundsPointPercentageDiff: CGFloat = 0.001
}


// MARK: - Animatable Data
extension TracingEffect {
    
    var animatableData: CGFloat {
        get { animationPct }
        set { animationPct = newValue }
    }
}


// MARK: - Computeds
extension TracingEffect {

}


// MARK: - GeometryEffect
extension TracingEffect: GeometryEffect {

    func effectValue(size: CGSize) -> ProjectionTransform {
        let startPoint = point(for: animationPct)
        let transform = CGAffineTransform(translationX: startPoint.x, y: startPoint.y)
        
        guard orientToPath else { return ProjectionTransform(transform) }
        
        // Get the x and y position of two points:
        //  - the current position
        //  - the position just a little before now.
        let endPoint = point(for: animationPct - rotationPointPercentageDiff)
        let direction = self.direction(between: startPoint, and: endPoint)
        let rotation = CGFloat(direction.radians)
        
        return ProjectionTransform(transform.rotated(by: rotation))
    }
}




// MARK: - Private Helpers
extension TracingEffect {
    
    func trimmedPath(for animationPercentage: CGFloat) -> Path {
        // handle percentage limits
        let animationPercentage = animationPercentage > 1 ?
            0 :
            (animationPercentage < 0 ? 1 : animationPercentage)
        
        let boundsDistance: CGFloat = boundsPointPercentageDiff
        let completionPercentage: CGFloat = 1 - boundsDistance
        
        let boundsStart = min(animationPercentage, completionPercentage)
        let boundsEnd = animationPercentage > completionPercentage ? CGFloat(1) : animationPercentage + boundsDistance
        
        return pathToTrace.trimmedPath(from: boundsStart, to: boundsEnd)
    }

    
    /// Using very tight bounds for `Path.trimmedPath()`, we can take the center of
    /// that paths' `boundingRect` as our x and y position
    func point(for animationPercentage: CGFloat) -> CGPoint {
        let trimmedPath = self.trimmedPath(for: animationPercentage)
        
        return CGPoint(x: trimmedPath.boundingRect.midX, y: trimmedPath.boundingRect.midY)
    }
    
    
    func direction(between point1: CGPoint, and point2: CGPoint) -> Angle {
        let xDist = point2.x - point1.x
        let yDist = point2.y - point1.y
        
        let angle = xDist < 0 ?
            atan(Double(yDist / xDist)) :
            atan(Double(yDist / xDist)) - .pi
        
        return .radians(angle)
    }
}
