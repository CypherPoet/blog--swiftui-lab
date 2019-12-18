//
//  CustomOpacityTransitionExample.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/18/19.
// ✌️
//

import SwiftUI



struct CustomOpacityTransitionExample: View {
    @State private var isShowingLabels = false
}


// MARK: - Body
extension CustomOpacityTransitionExample {

    var body: some View {
        VStack(spacing: 12.0) {
            
            if isShowingLabels {
                LabelView(title: "Struck by Lightning! ⚡️")
                    .transition(.customOpacity)
            }
            
            Spacer()
            
            labelToggleButton
        }
        .padding(.vertical, 40)
    }
}


// MARK: - Computeds
extension CustomOpacityTransitionExample {


}


// MARK: - View Variables
extension CustomOpacityTransitionExample {
    
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
struct CustomOpacityTransitionExample_Previews: PreviewProvider {

    static var previews: some View {
        CustomOpacityTransitionExample()
    }
}
