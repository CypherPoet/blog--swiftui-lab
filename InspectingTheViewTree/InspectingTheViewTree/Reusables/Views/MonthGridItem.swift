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
            .anchorPreference(
                key: GridItemPreferenceKey.self,
                value: .bounds
            ) { boundsAnchor in
                [PreferenceData(month: self.month, bounds: boundsAnchor)]
            }
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
