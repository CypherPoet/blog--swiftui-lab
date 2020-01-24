//
//  CompassDirection.swift
//  StateChanges
//
//  Created by CypherPoet on 1/23/20.
// ✌️
//

import Foundation
import SwiftUI


public enum CompassDirection {
    case north
    case east
    case south
    case west
}


extension CompassDirection: CaseIterable {}


extension CompassDirection {
    
    init(from angle: Angle, clockwise: Bool = true) {
        let quadrant: Double = .pi / 2
        
        switch angle.radians.truncatingRemainder(dividingBy: (quadrant * 4)) {
        case 0 ..< quadrant:
            self = .north
        case quadrant ..< quadrant * 2:
            self = clockwise ? .east : .west
        case quadrant * 2 ..< quadrant * 3:
            self = .south
        case quadrant * 3 ..< quadrant * 4:
            self = clockwise ? .west : .east
        default:
            self = .north
        }
    }
}


extension CompassDirection {
    
    public var displayText: String {
        switch self {
        case .north:
            return "North"
        case .east:
            return "East"
        case .south:
            return "South"
        case .west:
            return "West"
        }
    }
}
