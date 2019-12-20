//
//  CircleClipShape.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/19/19.
// ✌️
//


import SwiftUI


struct CircleClipShape {
    var completionPercentage: CGFloat
}


// MARK: - AnimatableData
extension CircleClipShape {

    var animatableData: CGFloat {
        get { completionPercentage }
        set { completionPercentage = newValue }
    }
}


// MARK: - Shape
extension CircleClipShape: Shape {

    func path(in rect: CGRect) -> Path {
        let coveringRect = CGRect(
            x: rect.minX,
            y: rect.minY,
            width: rect.width * 2 * (1 - completionPercentage),
            height: rect.height * 2 * (1 - completionPercentage)
        )
        .offsetBy(dx: -rect.width / 2, dy: -rect.height / 2)
        
        return Circle().path(in: coveringRect)
    }
}
