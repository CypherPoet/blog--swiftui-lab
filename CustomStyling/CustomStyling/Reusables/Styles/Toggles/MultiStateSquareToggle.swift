
//
//  MultiStateToggle.swift
//  CustomStyling
//
//  Created by CypherPoet on 12/28/19.
// ✌️
//

import SwiftUI

extension CustomToggleStyles {

    
    public struct MultiStateSquareToggle: ToggleStyle, SquareToggleStyling {
        
        var trackWidth: CGFloat = 75.0

        
        public func makeBody(configuration: Configuration) -> some View {
            configuration.label
        }
    }
}
