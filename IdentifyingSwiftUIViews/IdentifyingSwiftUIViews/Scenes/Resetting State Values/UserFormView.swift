//
//  UserFormView.swift
//  IdentifyingSwiftUIViews
//
//  Created by CypherPoet on 2/1/20.
// ✌️
//

import SwiftUI


struct UserFormView {
    @ObservedObject var viewModel: ViewModel = .init()
    
    @State private var internalStateString = ""
    @State private var resetButtonId = 10

    
    var onReset: (() -> Void)? = nil
}


// MARK: - View
extension UserFormView: View {

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Observed Object State")) {
                    TextField("First Name", text: $viewModel.firstNameText)
                    TextField("Last Name", text: $viewModel.lastNameText)
                }
                
                
                Section(header: Text("View State")) {
                    TextField("State String", text: $internalStateString)
                }
            }
            
            
            Spacer()
            
            
            Button(action: {
                self.resetButtonId += 1
                self.onReset?()
            }) {
                Text("Reset")
            }
        }
        .id(resetButtonId)
    }
}


// MARK: - Computeds
extension UserFormView {
}


// MARK: - View Variables
extension UserFormView {
}


// MARK: - Private Helpers
private extension UserFormView {
}



// MARK: - Preview
struct UserFormView_Previews: PreviewProvider {

    static var previews: some View {
        UserFormView(
            viewModel: .init()
        )
    }
}
