//
//  CustomButtonsExample.swift
//  CustomStyling
//
//  Created by CypherPoet on 12/22/19.
// ✌️
//

import SwiftUI


struct CustomButtonsExample: View {
    @State private var isShowingLongPressNotice = false
}


// MARK: - Body
extension CustomButtonsExample {

    var body: some View {
        
            VStack(spacing: 32.0) {
                
                Button(action: {}) {
                    Text("Tap Me!")
                }
                .buttonStyle(CustomButtonStyles.ShrinkingOnTap())
                
                
                VStack(spacing: 22) {
                    Button(action: {
                        withAnimation(
                            Animation.spring(),
                            {
                                self.isShowingLongPressNotice = true
                            }
                        )
                    }) {
                        Text("Long-press Me!")
                    }
                    .buttonStyle(CustomButtonStyles.ShrinkingOnLongPress(backgroundColor: .purple))
                    
                    
                    if isShowingLongPressNotice {
                        Text("🎉🎉🎉")
                            .transition(AnyTransition.scale)
                    }
                }
            }
        }
}


// MARK: - Computeds
extension CustomButtonsExample {


}


// MARK: - View Variables
extension CustomButtonsExample {


}



// MARK: - Preview
struct CustomButtonsExample_Previews: PreviewProvider {

    static var previews: some View {
        CustomButtonsExample()
    }
}
