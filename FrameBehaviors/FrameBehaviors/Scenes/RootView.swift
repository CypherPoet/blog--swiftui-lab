//
//  RootView.swift
//  FrameBehaviors
//
//  Created by CypherPoet on 12/21/19.
// ✌️
//

import SwiftUI


struct RootView: View {
}


// MARK: - Body
extension RootView {

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Square Fixer", destination: SquareFixerView())
            }
            .navigationBarTitle("Frame Behavoirs")
        }
    }
}


// MARK: - Computeds
extension RootView {


}


// MARK: - View Variables
extension RootView {


}



// MARK: - Preview
struct RootView_Previews: PreviewProvider {

    static var previews: some View {
        RootView()
    }
}
