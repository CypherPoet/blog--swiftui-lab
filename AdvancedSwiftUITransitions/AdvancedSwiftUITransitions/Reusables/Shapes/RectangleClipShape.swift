//
//  RectangleClipShape.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/20/19.
// ✌️
//

import SwiftUI



struct RectangleClipShape {
    var completionPercentage: CGFloat
}


// MARK: - AnimatableData
extension RectangleClipShape {

    var animatableData: CGFloat {
        get { completionPercentage }
        set { completionPercentage = newValue }
    }
}


// MARK: - Shape
extension RectangleClipShape: Shape {

    func path(in rect: CGRect) -> Path {
        let coveringRect = CGRect(
            x: rect.minX,
            y: rect.minY,
            width: rect.width * 2 * (1 - completionPercentage),
            height: rect.height * 2 * (1 - completionPercentage)
        )
        .offsetBy(dx: -rect.width / 2, dy: -rect.height / 2)
        
        return Rectangle().path(in: coveringRect)
    }
}


// MARK: - Computeds
extension RectangleClipShape {
}


// MARK: - Private Helpers
extension RectangleClipShape {
}
