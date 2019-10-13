//
//  MonthsGrid.swift
//  InspectingTheViewTree
//
//  Created by Brian Sipple on 10/8/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI


struct MonthsGrid: View {
    @State private var activeMonth: Month = .january
    @State private var gridItemFrames: [Month: CGRect] = [
        .january: .zero,
        .february: .zero,
        .march: .zero,
        .april: .zero,
        .may: .zero,
        .june: .zero,
        .july: .zero,
        .august: .zero,
        .september: .zero,
        .october: .zero,
        .november: .zero,
        .december: .zero
    ]
    
    
    var body: some View {
            VStack {
                Spacer()
                
                HStack {
                    MonthGridItem(activeMonth: $activeMonth, month: .january)
                    MonthGridItem(activeMonth: $activeMonth, month: .february)
                    MonthGridItem(activeMonth: $activeMonth, month: .march)
                    MonthGridItem(activeMonth: $activeMonth, month: .april)
                }
                
                Spacer()
                
                HStack {
                    MonthGridItem(activeMonth: $activeMonth, month: .may)
                    MonthGridItem(activeMonth: $activeMonth, month: .june)
                    MonthGridItem(activeMonth: $activeMonth, month: .july)
                    MonthGridItem(activeMonth: $activeMonth, month: .august)
                }
                
                Spacer()
                
                HStack {
                    MonthGridItem(activeMonth: $activeMonth, month: .september)
                    MonthGridItem(activeMonth: $activeMonth, month: .october)
                    MonthGridItem(activeMonth: $activeMonth, month: .november)
                    MonthGridItem(activeMonth: $activeMonth, month: .december)
                }
                
                Spacer()
            }
            .backgroundPreferenceValue(MonthGridItem.PreferenceKey.self) { preferences in
                GeometryReader { geometry in
                    ZStack(alignment: .topLeading) {
                        self.createBorder(from: geometry, using: preferences)
//                        HStack { Spacer() } // makes the ZStack to expand horizontally
//                        VStack { Spacer() } // makes the ZStack to expand vertically
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
                }
            }
    }
}

extension MonthsGrid {
    
    private func createBorder(
        from geometry: GeometryProxy,
        using preferences: [MonthGridItem.PreferenceData]
    ) -> some View {
        guard let preference = preferences.first(where: { $0.month == activeMonth }) else {
            preconditionFailure("Unable to find preference data for month")
        }
        
        guard
            let topLeadingAnchor = preference.topLeading,
            let bottomTrailingAnchor = preference.bottomTrailing
        else {
            preconditionFailure("Unable to find bounds points in preference data")
        }

        let topLeadingPoint = geometry[topLeadingAnchor]
        let bottomTrailingPoint = geometry[bottomTrailingAnchor]
        
        
        return RoundedRectangle(cornerRadius: 15)
            .stroke(lineWidth: 3.0)
            .foregroundColor(.purple)
            .frame(
                width: bottomTrailingPoint.x - topLeadingPoint.x,
                height: bottomTrailingPoint.y - topLeadingPoint.y
            )
            .fixedSize()
            .offset(x: topLeadingPoint.x, y: topLeadingPoint.y)
            .animation(.easeInOut(duration: 0.3))
    }
}



struct MonthsGrid_Previews: PreviewProvider {
    static var previews: some View {
        MonthsGrid()
    }
}
