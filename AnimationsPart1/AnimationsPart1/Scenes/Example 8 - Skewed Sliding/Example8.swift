//
//  Example8.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 11/1/19.
// ✌️
//

import SwiftUI


struct Example8: View {
    @State private var slideDirection: SkewedOffset.Direction = .left

    private let slideAnimation = Animation.easeOut(duration: 0.33)
    
    private let labelData = [
        (text: "CypherPoet", color: Color.yellow),
        (text: "CypherPoet", color: Color.orange),
        (text: "CypherPoet", color: Color.red),
        (text: "CypherPoet", color: Color.purple),
        (text: "CypherPoet", color: Color.blue),
        (text: "CypherPoet", color: Color.pink),
    ]
    
}


// MARK: - Body
extension Example8 {

    var body: some View {
        GeometryReader { geometry in
            VStack {
                ForEach(0 ..< self.labelData.count, id: \.self) { idx in
                    SlidingLabel(
                        text: Text(self.labelData[idx].text),
                        offset: self.slideDirection.skewMultiplier * (geometry.size.width / 2),
                        animationPct: self.slideDirection == .left ? 0.0 : 1.0,
                        backgroundColor: self.labelData[idx].color
                    )
                    .animation(self.slideAnimation.delay(0.1 * (Double(idx + 1))))
                }
            }
        }
        .onTapGesture {
            self.slideDirection = self.slideDirection == .left ? .right : .left
        }
        .navigationBarTitle("Skewed Offsetting")
    }
}


// MARK: - View Variables
extension Example8 {

}



// MARK: - Preview
struct Example8_Previews: PreviewProvider {

    static var previews: some View {
        Example8()
    }
}



struct SlidingLabel: View {
    var text: Text
    var offset: CGFloat
    var animationPct: CGFloat
    var backgroundColor: Color
    
    
    var body: some View {
        text
            .padding()
            .background(backgroundColor)
            .skewedOffset(offset: offset, animationPct: animationPct)
    }
}
