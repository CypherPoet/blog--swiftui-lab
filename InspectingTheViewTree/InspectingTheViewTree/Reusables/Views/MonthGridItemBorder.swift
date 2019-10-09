//
//  MonthGridItemBorder.swift
//  InspectingTheViewTree
//
//  Created by Brian Sipple on 10/9/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct MonthGridItemBorder: View {
    let isShowing: Bool
    
    var body: some View {
        
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 3)
                .foregroundColor(self.isShowing ? Color.pink : Color.clear)
                .animation(.easeInOut(duration: 0.4))
        }
    }
}

struct MonthGridItemBorder_Previews: PreviewProvider {
    static var previews: some View {
        MonthGridItemBorder(isShowing: true)
    }
}
