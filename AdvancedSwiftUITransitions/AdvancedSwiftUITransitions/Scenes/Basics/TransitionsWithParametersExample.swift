//
//  TransitionsWithParametersExample.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/18/19.
// ✌️
//

import SwiftUI


struct TransitionsWithParametersExample: View {
    @State private var isShowingLabels = false

}


// MARK: - Body
extension TransitionsWithParametersExample {

    var body: some View {
        VStack(spacing: 12.0) {
            
            if isShowingLabels {
                LabelView(title: "Struck by Lightning! ⚡️")
                    .transition(.asymmetric(
                        insertion: AnyTransition.scale(scale: 0, anchor: .leading).combined(with: .opacity),
                        removal: AnyTransition.scale(scale: 0, anchor: .trailing)
                    )
                )
                
                LabelView(title: "Struck by Lightning! ⚡️")
                    .transition(AnyTransition.scale(scale: 2, anchor: UnitPoint(x: 1, y: 0)))
                
                
                LabelView(title: "Struck by Lightning! ⚡️")
                    .transition(.offset(x: 10, y: 10))
            }
            
            Spacer()
            
            labelToggleButton
        }
        .padding(.vertical, 40)
    }
}



// MARK: - View Variables
extension TransitionsWithParametersExample {
    
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
struct TransitionsWithParametersExample_Previews: PreviewProvider {

    static var previews: some View {
        TransitionsWithParametersExample()
    }
}
