//
//  CustomFlyTransitionExample.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/18/19.
// ✌️
//

import SwiftUI


struct CustomFlyTransitionExample: View {
    @State private var isShowingDetailsView = false
}


// MARK: - Body
extension CustomFlyTransitionExample {

    var body: some View {
        
        ZStack {
            panelToggleButton

            if isShowingDetailsView {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.pink)
                    .frame(width: 330, height: 500)
                    .overlay(DetailsView())
                    .transition(.fly)
                    .zIndex(1)
            }
        }
    }
}


// MARK: - Computeds
extension CustomFlyTransitionExample {


}


// MARK: - View Variables
extension CustomFlyTransitionExample {
    
    private var panelToggleButton: some View {
        Button(action: {
            withAnimation(
                Animation.easeOut(duration: 2.2)
            ) {
                self.isShowingDetailsView.toggle()
            }
        }) {
            Text("Show Details Panel")
        }
    }

}



// MARK: - Preview
struct CustomFlyTransitionExample_Previews: PreviewProvider {

    static var previews: some View {
        CustomFlyTransitionExample()
    }
}



private struct DetailsView: View {
    
    var body: some View {
        Text("Custom Transitions are Awesome!")
    }
}
