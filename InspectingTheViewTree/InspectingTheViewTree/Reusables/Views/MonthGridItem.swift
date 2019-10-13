//
//  MonthGridItem.swift
//  InspectingTheViewTree
//
//  Created by Brian Sipple on 10/9/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct MonthGridItem: View {
    @Binding var activeMonth: Month
    let month: Month
    
    var body: some View {
        Text(month.displayValue)
            .tag(month)
            .padding(10)
            // Our MonthView now needs to set two anchor preferences.
            // However, if we add more than one call to `.anchorPreference()` on the
            // same view, only the last one survives.
            //
            // Instead, we need to call `.anchorPreference()` once.
            // Then we use `.transformAnchorPreference()` to fill the missing data
            .anchorPreference(
                key: MonthGridItem.PreferenceKey.self,
                value: .topLeading
            ) { boundsAnchor in
                [PreferenceData(month: self.month, topLeading: boundsAnchor)]
            }
            .transformAnchorPreference(
                key: MonthGridItem.PreferenceKey.self,
                value: .bottomTrailing,
                transform: {
                    (value: inout MonthGridItem.PreferenceKey.Value, anchor: Anchor<CGPoint>) in
                    
                    value[0].bottomTrailing = anchor
                }
            )
            .onTapGesture {
                self.activeMonth = self.month
            }
        }
}


struct MonthGridItem_Previews: PreviewProvider {
    static var previews: some View {
        
        MonthGridItem(
            activeMonth: .constant(.january),
            month: .january
        )
    }
}
