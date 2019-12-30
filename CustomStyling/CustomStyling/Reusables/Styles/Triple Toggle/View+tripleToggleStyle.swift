//
//  View+tripleToggleStyle.swift
//  CustomStyling
//
//  Created by CypherPoet on 12/28/19.
// ✌️
//

import SwiftUI


extension View {
    public func tripleToggleStyle<S: TripleToggleStyle>(
        _ style: S
    ) -> some View {
        self.environment(\.tripleToggleStyle, AnyTripleToggleStyle(style))
    }
}
