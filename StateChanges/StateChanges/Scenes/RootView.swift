//
//  RootView.swift
//  StateChanges
//
//  Created by CypherPoet on 1/4/20.
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
                NavigationLink("Out of Control View", destination: OutOfControlViewExample())
                NavigationLink("Rotating Compass Arrow", destination: RotatingCompassArrowExample())
            }
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
