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
    var scale: Double
    var drawAsMesh: Bool
    
    /// The number of sides represented with its decimal part
    /// so we can animate any changes between whole-numbers of sides.
    private var sidesAsDouble: Double


    init(sides: Int, scale: Double = 1.0, drawAsMesh: Bool = false) {
        self.sides = sides
        self.sidesAsDouble = Double(sides)

        self.scale = scale
        self.drawAsMesh = drawAsMesh
    }
}


// MARK: - Computeds
extension PolygonShape {
        
    func hypotenuse(for rect: CGRect) -> Double {
        (Double(min(rect.size.width, rect.size.height)) / 2.0) * scale
    }
    
    
    func center(for rect: CGRect) -> CGPoint {
        CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
    }
    
    
    func angle(for side: Int) -> Angle {
        .radians((Double(side) / sidesAsDouble) * (2 * .pi))
    }
    
    
    func vertex(forSide side: Int, center: CGPoint, hypotenuse: Double) -> CGPoint {
        let angle = self.angle(for: side)
        
        return CGPoint(
            x: center.x + CGFloat(cos(angle.radians) * hypotenuse),
            y: center.y + CGFloat(sin(angle.radians) * hypotenuse)
        )
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
        
        var vertices: [CGPoint] = []
        var path = Path()
        
        for side in 0 ..< sidesToDraw {
            let vertex = self.vertex(forSide: side, center: center, hypotenuse: hypotenuse)
            
            if side == 0 {
                // move to the first vertex...
                path.move(to: vertex)
            } else {
                // ... or draw a line to the next vertex
                path.addLine(to: vertex)
            }
            
            if drawAsMesh { vertices.append(vertex) }
        }
        
        path.closeSubpath()
        
        if drawAsMesh {
            drawMeshLines(path: &path, vertices: vertices)
        }
        
        return path
    }
}


// MARK: - Private Helpers
extension PolygonShape {
    
    private func drawMeshLines(
        path: inout Path,
        vertices: [CGPoint],
        startingVertexIndex: Int = 0
    ) {
        let vertexCount = vertices.count
        
        // We need to have a vertex other than the starting point and its
        // adjacent vertex (which is already drawn as the perimeter)
        guard vertexCount - startingVertexIndex > 2 else { return }

        let startingVertex = vertices[startingVertexIndex]
        
        for vertexOffset in 2 ..< vertexCount {
            let targetVertex = vertices[(startingVertexIndex + vertexOffset) % vertexCount]
            
            path.move(to: startingVertex)
            path.addLine(to: targetVertex)
        }
        
        drawMeshLines(path: &path, vertices: vertices, startingVertexIndex: startingVertexIndex + 1)
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
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(sidesAsDouble, scale) }
        
        set {
            sidesAsDouble = newValue.first
            scale = newValue.second
        }
    }
    
}
    
