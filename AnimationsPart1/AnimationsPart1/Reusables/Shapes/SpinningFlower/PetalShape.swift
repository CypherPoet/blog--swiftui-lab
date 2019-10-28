//
//  PetalShape.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 10/27/19.
// ✌️
//

import SwiftUI


struct PetalShape {
    let startAngle: Angle
    var arcAngle: Angle
    var length: Double
}


// MARK: - Computeds
extension PetalShape {

    func center(for rect: CGRect) -> CGPoint {
        CGPoint(x: rect.midX, y: rect.midY)
    }
    
    
    func hypotenuse(for rect: CGRect) -> Double {
        (Double(min(rect.size.width, rect.size.height)) / 2.0)
        * length
    }
}


// MARK: - Shape
extension PetalShape: Shape {

    func path(in rect: CGRect) -> Path {
        
        let center = self.center(for: rect)
        let hypotenuse = self.hypotenuse(for: rect)
        
        let midAngle = arcAngle / 2
        
        let startPoint = CGPoint(
            x: CGFloat(cos(startAngle.radians) * Double(hypotenuse)) + center.x,
            y: CGFloat(sin(startAngle.radians) * Double(hypotenuse)) + center.y
        )
        
        let controlPoint1 = CGPoint(
            x: CGFloat(cos((startAngle + midAngle).radians) * Double(hypotenuse)) + center.x,
            y: CGFloat(sin((startAngle + midAngle).radians) * Double(hypotenuse)) + center.y
        )
        
        let controlPoint2 = CGPoint(
            x: CGFloat(cos((startAngle - midAngle).radians) * Double(hypotenuse)) + center.x,
            y: CGFloat(sin((startAngle - midAngle).radians) * Double(hypotenuse)) + center.y
        )
        
        
        var path = Path()
        
        path.move(to: center)
        path.addQuadCurve(to: startPoint, control: controlPoint1)
        path.addQuadCurve(to: center, control: controlPoint2)
        
        return path
    }
}



// MARK: - AnimatableData
extension PetalShape {
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(arcAngle.radians, length)
        }
        set {
            arcAngle = .radians(newValue.first)
            length = newValue.second
        }
    }
}
