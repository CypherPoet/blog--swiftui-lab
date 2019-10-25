//
//  ClockShape.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 10/24/19.
// ✌️
//

import SwiftUI


struct ClockShape {
    var time: ClockTime
}


extension ClockShape {
    enum Hand {
        case hour
        case minute
        case second
    }
}


// MARK: - Computeds
extension ClockShape {
    
    private func radius(in rect: CGRect) -> CGFloat {
        min(rect.size.width, rect.size.height) / 2.0
    }
    
    
    private func center(in rect: CGRect) -> CGPoint {
        CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
    }
    
    
    private func hypotenuse(in rect: CGRect, for hand: Hand) -> CGFloat {
        switch hand {
        case .hour:
            return radius(in: rect) * 0.5
        case .minute:
            return radius(in: rect) * 0.7
        case .second:
            return radius(in: rect) * 0.9
        }
    }
    
    
    private func angle(for hand: Hand) -> Angle {
        switch hand {
        case .hour:
            return .radians( ((Double(time.hours) / 12) * (2.0 * .pi)) - (.pi / 2.0) )
        case .minute:
            return .radians( ((Double(time.minutes) / 60) * (2.0 * .pi)) - (.pi / 2.0) )
        case .second:
            return .radians( ((Double(time.seconds) / 60) * (2.0 * .pi)) - (.pi / 2.0) )
        }
    }
    
    
    private func endpoint(for hand: Hand, in rect: CGRect) -> CGPoint {
        let angle = self.angle(for: hand).radians
        let center = self.center(in: rect)

        return CGPoint(
            x: center.x + CGFloat(cos(angle)) * hypotenuse(in: rect, for: hand),
            y: center.y + CGFloat(sin(angle)) * hypotenuse(in: rect, for: hand)
        )
    }
}


// MARK: - Shape
extension ClockShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let center = self.center(in: rect)
        
        path.addArc(
            center: center,
            radius: radius(in: rect),
            startAngle: .radians(0),
            endAngle: .radians(2 * .pi),
            clockwise: true
        )
        
        
        // Hour Hand
        path.move(to: center)
        path.addLine(to: endpoint(for: .hour, in: rect))
        path = path.strokedPath(StrokeStyle(lineWidth: 3.0))

        
        // Minute Hand
        path.move(to: center)
        path.addLine(to: endpoint(for: .minute, in: rect))
        path = path.strokedPath(StrokeStyle(lineWidth: 3.0))
        
        
        // Second Hand
        path.move(to: center)
        path.addLine(to: endpoint(for: .second, in: rect))
        path = path.strokedPath(StrokeStyle(lineWidth: 1.0))

        
        return path
    }
}


// MARK: - Animatable
extension ClockShape: Animatable {
    
    var animatableData: ClockTime {
        get { time }
        set { time = newValue }
    }
}


// MARK: - Private Helpers
extension ClockShape {

}
