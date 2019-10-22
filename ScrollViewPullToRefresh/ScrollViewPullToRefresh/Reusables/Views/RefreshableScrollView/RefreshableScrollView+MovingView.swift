//
//  RefreshableScrollView+MovingView.swift
//  ScrollViewPullToRefresh
//
//  Created by CypherPoet on 10/22/19.
// ✌️
//

import SwiftUI


extension RefreshableScrollView {
    
    /// View to set a preference containing its own position
    struct MovingView: View {
        
        var body: some View {
            GeometryReader { geometry in
                Color.clear.preference(
                    key: PreferenceKeys.RefreshableScrollView.self,
                    value: [
                        PreferenceKeys.RefreshableScrollView.PreferenceData(
                            viewType: .movingView,
                            bounds: geometry.frame(in: .global)
                        )
                    ]
                )
            }
            .frame(height: 0)
        }
    }

}
