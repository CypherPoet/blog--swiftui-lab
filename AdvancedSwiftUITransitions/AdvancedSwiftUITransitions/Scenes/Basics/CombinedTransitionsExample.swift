//
//  CombinedTransitionsExample.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/17/19.
// ✌️
//

import SwiftUI


struct CombinedTransitionsExample: View {
    @State private var isShowingLabels = false

}


// MARK: - Body
extension CombinedTransitionsExample {

    var body: some View {
        VStack(spacing: 12.0) {
            
            if isShowingLabels {
                LabelView(title: "Struck by Lightning! ⚡️")
                    .transition(.asymmetric(insertion: slideInAndFadeIn, removal: .opacity))
            }
            
            Spacer()
            
            labelToggleButton
        }
        .padding(.vertical, 40)
    }
}



// MARK: - View Variables
extension CombinedTransitionsExample {
    
    private var slideInAndFadeIn: AnyTransition {
        AnyTransition.slide.combined(with: .opacity)
    }
    
    
    
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
struct CombinedTransitionsExample_Previews: PreviewProvider {

    static var previews: some View {
        CombinedTransitionsExample()
    }
}
