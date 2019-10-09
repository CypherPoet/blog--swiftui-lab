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
            .background(PreferenceViewSetter(month: month))
            .onTapGesture {
                self.activeMonth = self.month
            }
    }
    
    
    
    private struct PreferenceViewSetter: View {
        let month: Month
        
        var body: some View {
            GeometryReader { geometry in
                Rectangle()
                    .fill(Color.clear)
                    .preference(
                        key: GridItemPreferenceKey.self,
                        value: [
                            PreferenceData(
                                month: self.month,
                                frame: geometry.frame(in: .named(Constants.CoordinateSpaces.monthGrid))
                            )
                        ]
                    )
            }
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
