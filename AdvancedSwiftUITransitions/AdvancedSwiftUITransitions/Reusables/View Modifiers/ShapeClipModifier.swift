//
//  ShapeClipModifier.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/19/19.
// ✌️
//

import SwiftUI


struct ShapeClipModifier<S: Shape> {
    var shape: S
}


// MARK: - ViewModifier
extension ShapeClipModifier: ViewModifier {

    func body(content: Content) -> some View {
        content.clipShape(shape)
    }
}


// MARK: - Preview
struct ClipShapeModifier_Previews: PreviewProvider {

    static var previews: some View {
        EmptyView()
    }
}
