//
//  BasicTransitionExample.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/17/19.
// ✌️
//

import SwiftUI


struct BasicTransitionExample: View {
    @State private var isShowingLabels = false
    
}


// MARK: - Body
extension BasicTransitionExample {

    var body: some View {
        
        VStack(spacing: 12.0) {
            
            if isShowingLabels {
                
                // Transitions can take effect when the view changes according to an explicit animation.
                LabelView(title: "Hello!")
                    .transition(.opacity)
                

                // Another option is to associate an animation with a transition.
                // (Note that the animation is applied to the transition, not to the view.)
                LabelView(title: "Hello!")
                    .transition(AnyTransition.opacity.animation(.easeOut(duration: 2.2)))
            }
            
            Spacer()
            
            labelToggleButton
        }
        .padding(.vertical, 40)
        
    }
}


// MARK: - Computeds
extension BasicTransitionExample {
}


// MARK: - View Variables
extension BasicTransitionExample {
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
struct BasicTransitionExample_Previews: PreviewProvider {

    static var previews: some View {
        BasicTransitionExample()
    }
}
