//
//  Example4.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 10/23/19.
// ✌️
//

import SwiftUI



struct Example4: View {
    @State var numSides: Int = 3
    @State var scale: Double = 1.0
}


// MARK: - Body
extension Example4 {

    var body: some View {
        VStack {
            PolygonShape(sides: numSides, scale: scale)
                .stroke(Color.pink, lineWidth: 4)
                .animation(.easeOut(duration: 0.6))
                .padding()

            
            VStack(spacing: 30) {
                Stepper(value: $numSides, in: 2...10) {
                    HStack {
                        Text("Number of sides")
                        Spacer()
                        Text("\(numSides)")
                    }
                }

                VStack(spacing: 4.0) {
                    Slider(
                        value: $scale,
                        in: 0.1...1,
                        step: 0.01,
                        minimumValueLabel: Text("0.1"),
                        maximumValueLabel: Text("1")
                    ) {
                        Text("Scale")
                    }
                    
                    Text("Scale")
                }
            }
        }
        .padding()
        .navigationBarTitle("Polygon Shapes")
    }
}
// MARK: - Preview
struct Example4_Previews: PreviewProvider {

    static var previews: some View {
        Example4()
    }
}
