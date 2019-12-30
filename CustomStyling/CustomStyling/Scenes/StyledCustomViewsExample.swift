//
//  StyledCustomViewsExample.swift
//  CustomStyling
//
//  Created by CypherPoet on 12/27/19.
// ✌️
//

import SwiftUI
import CypherPoetSwiftUIKit


struct StyledCustomViewsExample: View {
    @State private var toggleStage: TripleToggleStage = .first
}


// MARK: - Body
extension StyledCustomViewsExample {

    var body: some View {
        HStack {
            TripleToggle(stage: $toggleStage, label: Text("Knob #1"))
                .tripleToggleStyle(KnobTripleToggleStyle(indicatorColor: .purple))
            
            TripleToggle(stage: $toggleStage, label: Text("Knob #2"))
                .tripleToggleStyle(KnobTripleToggleStyle(indicatorColor: .purple))
            
            TripleToggle(stage: $toggleStage, label: Text("Default"))

            TripleToggle(stage: $toggleStage, label: Text("Knob #3"))
                .tripleToggleStyle(KnobTripleToggleStyle(indicatorColor: .pink))
        }
    }
}


// MARK: - Computeds
extension StyledCustomViewsExample {
}


// MARK: - View Variables
extension StyledCustomViewsExample {
}



// MARK: - Preview
struct StyledCustomViewsExample_Previews: PreviewProvider {

    static var previews: some View {
        StyledCustomViewsExample()
    }
}
