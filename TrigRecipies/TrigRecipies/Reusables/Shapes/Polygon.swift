//
//  Polygon.swift
//  TrigRecipies
//
//  Created by CypherPoet on 11/11/19.
// ✌️
//


import SwiftUI
import CypherPoetMathUtils_Trig


struct Polygon {
    var sideCount: Int
    var scale: CGFloat
    var drawAsMesh: Bool
    
    /// The number of sides represented with its decimal part
    /// so we can animate any changes between whole-numbers of sides.
    private var sideCountAsFloat: CGFloat
    
    
    init(
        sideCount: Int,
        scale: CGFloat = 1,
        drawAsMesh: Bool = false
    ) {
        self.sideCount = sideCount
        self.scale = scale
        self.drawAsMesh = drawAsMesh
        
        self.sideCountAsFloat = CGFloat(sideCount)
    }
    
}


// MARK: - AnimatableData
extension Polygon: Animatable {

    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get {
            AnimatablePair(sideCountAsFloat, scale)
        }
        set {
            sideCountAsFloat = newValue.first
            scale = newValue.second
        }
    }
}


// MARK: - Shape
extension Polygon: Shape {

    func path(in rect: CGRect) -> Path {
        precondition(sideCount > 0)
        
        let center = self.center(in: rect)
        let hypotenuse = self.hypotenuse(in: rect)
        
        var vertices: [CGPoint] = []
        var path = Path()
        
        for index in (0 ..< sidesToDraw) {
            let angle = Double(index) * ((2 * .pi) / Double(sideCountAsFloat))
            let vertex = point(from: center, atDistance: hypotenuse, inDirection: .radians(angle))
            
            if index == 0 {
                // move to the first vertex
                path.move(to: vertex)
            } else {
                // draw a line to the next vertex
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


// MARK: - Computeds
extension Polygon {

    ///As the decimal part of the newest side grows, this side will go from zero to its full length.
    private var sidesToDraw: Int { Int(ceil(sideCountAsFloat)) }


    /// A hypotenuse computed to fit inside the available rect
    func hypotenuse(in rect: CGRect) -> CGFloat {
        (min(rect.size.width, rect.size.height) / 2.0) * scale
    }
    
    
    func center(in rect: CGRect) -> CGPoint {
        CGPoint(x: rect.width / 2, y: rect.height / 2)
    }
}


// MARK: - Private Helpers
extension Polygon {
    
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
