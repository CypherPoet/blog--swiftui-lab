//
//  MonthsGrid.swift
//  InspectingTheViewTree
//
//  Created by Brian Sipple on 10/8/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI


enum Month: Hashable {
    case january
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
    
    
    var displayValue: String {
        switch self {
        case .january:
            return "January"
        case .february:
            return "February"
        case .march:
            return "March"
        case .april:
            return "April"
        case .may:
            return "May"
        case .june:
            return "June"
        case .july:
            return "July"
        case .august:
            return "August"
        case .september:
            return "September"
        case .october:
            return "October"
        case .november:
            return "November"
        case .december:
            return "December"
        }
    }
}


struct MonthsGrid: View {
    @State private var activeMonth: Month = .january
    
    
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
        }
    }
}


struct MonthsGrid_Previews: PreviewProvider {
    static var previews: some View {
        MonthsGrid()
    }
}
