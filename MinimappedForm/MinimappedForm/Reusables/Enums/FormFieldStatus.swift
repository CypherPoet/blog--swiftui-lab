//
//  FormFieldStatus.swift
//  MinimappedForm
//
//  Created by CypherPoet on 10/14/19.
// ✌️
//

import Foundation


enum FormFieldStatus {
    case empty
    case insufficientFill
    case sufficientFill
    
    
    init(forCurrentInputLength inputLength: Int) {
        guard inputLength >= 0 else {
            self = .empty
            return
        }
        
        switch inputLength {
        case 0:
            self = .empty
        case 1...3:
            self = .insufficientFill
        default:
            self = .sufficientFill
        }
    }
}


