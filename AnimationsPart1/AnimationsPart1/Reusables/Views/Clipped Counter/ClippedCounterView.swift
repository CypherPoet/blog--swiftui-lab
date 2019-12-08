//
//  ClippedCounterView.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 12/6/19.
// ✌️
//

import SwiftUI


struct ClippedCounterView: View {
    @State private var completionPercentage: CGFloat = 0.0
}


// MARK: - Body
extension ClippedCounterView {

    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .frame(width: geometry.size.width * 0.5, height: geometry.size.width * 0.5)
                .overlay(
                    EmptyView()
                        .clippedCounter(
                            currentNumber: Double(self.completionPercentage * 99)
                        )
                )
                .border(Color.blue, width: 4)
        }
        .onAppear {
            withAnimation(
                Animation.easeInOut(duration: 18.0).repeatForever(autoreverses: false)
            ) {
                self.completionPercentage = 1.0
            }
        }
    }
}


// MARK: - Computeds
extension ClippedCounterView {


}


// MARK: - View Variables
extension ClippedCounterView {


}



// MARK: - Preview
struct ClippedCounterView_Previews: PreviewProvider {

    static var previews: some View {
        ClippedCounterView()
    }
}
