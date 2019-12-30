//
//  DefaultTripleToggleStyle.swift
//  CustomStyling
//
//  Created by CypherPoet on 12/28/19.
// ✌️
//

import SwiftUI


public struct DefaultTripleToggleStyle: TripleToggleStyle {

    public func makeBody(configuration: Self.Configuration) -> some View {
        Self.ToggleView(stage: configuration.$stage, label: configuration.label)
    }
}



extension DefaultTripleToggleStyle {
    
    struct ToggleView {
        @Binding var stage: TripleToggleStage
        
        let label: Text
    }
}


// MARK: Computeds
extension DefaultTripleToggleStyle.ToggleView {
    
    var currentAlignment: Alignment {
        switch stage {
        case .first:
            return .leading
        case .second:
            return .center
        case .third:
            return .trailing
        }
    }
    
    var trackFillColor: Color {
        switch stage {
        case .first:
            return .green
        case .second:
            return .yellow
        case .third:
            return .red
        }
    }
    
    
    var accessibilityActivationPoint: UnitPoint {
        switch stage {
        case .first:
            return UnitPoint(x: 0.25, y: 0.5)
        case .second:
            return UnitPoint(x: 0.50, y: 0.5)
        case .third:
            return UnitPoint(x: 0.75, y: 0.5)
        }
    }
}


// MARK: SquareToggleStyling
extension DefaultTripleToggleStyle.ToggleView: SquareToggleStyling {
    var trackWidth: CGFloat { 60.0 }
}


// MARK: View
extension DefaultTripleToggleStyle.ToggleView: View {

    public var body: some View {
        HStack {
            label

            // Ensure that the toggle and the label lay out end-to-end in iOS Forms
            #if os(iOS)
            Spacer()
            #endif
            
            ZStack(alignment: currentAlignment) {
                
                // Track
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(trackFillColor)
                    .frame(width: trackWidth, height: trackHeight)
                
                
                // Fab
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                    .padding(.vertical, verticalSpacing)
                    .padding(.horizontal, verticalSpacing * 1.25)
                    .frame(width: fabWidth, height: fabWidth)
                    .onTapGesture {
                        withAnimation(
                            Animation.easeInOut(duration: 0.2),
                            { self.performToggle() }
                        )
                    }
            }
        }
        .accessibility(activationPoint: accessibilityActivationPoint)
        
        // Place the guide in the horizontal position between the label and the switch
        .alignmentGuide(.leading) { dimensions in
            dimensions.width - self.trackWidth
        }
    }
}


private extension DefaultTripleToggleStyle.ToggleView {
    
    func performToggle() {
        switch stage {
        case .first:
            self.stage = .second
        case .second:
            self.stage = .third
        case .third:
            self.stage = .first
        }
    }
}
