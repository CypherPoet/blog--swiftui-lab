//
//  ModalDismissalGuardian+Coordinator.swift
//  ModalDismissGestureHacking
//
//  Created by CypherPoet on 12/11/19.
// ✌️
//

import Foundation
import UIKit
import SwiftUI


extension ModalDismissalGuardian {

    class Coordinator: NSObject {
        @Binding var didAttemptDismissal: Bool
        

        init(
            didAttemptDismissal: Binding<Bool>
        ) {
            self._didAttemptDismissal = didAttemptDismissal
        }
    }
}


// MARK: - ModalDismissalGuardianDelegate
extension ModalDismissalGuardian.Coordinator: ModalDismissalGuardianDelegate {
    
    func presentedViewController(_ viewController: UIViewController, didAttemptDismissal: Bool) {
        self.didAttemptDismissal = didAttemptDismissal
    }
    

}
