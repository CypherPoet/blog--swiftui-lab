//
//  SavedBounds.swift
//  ViewExtensionsForBetterReusability
//
//  Created by CypherPoet on 10/17/19.
// ✌️
//

import Foundation
import SwiftUI


public enum SavedBounds {
    
    public struct PreferenceData: Identifiable, Equatable {
        public typealias ID = UUID
        
        public let id: UUID
        public let bounds: CGRect
    }
    
    
    public struct PreferenceKey: SwiftUI.PreferenceKey {
        public typealias Value = [PreferenceData]

        public static var defaultValue: Value = []
        
        public static func reduce(value: inout Value, nextValue: () -> Value) {
            value += nextValue()
        }
    }
}
