//
//  ViewKind.swift
//  MinimappedForm
//
//  Created by CypherPoet on 10/14/19.
// ✌️
//

import Foundation
import SwiftUI


enum MinimappedFormView: Equatable {
    
    /// main container
    case formContainer
    
    /// contains a text label + text field
    case formFieldContainer
    
    /// text field (with an associated value that indicates the character count in the field
    case formField(_ status: FormFieldStatus)

    case formTitle
    
    /// view placed behind the minimap elements
    case miniMapArea
}


// MARK: - Computeds
extension MinimappedFormView {
    
    var minimapColor: Color {
        switch self {
        case .formField(let status):
            return Color.forFieldStatus(status)
        case .formTitle:
            return Color.purple
        default:
            return Color.gray
        }
    }
    
    
    var isInMinimap: Bool {
        switch self {
        case .formField,
             .formTitle,
             .formFieldContainer:
            return true
        case .miniMapArea,
             .formContainer:
            return false
        }
    }
}


// MARK: - PreferenceData
extension MinimappedFormView {

    struct PreferenceData: Identifiable {
        let id = UUID()
        let viewKind: MinimappedFormView
        let bounds: Anchor<CGRect>
    }
}


// MARK: - PreferenceKey
extension MinimappedFormView {

    struct PreferenceKey: SwiftUI.PreferenceKey {
        typealias Value = [PreferenceData]

        static var defaultValue: [PreferenceData] = []
        
        static func reduce(value: inout [PreferenceData], nextValue: () -> [PreferenceData]) {
            value += nextValue()
        }
    }
}
