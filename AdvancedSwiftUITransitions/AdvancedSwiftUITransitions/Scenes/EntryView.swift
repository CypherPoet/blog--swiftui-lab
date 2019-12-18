//
//  EntryView.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/17/19.
// ✌️
//

import SwiftUI


struct EntryView: View {
}


// MARK: - Body
extension EntryView {
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("The Basics")) {
                    NavigationLink("Basic Transition", destination: BasicTransitionExample())
                    NavigationLink("Asymmetric Transitions", destination: AsymmetricTransitionsExample())
                    NavigationLink("Combined Transitions", destination: CombinedTransitionsExample())
                    NavigationLink("Transitions with Parameters", destination: TransitionsWithParametersExample())
                }
                
                
                Section(header: Text("Custom Transitions")) {
                    NavigationLink("Replicating the Opacity Transition", destination: CustomOpacityTransitionExample())
                }
            }
            .navigationBarTitle("SwiftUI Transitions")
        }
    }
}


// MARK: - Computeds
extension EntryView {
    
    
}


// MARK: - View Variables
extension EntryView {
    
    
}



// MARK: - Preview
struct EntryView_Previews: PreviewProvider {
    
    static var previews: some View {
        EntryView()
    }
}
