//
//  Example7.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 10/27/19.
// ✌️
//

import SwiftUI


struct Example7: View {
}


// MARK: - Body
extension Example7 {

    var body: some View {
        
        VStack(spacing: 40) {
            VStack(spacing: 8) {
                Text("Without Metal")
                    .font(.title)
                    .fontWeight(.bold)
                
                SpinningFlower()
            }
            
            
            VStack(spacing: 8) {
                Text("With Metal ⚡️")
                    .font(.title)
                    .fontWeight(.bold)
                
                SpinningFlower()
                    .drawingGroup()
            }
        }
        .padding()
        .navigationBarTitle("Metal Acceleration")
    }
}


// MARK: - Preview
struct Example7_Previews: PreviewProvider {

    static var previews: some View {
        Example7()
    }
}
