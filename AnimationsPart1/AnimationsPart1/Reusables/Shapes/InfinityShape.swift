//
//  InfinityShape.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 11/3/19.
// ✌️
//

import SwiftUI


struct InfinityShape {
    let lineWidth: CGFloat
    
    init(lineWidth: CGFloat = 5.0) {
        self.lineWidth = lineWidth
    }
}



extension InfinityShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        Self.createInfinityPath(in: rect, lineWidth: lineWidth)
    }
}


extension InfinityShape {
    
    static func createInfinityPath(in rect: CGRect, lineWidth: CGFloat = 5.0) -> Path {
        let width = rect.width
        let height = rect.height
        
        var path = Path()
        

        path.move(to: CGPoint(x: width * 0.25, y: height * 0.75))
        path.addCurve(
            to: CGPoint(x: width * 0.25, y: height * 0.25),
            control1: CGPoint(x: 0, y: height * 0.75),
            control2: CGPoint(x: 0, y: height * 0.25)
        )

        
        path.move(to: CGPoint(x: width * 0.25, y: height * 0.25))
        path.addCurve(
            to: CGPoint(x: width * 0.75, y: height * 0.75),
            control1: CGPoint(x: width * 0.5, y: height * 0.25),
            control2: CGPoint(x: width * 0.5, y: height * 0.75)
        )

        
        path.move(to: CGPoint(x: width * 0.75, y: height * 0.75))
        path.addCurve(
            to: CGPoint(x: width * 0.75, y: height * 0.25),
            control1: CGPoint(x: width + lineWidth, y: height * 0.75),
            control2: CGPoint(x: width + lineWidth, y: height * 0.25)
        )

        
        path.move(to: CGPoint(x: width * 0.75, y: height * 0.25))
        path.addCurve(
            to: CGPoint(x: width * 0.25, y: height * 0.75),
            control1: CGPoint(x: width * 0.5, y: height * 0.25),
            control2: CGPoint(x: width * 0.5, y: height * 0.75)
        )

        
        return path
    }
}
