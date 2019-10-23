//: [Previous](@previous)

import Foundation
import SwiftUI


func printInterpolation(from: Double, to: Double, steps: Int = 5) {
    
    for i in 0 ..< steps {
        let pct = Double(i) / Double(steps)

        var currentDistance = to - from
        currentDistance.scale(by: pct)
        
        let interpolation = from + currentDistance
        
        print("interpolation: \(interpolation)")
    }
}


printInterpolation(from: 0.3, to: 0.9)

//: [Next](@next)
