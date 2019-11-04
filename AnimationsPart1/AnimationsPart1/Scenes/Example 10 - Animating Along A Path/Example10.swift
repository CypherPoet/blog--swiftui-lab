//
//  Example10.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 11/3/19.
// ✌️
//

import SwiftUI


struct Example10: View {
}


// MARK: - Computeds
extension Example10 {


}


// MARK: - Body
extension Example10 {

    var body: some View {
        
        return GeometryReader { geometry in
            LoopingPlaneView(container: geometry)
        }
        .navigationBarTitle("Path Animation")
    }
}



// MARK: - Preview
struct Example10_Previews: PreviewProvider {

    static var previews: some View {
        Example10()
    }
}
