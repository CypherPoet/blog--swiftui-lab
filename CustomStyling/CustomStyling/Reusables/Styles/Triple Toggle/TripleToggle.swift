//
//  TripleToggle.swift
//  CustomStyling
//
//  Created by CypherPoet on 12/28/19.
// ✌️
//

import SwiftUI


public enum TripleToggleStage {
    case first
    case second
    case third
}


public struct TripleToggle {
    @Environment(\.tripleToggleStyle) var tripleToggleStyle: AnyTripleToggleStyle
    
    @Binding var stage: TripleToggleStage
    let label: Text
}


extension TripleToggle: View {

    public var body: some View {
        tripleToggleStyle.makeBody(
            configuration: TripleToggleStyleConfiguration(stage: $stage, label: label)
        )
    }
}
