//
//  ModalDismissalGuardianUIHostingController.swift
//  ModalDismissGestureHacking
//
//  Created by CypherPoet on 12/11/19.
// ✌️
//


import SwiftUI

protocol ModalDismissalGuardianDelegate {
    func presentedViewController(_ viewController: UIViewController, didAttemptDismissal: Bool)
}


/// Hosting controller that allows us to get the view controller backing our modal.
final class ModalDismissalGuardianUIHostingController<Content: View>:
    UIHostingController<Content>,
    UIAdaptivePresentationControllerDelegate
{
    var preventsDismissal: Bool
    var dismissalDelegate: ModalDismissalGuardianDelegate?
    
    
    init(rootView: Content, preventsDismissal: Bool) {
        self.preventsDismissal = preventsDismissal
        
        super.init(rootView: rootView)
    }
    
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        viewControllerToPresent.presentationController?.delegate = self
        
        dismissalDelegate?.presentedViewController(viewControllerToPresent, didAttemptDismissal: false)
        
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    
    // MARK: - UIAdaptivePresentationControllerDelegate
    
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        let presentedVC = presentationController.presentedViewController
        
        dismissalDelegate?.presentedViewController(presentedVC, didAttemptDismissal: true)
    }
    
    
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        !preventsDismissal
    }
    
}
