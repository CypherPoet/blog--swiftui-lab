//
//  UserInfoForm.swift
//  ModalDismissGestureHacking
//
//  Created by CypherPoet on 12/11/19.
// ✌️
//

import SwiftUI


struct UserInfoForm: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var viewModel: UserInfoFormViewModel
   
    
    init(
        warnsOnDismissal: Bool = false,
        didAttemptDismissal: Binding<Bool>
    ) {
        self.viewModel = UserInfoFormViewModel(
            warnsOnDismissal: warnsOnDismissal,
            didAttemptDismissal: didAttemptDismissal
        )
    }
}


// MARK: - Body
extension UserInfoForm {

    var body: some View {
        NavigationView {
            Form {
                TextField("First Name", text: $viewModel.firstName)
                TextField("Last Name", text: $viewModel.lastName)
            }
            .navigationBarTitle(Text(navigationBarTitle), displayMode: .inline)
            .navigationBarItems(trailing:
                Button("Save") {
                    self.viewModel.save()
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
            .alert(isPresented: $viewModel.isShowingDismissalAlert, content: {
                Alert(
                    title: Text("Unsaved Changes"),
                    message: Text("You have made changes to the form that have not been saved. If you continue, those changes will be lost."),
                    primaryButton: .destructive(
                        Text("Delete Changes"),
                        action: {
                            self.viewModel.resetForm()
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    ),
                    secondaryButton: .cancel(Text("Continue Editing"))
                )
            })
        }
        .environment(\.horizontalSizeClass, .compact)
    }
}


// MARK: - Computeds
extension UserInfoForm {

    var navigationBarTitle: String {
        "Form (\(viewModel.warnsOnDismissal ? "With" : "Without") Dismissal Feedback)"
    }
}


// MARK: - View Variables
extension UserInfoForm {


}



// MARK: - Preview
struct UserInfoForm_Previews: PreviewProvider {

    static var previews: some View {
        UserInfoForm(
//            viewModel: UserInfoFormViewModel(),
            warnsOnDismissal: true,
            didAttemptDismissal: .constant(false)
        )
    }
}
