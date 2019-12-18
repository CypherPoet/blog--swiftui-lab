//
//  HorizontalAlignment+HorizontalByHeight.swift
//  AlignmentGuides
//
//  Created by CypherPoet on 12/17/19.
// ✌️
//

import SwiftUI


extension HorizontalAlignment {
    private enum HorizontalByHeight: AlignmentID {
        
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context.height
        }
    }
    
    static let horizontalByHeight = HorizontalAlignment(HorizontalByHeight.self)
}
