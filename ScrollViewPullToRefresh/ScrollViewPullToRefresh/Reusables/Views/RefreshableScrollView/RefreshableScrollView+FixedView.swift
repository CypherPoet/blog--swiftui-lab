//
//  RefreshableScrollView+FixedView.swift
//  ScrollViewPullToRefresh
//
//  Created by CypherPoet on 10/22/19.
// ✌️
//

import SwiftUI


extension RefreshableScrollView {
    
    /// View to set a preference containing its own position
    struct FixedView: View {
        
        var body: some View {
            GeometryReader { geometry in
                Color.clear.preference(
                    key: PreferenceKeys.RefreshableScrollView.self,
                    value: [
                        PreferenceKeys.RefreshableScrollView.PreferenceData(
                            viewType: .fixedView,
                            bounds: geometry.frame(in: .global)
                        )
                    ]
                )
            }
        }
    }
}
