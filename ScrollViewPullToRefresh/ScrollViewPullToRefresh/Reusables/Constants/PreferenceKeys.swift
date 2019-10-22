//
//  PreferenceKeys.swift
//  ScrollViewPullToRefresh
//
//  Created by CypherPoet on 10/22/19.
// ✌️
//

import Foundation
import SwiftUI


enum PreferenceKeys {
    
    struct RefreshableScrollView: PreferenceKey {
        
        struct PreferenceData: Equatable {
            var viewType: RefreshableScrollViewChildKind
            var bounds: CGRect
        }
        
    
        typealias Value = [PreferenceData]
        
        static var defaultValue: [PreferenceData] = []
        
        static func reduce(value: inout Value, nextValue: () -> Value) {
            value += nextValue()
        }
    }
}
