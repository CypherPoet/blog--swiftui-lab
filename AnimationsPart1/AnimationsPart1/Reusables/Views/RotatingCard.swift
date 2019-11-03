//
//  RotatingCard.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 11/2/19.
// ✌️
//

import SwiftUI


struct RotatingCard: View {
    let faceImageNames: [String]
    
    @State private var isShowingFront = false
    
    @State private var animation3DAmount: Double = 0.0
    @State private var rotationAmount: Double = 0.0
    @State private var currentImageIndex = 0
    
}


// MARK: - Computeds
extension RotatingCard {

    var currentImageName: String {
        isShowingFront ? faceImageNames[currentImageIndex] : "back"
    }
}


// MARK: - Body
extension RotatingCard {

    var body: some View {
        let flipBinding = Binding<Bool>(get: { self.isShowingFront }, set: { self.cardDidTurnover($0) })
        
        return Image(currentImageName)
            .resizable()
            .frame(width: 265, height: 400)
            .turnoverEffect(isTurnedToFront: flipBinding, currentAngle: .radians(animation3DAmount), axis: (x: 1, y: 5))
            .rotationEffect(.radians(rotationAmount))
            .onAppear {
                withAnimation(Animation.linear(duration: 4.0).repeatForever(autoreverses: false)) {
                    self.animation3DAmount = 2 * .pi
                }
                withAnimation(Animation.linear(duration: 8.0).repeatForever(autoreverses: false)) {
                    self.rotationAmount = 2 * .pi
                }
            }
    }
}



// MARK: - Private Helpers
private extension RotatingCard {
    
    func cardDidTurnover(_ didTurnToFront: Bool) {
        if !isShowingFront && didTurnToFront {
            currentImageIndex = (currentImageIndex + 1) % faceImageNames.count
        }
        
        isShowingFront = didTurnToFront
    }
}


// MARK: - Preview
struct RotatingCard_Previews: PreviewProvider {

    static var previews: some View {
        RotatingCard(
            faceImageNames: [
                "hearts-2",
                "diamonds-b",
                "diamonds-7",
                "diamonds-6",
                "clubs-b",
                "clubs-8",
            ]
        )
        .environment(\.colorScheme, .dark)
    }
}
