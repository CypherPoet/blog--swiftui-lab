//
//  Example3.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 10/23/19.
// ✌️
//

import SwiftUI


struct Example3: View {
    @State var numSides: Int = 3
}


// MARK: - Body
extension Example3 {

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
struct Example3_Previews: PreviewProvider {

    static var previews: some View {
        Example3()
    }
}
