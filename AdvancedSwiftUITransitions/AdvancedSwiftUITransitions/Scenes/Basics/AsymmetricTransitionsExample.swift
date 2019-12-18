//
//  AsymmetricTransitionsExample.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/17/19.
// ✌️
//

import SwiftUI


struct AsymmetricTransitionsExample: View {
    @State private var isShowingLabels = false
}


// MARK: - Body
extension AsymmetricTransitionsExample {

    var body: some View {
        VStack(spacing: 12.0) {
            
            if isShowingLabels {
                LabelView(title: "Struck by Lightning! ⚡️")
                    .transition(.asymmetric(insertion: .opacity, removal: .scale))
                
                LabelView(title: "Struck by Lightning! ⚡️")
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
            
            Spacer()
            
            labelToggleButton
        }
        .padding(.vertical, 40)
    }
}


// MARK: - Computeds
extension AsymmetricTransitionsExample {
}


// MARK: - View Variables
extension AsymmetricTransitionsExample {

    private var labelToggleButton: some View {
        Button(action: {
            withAnimation(
                Animation.easeOut(duration: 2.2)
            ) {
                self.isShowingLabels.toggle()
            }
        }) {
            Text("Toggle Labels")
        }
    }
}



// MARK: - Preview
struct AsymmetricTransitionsExample_Previews: PreviewProvider {

    static var previews: some View {
        AsymmetricTransitionsExample()
    }
}
