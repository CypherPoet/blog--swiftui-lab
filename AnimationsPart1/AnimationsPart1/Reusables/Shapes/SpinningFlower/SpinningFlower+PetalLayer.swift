//
//  SpinningFlower+PetalLayer.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 10/27/19.
// ✌️
//

import SwiftUI


extension SpinningFlower {
    struct PetalLayer: View {
        let petalCount: Int
        let petalLength: Double
        let color: Color
        
        @State private var isAnimating = false
    }
}

    
// MARK: - Computeds
extension SpinningFlower.PetalLayer {
    
    var startingPetalAngle: Angle { .radians((.pi / 180) * 2) }
    
    var endingPetalAngle: Angle {
        .radians(
            ((.pi * 2) / Double(petalCount))
            * 2
        )
    }
    
}
    
    
// MARK: - Body
extension SpinningFlower.PetalLayer {

    var body: some View {
        let startingPetalAngle = self.startingPetalAngle
        let endingPetalAngle = self.endingPetalAngle

        
        return GeometryReader { geometry in
            ForEach(0 ..< self.petalCount) { petalIndex in
                PetalShape(
                    startAngle: self.angle(for: petalIndex),
                    arcAngle: self.isAnimating ? startingPetalAngle : endingPetalAngle,
                    length: self.isAnimating ? self.petalLength : self.petalLength * 0.9
                )
                .fill(
                    RadialGradient(
                        gradient: Gradient(colors: [self.color.opacity(0.2), self.color]),
                        center: UnitPoint(x: 0.5, y: 0.5),
                        startRadius: (min(geometry.size.width, geometry.size.height) / 2.0) * 0.1,
                        endRadius: min(geometry.size.width, geometry.size.height) / 2.0
                    )
                )
            }
        }
        .onAppear {
            withAnimation(Animation.easeOut(duration: 0.9).repeatForever()) {
                self.isAnimating = true
            }
        }
    }
}



// MARK: - Private Helpers
private extension SpinningFlower.PetalLayer {
    
    func angle(for petalIndex: Int) -> Angle {
        .radians(
            (Double(petalIndex) * (.pi * 2))
            / Double(petalCount)
        )
    }
}
