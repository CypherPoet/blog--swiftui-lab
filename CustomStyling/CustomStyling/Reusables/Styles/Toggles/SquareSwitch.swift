//
//  SquareSwitch.swift
//  CustomStyling
//
//  Created by CypherPoet on 12/23/19.
// ✌️
//

import SwiftUI



extension CustomToggleStyles {
    
    struct SquareToggle: ToggleStyle {
        var verticalSpacing: CGFloat = 2.0
        var trackWidth: CGFloat = 50.0


        func makeBody(configuration: Self.Configuration) -> some View {
            HStack {
                configuration.label

                // Ensure that the toggle and the label lay out end-to-end in iOS Forms
                #if os(iOS)
                Spacer()
                #endif
                
                ZStack {
                    
                    // Track
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(configuration.isOn ? TrackFillColor.on : TrackFillColor.off)
                        .frame(width: trackWidth, height: trackHeight)
                    
                    
                    // Fab
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(Color.white)
                        .padding(.vertical, verticalSpacing)
                        .padding(.horizontal, verticalSpacing * 1.25)
                        .frame(width: fabWidth, height: fabWidth)
                        .offset(x: (fabWidth / 2) * CGFloat(configuration.isOn ? 1 : -1))
                        .onTapGesture {
                            withAnimation(
                                Animation.easeInOut(duration: 0.2),
                                {
                                    configuration.$isOn.wrappedValue.toggle()
                                }
                            )
                        }
                }
            }
            .accessibility(
                activationPoint: configuration.isOn ?
                    AccessibilityActivationPoint.on
                    : AccessibilityActivationPoint.off
            )
            
            // Place the guide in the horizontal position between the label and the switch
            .alignmentGuide(.leading) { dimensions in
                dimensions.width - self.trackWidth
            }
        }
    }
}


extension CustomToggleStyles.SquareToggle {
    
    private enum TrackFillColor {
        static let on = Color.accentColor
        static let off = Color.secondary
    }
    
    var fabWidth: CGFloat { (trackWidth / 2) }
    var trackHeight: CGFloat { (trackWidth / 2) }
    var cornerRadius: CGFloat { trackWidth * CGFloat(0.065) }
    
    private enum AccessibilityActivationPoint {
        static let on = UnitPoint(x: 0.25, y: 0.5)
        static let off = UnitPoint(x: 0.75, y: 0.5)
    }
}




// MARK: - Preview
struct CustomSquareToggle_Previews: PreviewProvider {

    struct PreviewView: View {
        @State private var isOn = false
        
        var body: some View {
            Toggle(isOn: $isOn) {
                Text(isOn ? "On" : "Off")
            }
            .toggleStyle(CustomToggleStyles.SquareToggle())
        }
    }
    
    
    static var previews: some View {
        PreviewView()
    }
}

