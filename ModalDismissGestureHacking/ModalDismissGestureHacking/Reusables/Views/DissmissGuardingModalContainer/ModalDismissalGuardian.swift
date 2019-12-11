//
//  ModalDismissalGuardian.swift
//  ModalDismissGestureHacking
//
//  Created by CypherPoet on 12/11/19.
// ✌️
//


import SwiftUI


struct ModalDismissalGuardian<Content: View> {
    typealias UIViewControllerType = ModalDismissalGuardianUIHostingController<Content>
    
    @Binding var preventsDismissal: Bool
    @Binding var didAttemptDismissal: Bool
    
    var content: Content
    
    
    init(
        preventsDismissal: Binding<Bool>,
        didAttemptDismissal: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._preventsDismissal = preventsDismissal
        self._didAttemptDismissal = didAttemptDismissal
        self.content = content()
    }
}


// MARK: - UIViewControllerRepresentable
extension ModalDismissalGuardian: UIViewControllerRepresentable {

    func makeCoordinator() -> ModalDismissalGuardian.Coordinator {
        Self.Coordinator(didAttemptDismissal: $didAttemptDismissal)
    }


    func makeUIViewController(
        context: UIViewControllerRepresentableContext<ModalDismissalGuardian>
    ) -> UIViewControllerType {
        let hostingController = ModalDismissalGuardianUIHostingController(rootView: content, preventsDismissal: preventsDismissal)
        
        hostingController.dismissalDelegate = context.coordinator
        
        return hostingController
    }


    func updateUIViewController(
        _ dismissalGuardianHostingController: UIViewControllerType,
        context: UIViewControllerRepresentableContext<ModalDismissalGuardian>
    ) {
        dismissalGuardianHostingController.rootView = content
        dismissalGuardianHostingController.preventsDismissal = preventsDismissal
    }
}


//
//// MARK: - Preview
//struct DissmissGuardingModalContainer_Previews: PreviewProvider {
//
//    static var previews: some View {
//        ModalDismissalGuardian()
//    }
//}
