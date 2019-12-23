//
//  CustomButtonStyles+ShrinkingOnLongPress.swift
//  CustomStyling
//
//  Created by CypherPoet on 12/22/19.
// ✌️
//

import SwiftUI


extension CustomButtonStyles {
    
    struct ShrinkingOnLongPress: PrimitiveButtonStyle {
        var longPressDuration: TimeInterval = 1.0
        var backgroundColor: Color = .accentColor
        var foregroundColor: Color = .white
        
        
        func makeBody(configuration: Self.Configuration) -> some View {
            ButtonView(
                configuration: configuration,
                longPressDuration: longPressDuration,
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor
            )
        }
    }
}


extension CustomButtonStyles.ShrinkingOnLongPress {
    
    struct ButtonView: View {
        var configuration: CustomButtonStyles.ShrinkingOnLongPress.Configuration
        var longPressDuration: TimeInterval = 1.0
        var backgroundColor: Color = .accentColor
        var foregroundColor: Color = .white
        
        @GestureState private var isPressed = false

        
        var body: some View {
            configuration.label
                .foregroundColor(foregroundColor)
                .font(.headline)
                .padding()
                .compositingGroup()
                .background(background)
                .shadow(color: .black, radius: 3)
                .opacity(isPressed ? 0.6 : 1.0)
                .scaleEffect(isPressed ? 0.79 : 1.0)
                .animation(.easeInOut(duration: 0.08))
                .gesture(longPress)
        }
    }
}


extension CustomButtonStyles.ShrinkingOnLongPress.ButtonView {
    
    private var background: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(backgroundColor)
    }
    
    
    private var longPress: some Gesture {
        LongPressGesture(minimumDuration: longPressDuration, maximumDistance: 0.0)
            .updating($isPressed) { (updatedIsPressed, state, _) in
                state = updatedIsPressed
            }
            .onEnded { _ in self.configuration.trigger() }
    }
}




// MARK: - Preview
struct ShrinkingOnLongPressButton_Previews: PreviewProvider {

    static var previews: some View {
        Button(action: {
            print("Button Pressed!")
        }, label: {
            Text("Tap Me!")
        })
        .buttonStyle(CustomButtonStyles.ShrinkingOnLongPress())
    }
}
