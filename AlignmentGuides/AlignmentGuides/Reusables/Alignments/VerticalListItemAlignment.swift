//
//  VerticalListItemAlignment.swift
//  AlignmentGuides
//
//  Created by CypherPoet on 12/17/19.
// ✌️
//

import SwiftUI


extension VerticalAlignment {
    
    private enum VerticalListItemAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.bottom]
        }
    }
    
    
    static let verticalListItemAlignment = VerticalAlignment(
        VerticalListItemAlignment.self
    )
}
