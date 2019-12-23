//
//  CustomTappedButtonStyle.swift
//  CustomStyling
//
//  Created by CypherPoet on 12/22/19.
// ✌️
//

import SwiftUI


// 🔑 To implement `ButtonStyle`, you simply need to display the label of the button and make
// its appearance different while it is pressed. You do not need to worry about the tap gesture.


extension CustomButtonStyles {
    
    struct ShrinkingOnTap: ButtonStyle {
        var backgroundColor: Color = .accentColor
        var foregroundColor: Color = .white
        
        
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .foregroundColor(foregroundColor)
                .font(.headline)
                .padding()
                .compositingGroup()
                .background(background)
                .shadow(color: .black, radius: 3)
                .opacity(configuration.isPressed ? 0.4 : 1.0)
                .scaleEffect(configuration.isPressed ? 0.667 : 1.0)
        }
    }
}


extension CustomButtonStyles.ShrinkingOnTap {
    
    private var background: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(backgroundColor)
    }
}




// MARK: - Preview
struct ShrinkingOnTapButton_Previews: PreviewProvider {

    static var previews: some View {
        Button(action: {
            print("Button Pressed!")
        }, label: {
            Text("Tap Me!")
        })
        .buttonStyle(CustomButtonStyles.ShrinkingOnTap())
    }
}
