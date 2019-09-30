//
//  RoundedCorners.swift
//  GeometryReaderToTheRescue
//
//  Created by Brian Sipple on 9/30/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct RoundedCorners: View {
    /// top Left radius
    var topLeft: CGFloat = 0
    
    /// top Right radius
    var topRight: CGFloat = 0
    
    /// bottom Right radius
    var bottomRight: CGFloat = 0
    
    /// bottom Left radius
    var bottomLeft: CGFloat = 0

    var backgroundColor: Color = .green
    
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                
                // Make sure the radius does not exceed the bounds dimensions
                let topLeftRadius = min(min(self.topLeft, height / 2), width / 2)
                let topRightRadius = min(min(self.topRight, height / 2), width / 2)
                let bottomRightRadius = min(min(self.bottomRight, height / 2), width / 2)
                let bottomLeftRadius = min(min(self.bottomLeft, height / 2), width / 2)
                
                path.move(to: CGPoint(x: width / 2.0, y: 0))
                
                path.addLine(to: CGPoint(x: width - topRightRadius, y: 0))
                path.addArc(
                    center: CGPoint(x: width - topRightRadius, y: topRightRadius),
                    radius: topRightRadius,
                    startAngle: .radians((.pi / 2) * -1),
                    endAngle: .radians(0),
                    clockwise: false
                )
                
                path.addLine(to: CGPoint(x: width, y: height - bottomRightRadius))
                path.addArc(
                    center: CGPoint(x: width - bottomRightRadius, y: height - bottomRightRadius),
                    radius: bottomRightRadius,
                    startAngle: .radians(0),
                    endAngle: .radians(.pi / 2),
                    clockwise: false
                )
                
                
                path.addLine(to: CGPoint(x: bottomLeftRadius, y: height))
                path.addArc(
                    center: CGPoint(x: bottomLeftRadius, y: height - bottomLeftRadius),
                    radius: bottomLeftRadius,
                    startAngle: .radians(.pi / 2),
                    endAngle: .radians((.pi / 2) * 2),
                    clockwise: false
                )
                
                
                path.addLine(to: CGPoint(x: 0, y: topLeftRadius))
                path.addArc(
                    center: CGPoint(x: topLeftRadius, y: topLeftRadius),
                    radius: topLeftRadius,
                    startAngle: .radians((.pi / 2) * 2),
                    endAngle: .radians((.pi / 2) * 3),
                    clockwise: false
                )
            }
            .fill(self.backgroundColor)
        }
    }
}

struct RoundedCorners_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCorners()
    }
}
