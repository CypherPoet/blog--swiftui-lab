//
//  Example9.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 11/2/19.
// ✌️
//

import SwiftUI


struct Example9: View {
}


// MARK: - Computeds
extension Example9 {


}


// MARK: - Body
extension Example9 {

    var body: some View {
        VStack {
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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray)
        .navigationBarTitle("Rotating Card")
    }
}


// MARK: - View Variables
extension Example9 {


}



// MARK: - Preview
struct Example9_Previews: PreviewProvider {

    static var previews: some View {
        Example9()
            .environment(\.colorScheme, .dark)
    }
}
