//
//  LabelStrip.swift
//  AlignmentGuides
//
//  Created by CypherPoet on 12/17/19.
// ✌️
//

import SwiftUI


struct LabelStrip: View {
    var title: String
    var height: CGFloat
    
}


// MARK: - Body
extension LabelStrip {
    
    var body: some View {
        Text(title)
            .font(.headline)
            .fontWeight(.semibold)
            .frame(width: 200, height: height)
            .background(Color.pink)
            .cornerRadius(12)
    }
}


// MARK: - Computeds
extension LabelStrip {
    
    
}


// MARK: - View Variables
extension LabelStrip {
    
    
}



// MARK: - Preview
struct LabelStrip_Previews: PreviewProvider {
    
    static var previews: some View {
        LabelStrip(title: "Hello", height: 100)
    }
}
