//
//  Example5.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 10/23/19.
// ✌️
//

import SwiftUI



struct Example5: View {
    @State var numSides: Int = 3
    @State var scale: Double = 1.0
}


// MARK: - Body
extension Example5 {

    var body: some View {
        VStack {
            PolygonShape(sides: numSides)
                .stroke(Color.pink, lineWidth: 4)
                .animation(.easeOut(duration: 0.6))
                .padding()

            
            Stepper(value: $numSides, in: 2...10) {
                HStack {
                    Text("Number of sides")
                    Spacer()
                    Text("\(numSides)")
                }
            }
        }
        .padding()
        .navigationBarTitle("Polygon Shapes")
    }
}
// MARK: - Preview
struct Example4_Preview5: PreviewProvider {

    static var previews: some View {
        Example5()
    }
}
