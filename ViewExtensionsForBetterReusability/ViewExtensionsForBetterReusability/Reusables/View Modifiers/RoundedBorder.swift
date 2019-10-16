//
//  RoundedBorder.swift
//  ViewExtensionsForBetterReusability
//
//  Created by CypherPoet on 10/16/19.
// ✌️
//

import SwiftUI


struct RoundedBorder<BorderStyle> where BorderStyle: ShapeStyle {
    let borderContent: BorderStyle
    let width: CGFloat
    let cornerRadius: CGFloat
    
    
    init(
        _ borderContent: BorderStyle,
        width: CGFloat = 1,
        cornerRadius: CGFloat = 0
    ) {
        self.borderContent = borderContent
        self.width = width
        self.cornerRadius = cornerRadius
    }
}


// MARK: - ViewModifier
extension RoundedBorder: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderContent, lineWidth: width)
            )
    }
}




struct RoundedBorder_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
            .roundedBorder(Color.red, width: 2, cornerRadius: 3)
    }
}
