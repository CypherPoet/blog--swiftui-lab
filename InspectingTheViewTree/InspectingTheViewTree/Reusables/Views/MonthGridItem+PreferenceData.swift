//
//  MonthGridItem+PreferenceData.swift
//  InspectingTheViewTree
//
//  Created by Brian Sipple on 10/9/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation
import SwiftUI


extension MonthGridItem {
    
    struct PreferenceData {
        var month: Month
        var topLeading: Anchor<CGPoint>? = nil
        var bottomTrailing: Anchor<CGPoint>? = nil
    }
    
    
    struct PreferenceKey: SwiftUI.PreferenceKey {
        typealias Value = [PreferenceData]

        static var defaultValue: [PreferenceData] = []
        
        static func reduce(value: inout [PreferenceData], nextValue: () -> [PreferenceData]) {
            value += nextValue()
        }
    }
}


