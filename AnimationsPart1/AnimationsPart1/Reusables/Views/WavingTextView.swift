//
//  WavingTextView.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 12/6/19.
// ✌️
//

import SwiftUI


struct WavingTextView: View {
    let text: String
    
    @State private var completionPercentage: CGFloat = 0.0
    
    
    init(_ text: String) {
        self.text = text
    }
}


// MARK: - Body
extension WavingTextView {

    var body: some View {
        GeometryReader { geometry in
            Color.clear.overlay(
                EmptyView()
                    .waveTextAnimation(
                        text: self.text,
                        waveWidth: geometry.size.width * 0.02,
                        fontSize: 52,
                        completionPercentage: self.completionPercentage
                    )
            )
        }
        .onAppear {
            withAnimation(
                Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)
            ) {
                self.completionPercentage = 1.0
            }
        }
    }
}


// MARK: - Computeds
extension WavingTextView {


}


// MARK: - View Variables
extension WavingTextView {


}



// MARK: - Preview
struct WavingTextView_Previews: PreviewProvider {

    static var previews: some View {
        WavingTextView("CypherPoet")
    }
}
