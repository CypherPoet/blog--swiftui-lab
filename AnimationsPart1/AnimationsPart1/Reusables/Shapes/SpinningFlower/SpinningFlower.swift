//
//  SpinningFlower.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 10/27/19.
// ✌️
//

import SwiftUI


struct SpinningFlower: View {
    @State private var isAnimating = false

    let colors: [Color] = [
        .red, .orange, .yellow, .green, .blue, .purple, .pink
    ]
}


// MARK: - Computeds
extension SpinningFlower {
    var layerCount: Int { colors.count }
}


// MARK: - Body
extension SpinningFlower {

    var body: some View {
        
        ZStack {
            ForEach(0 ..< layerCount) { layerIndex in
                PetalLayer(
                    petalCount: self.petalCount(for: layerIndex),
                    petalLength: self.petalLength(for: layerIndex),
                    color: self.colors[layerIndex]
                )
            }
            .rotationEffect(.radians(isAnimating ? (2 * .pi) : 0))
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 16.0).repeatForever()) {
                    self.isAnimating = true
                }
            }
        }
    }
}



// MARK: - Private Helpers
private extension SpinningFlower {
    
    func petalCount(for layerIndex: Int) -> Int {
        15 + (layerIndex * 2)
    }
    
    
    func petalLength(for layerIndex: Int) -> Double {
        1.0 - (Double(layerIndex) * (1.0 / Double(layerCount)))
    }
}




// MARK: - Preview
struct SpinningFlower_Previews: PreviewProvider {

    static var previews: some View {
        SpinningFlower()
    }
}
