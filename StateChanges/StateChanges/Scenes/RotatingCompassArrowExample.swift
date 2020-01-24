//
//  RotatingCompassArrowExample.swift
//  StateChanges
//
//  Created by CypherPoet on 1/23/20.
// ✌️
//

import SwiftUI


struct RotatingCompassArrowExample {
    @State private var needsAnimation = false
    @State private var compassDirection: CompassDirection = .north
}


// MARK: - View
extension RotatingCompassArrowExample: View {

    var body: some View {
        print("RotatingCompassArrowExample | body | cardinalDirection = \(compassDirection)")

        return VStack(spacing: 42) {
            CPUWheel()
                .frame(height: 100)
            
            compassDirectionLabel
            
            Image(systemName: "location.north")
                .resizable()
                .compassNeedleRotationEffect(
                    cardinalDirection: $compassDirection,
                    angle: needsAnimation ? .radians(2 * .pi) : .radians(0)
                )
                .foregroundColor(.red)
                .frame(width: 100, height: 100)
            
            animationButton
        }
    }
}


// MARK: - Computeds
extension RotatingCompassArrowExample {
}


// MARK: - View Variables
extension RotatingCompassArrowExample {
    
    private var compassDirectionLabel: some View {
        Text(compassDirection.displayText)
            .font(.title)
    }
    
    
    private var animationButton: some View {
        Button(action: {
            withAnimation(
                Animation.easeOut(duration: 1.8)
            ) {
                self.needsAnimation.toggle()
            }
        }) {
            Text("Animate")
        }
    }
}


// MARK: - Private Helpers
private extension RotatingCompassArrowExample {
}



// MARK: - Preview
struct RotatingCompassArrowExample_Previews: PreviewProvider {

    static var previews: some View {
        RotatingCompassArrowExample()
    }
}
