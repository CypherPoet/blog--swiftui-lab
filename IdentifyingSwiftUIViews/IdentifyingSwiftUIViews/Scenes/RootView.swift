//
//  RootView.swift
//  IdentifyingSwiftUIViews
//
//  Created by CypherPoet on 2/1/20.
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
                NavigationLink(destination: ResettingStateValuesExample()) {
                    Text("Resetting State Values")
                }

                NavigationLink(destination: TriggeringTransitionsExample()) {
                    Text("Triggering Transitions")
                }
                
                NavigationLink(destination: ListViewPerformanceExample()) {
                    Text("Improving List View Performance")
                }
            }
            .navigationBarTitle("Identifying SwiftUI Views")
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
