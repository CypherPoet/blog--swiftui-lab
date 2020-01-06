//
//  OutOfControlViewExample.swift
//  StateChanges
//
//  Created by CypherPoet on 1/4/20.
// ✌️
//

import SwiftUI


struct OutOfControlViewExample: View {
    @State private var isTorchingCPU = false
}


// MARK: - Body
extension OutOfControlViewExample {

    var body: some View {
        VStack(spacing: 40) {
            CPUWheel()
                .frame(height: 200)
            
            Group {
                if isTorchingCPU {
                    TorchingCPUView()
                        .transition(
                            AnyTransition
                                .opacity
                                .combined(with: AnyTransition.scale(scale: 0.0))
                                .animation(Animation.easeIn(duration: 0.2).delay(0.3))
                        )
                }
            }

            Button(action: {
                withAnimation(Animation.easeInOut(duration: 0.3)) {
                    self.isTorchingCPU.toggle()
                }
            }) {
                Text(self.isTorchingCPU ? "Cool It" : "🧨")
            }
        }
    }
}


// MARK: - Computeds
extension OutOfControlViewExample {
}


// MARK: - View Variables
extension OutOfControlViewExample {
}



// MARK: - Preview
struct OutOfControlViewExample_Previews: PreviewProvider {

    static var previews: some View {
        OutOfControlViewExample()
    }
}
