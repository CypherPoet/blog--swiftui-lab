//
//  Example13.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 12/4/19.
// ✌️
//

import SwiftUI


struct Example13: View {
    @State private var completionPercentage: CGFloat = 0.0
}


// MARK: - Body
extension Example13 {

    var body: some View {
        Color.clear
            .frame(width: 200, height: 200)
            .overlay(DashedRingLoaderCircle(completionPercentage: completionPercentage))
            .onAppear {
                withAnimation(
                    Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)
                ) {
                    self.completionPercentage = 1.0
                }
            }
    }
}



// MARK: - Preview
struct Example13_Previews: PreviewProvider {

    static var previews: some View {
        Example13()
    }
}



private struct DashedRingLoaderCircle: View {
    var completionPercentage: CGFloat
    
    
    var body: some View {
        Circle()
            .fill(circleGradient)
            .modifier(
                DashedRingLoader(
                    percentage: completionPercentage,
                    ringColor: .orange,
                    labelColor: .orange
                )
        )
    }
    
    
    var circleGradient: LinearGradient {
        .init(
            gradient: Gradient(colors: [
                .blue,
                .red
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
