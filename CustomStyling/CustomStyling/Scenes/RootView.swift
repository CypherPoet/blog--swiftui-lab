//
//  RootView.swift
//  CustomStyling
//
//  Created by CypherPoet on 12/22/19.
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
                NavigationLink("Custom Buttons", destination: CustomButtonsExample())
            }
            .navigationBarTitle("Custom Styling")
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
