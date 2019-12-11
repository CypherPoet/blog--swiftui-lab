//
//  DismissGuardianDemoView.swift
//  ModalDismissGestureHacking
//
//  Created by CypherPoet on 12/11/19.
// ✌️
//

import SwiftUI


struct DismissGuardianDemoView: View {
    @State private var isShowingModal1 = false
    @State private var isShowingModal2 = false
    
    @ObservedObject private(set) var viewModel = DismissGuardianDemoViewModel()
}



// MARK: - Body
extension DismissGuardianDemoView {

    var body: some View {
        ModalDismissalGuardian(
            preventsDismissal: $viewModel.preventsDismissal,
            didAttemptDismissal: $viewModel.didAttemptDismissal
        ) {
            VStack(spacing: 32.0) {
               Text("Dismiss Guardian 🛡")
                    .font(.title)
                    .fontWeight(.bold)
                
                
                VStack {
                    Button(action: {
                        self.isShowingModal1 = true
                    }) {
                        Text("Modal Without Feedback")
                    }
                    .padding()
                    .sheet(isPresented: self.$isShowingModal1) {
                        UserInfoForm(
//                            viewModel: self.userInfoFormViewModel,
                            warnsOnDismissal: false,
                            didAttemptDismissal: self.$viewModel.didAttemptDismissal
                        )
                    }
                    
                    
                    Button(action: {
                        self.isShowingModal2 = true
                    }) {
                        Text("Modal With Feedback")
                    }
                    .padding()
                    .sheet(isPresented: self.$isShowingModal2) {
                        UserInfoForm(
//                            viewModel: self.userInfoFormViewModel,
                            warnsOnDismissal: true,
                            didAttemptDismissal: self.$viewModel.didAttemptDismissal
                        )
                    }
                }
            }
        }
    }
}


// MARK: - Computeds
extension DismissGuardianDemoView {


}


// MARK: - View Variables
extension DismissGuardianDemoView {


}



// MARK: - Preview
struct MainView_Previews: PreviewProvider {

    static var previews: some View {
        DismissGuardianDemoView()
    }
}
