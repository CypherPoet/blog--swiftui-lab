//
//  Color+forFieldStatus.swift
//  MinimappedForm
//
//  Created by CypherPoet on 10/14/19.
// ✌️
//

import Foundation
import SwiftUI


extension Color {
    static func forFieldStatus(_ formFieldStatus: FormFieldStatus) -> Color {
        switch formFieldStatus {
        case .empty:
            return .red
        case .insufficientFill:
            return .yellow
        case .sufficientFill:
            return .green
        }
    }
}
