//
//  PolygonShape.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 10/23/19.
// ✌️
//

import SwiftUI


struct PolygonShape {
    var sides: Int
    
    /// The number of sides represented with its decimal part
    /// so we can animate any changes between whole-numbers of sides.
    private var sidesAsDouble: Double
    

    init(sides: Int) {
        self.sides = sides
        self.sidesAsDouble = Double(sides)
    }
}


// MARK: - Computeds
extension PolygonShape {
        
    func hypotenuse(for rect: CGRect) -> Double {
        Double(min(rect.size.width, rect.size.height)) / 2.0
    }
    
    func center(for rect: CGRect) -> CGPoint {
        CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
    }
    
    
    ///As the decimal part of the newest side grows, this side will go from zero to its full length.
    var sidesToDraw: Int { Int(ceil(sidesAsDouble)) }
}


// MARK: - Shape
extension PolygonShape: Shape {
    
    ///Draws a polygon with a non-integer number of sides.
    ///
    /// As the decimal part of the newest side grows, this side will go from zero to its full length.
    /// The other vertices will smoothly reposition accordingly.
    func path(in rect: CGRect) -> Path {
        let hypotenuse = self.hypotenuse(for: rect)
        let center = self.center(for: rect)
        
        var path = Path()
        
        for i in 0 ..< sidesToDraw {
            let angle = (Double(i) / sidesAsDouble) * (2 * .pi)
            
            // Calculate vertex position
            let vertex = CGPoint(
                x: center.x + CGFloat(cos(angle) * hypotenuse),
                y: center.y + CGFloat(sin(angle) * hypotenuse)
            )
            
            if i == 0 {
                // move to the first vertex...
                path.move(to: vertex)
            } else {
                // ... or draw a line to the next vertex
                path.addLine(to: vertex)
            }
        }
        
        path.closeSubpath()
        
        return path
    }
}




// MARK: - Animatable
extension PolygonShape: Animatable {

    // To make the shape animatable, we need SwiftUI to render the view multiple times,
    // using all the side values between the origin to the destination number.
    //
    // Fortunately, Shape already conforms to the Animatable protocol. This means there is a computed
    // property (animatableData) that we can use to handle this task.
    //
    // Its default implementation, however, is set to EmptyAnimatableData. So it does nothing.
    
    var animatableData: Double {
        get { sidesAsDouble }
        set { sidesAsDouble = newValue }
    }
    
}
    
