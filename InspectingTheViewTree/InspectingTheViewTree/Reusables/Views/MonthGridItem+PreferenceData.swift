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
    
    struct PreferenceData: Equatable {
        var month: Month
        var frame: CGRect
    }
    
    
    struct GridItemPreferenceKey: PreferenceKey {
        typealias Value = [PreferenceData]

        static var defaultValue: [MonthGridItem.PreferenceData] = []
        
        static func reduce(value: inout [MonthGridItem.PreferenceData], nextValue: () -> [MonthGridItem.PreferenceData]) {
            value += nextValue()
        }
    }
}


