//
//  ResettingStateValuesExample.swift
//  IdentifyingSwiftUIViews
//
//  Created by CypherPoet on 2/1/20.
// ✌️
//

import SwiftUI




struct ResettingStateValuesExample {
    @State private var userFormViewID = 0
}


// MARK: - View
extension ResettingStateValuesExample: View {

    var body: some View {
        // 🤔 Interestingly (Xcode 11.3.1) this example (https://swiftui-lab.com/swiftui-id/)
        // only seems to work when `UserFormView`
        // is wrapped in a container, such as a `VStack`.
        VStack {
            UserFormView(
                onReset: {
                    print("onReset | userFormViewID: \(self.userFormViewID)")
                    self.userFormViewID += 1
                }
            )
            .id(userFormViewID)
            
            
            Button(action: {
                self.userFormViewID += 1
            }) {
                Text("Container View Reset Button")
            }
        }
    }
}


// MARK: - Computeds
extension ResettingStateValuesExample {
}


// MARK: - View Variables
extension ResettingStateValuesExample {
}


// MARK: - Private Helpers
private extension ResettingStateValuesExample {
}



// MARK: - Preview
struct ResettingStateValuesExample_Previews: PreviewProvider {

    static var previews: some View {
        ResettingStateValuesExample()
    }
}
