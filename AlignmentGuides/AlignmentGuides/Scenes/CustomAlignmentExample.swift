//
//  CustomAlignmentExample.swift
//  AlignmentGuides
//
//  Created by CypherPoet on 12/17/19.
// ✌️
//

import SwiftUI


struct CustomAlignmentExample: View {
}


// MARK: - Body
extension CustomAlignmentExample {

    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .horizontalByHeight, spacing: 12) {
            
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 2)
                    .alignmentGuide(
                        .horizontalByHeight,
                        computeValue: { dimensions in dimensions[.leading] }
                    )
                
                LabelStrip(title: "001", height: CGFloat(Double.random(in: 30...130)))
                LabelStrip(title: "002", height: CGFloat(Double.random(in: 30...130)))
                LabelStrip(title: "003", height: CGFloat(Double.random(in: 30...130)))
                LabelStrip(title: "004", height: CGFloat(Double.random(in: 30...130)))
                LabelStrip(title: "005", height: CGFloat(Double.random(in: 30...130)))
                LabelStrip(title: "006", height: CGFloat(Double.random(in: 30...130)))
                
                
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 2)
                    .alignmentGuide(
                        .horizontalByHeight,
                        computeValue: { dimensions in dimensions[.leading] }
                    )
            }
        }
    }
}


// MARK: - Computeds
extension CustomAlignmentExample {


}


// MARK: - View Variables
extension CustomAlignmentExample {


}



// MARK: - Preview
struct CustomAlignmentExample_Previews: PreviewProvider {

    static var previews: some View {
        CustomAlignmentExample()
    }
}



