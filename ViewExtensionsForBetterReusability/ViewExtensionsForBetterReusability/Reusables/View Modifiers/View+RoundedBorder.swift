//
//  View+RoundedBorder.swift
//  ViewExtensionsForBetterReusability
//
//  Created by CypherPoet on 10/16/19.
// ✌️
//


import Foundation
import SwiftUI


// MARK: - View Extension
extension View {
    
    func roundedBorder<BorderStyle>(
        _ content: BorderStyle,
        width: CGFloat = 1,
        cornerRadius: CGFloat = 0
    ) -> some View
        where BorderStyle: ShapeStyle
    {
        self.modifier(
            RoundedBorder(
                content,
                width: width,
                cornerRadius: cornerRadius
            )
        )
    }
}
