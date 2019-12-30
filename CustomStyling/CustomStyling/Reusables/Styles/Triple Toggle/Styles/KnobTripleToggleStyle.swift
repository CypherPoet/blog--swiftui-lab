//
//  KnobTripleToggleStyle.swift
//  CustomStyling
//
//  Created by CypherPoet on 12/29/19.
// ✌️
//

import SwiftUI


public struct KnobTripleToggleStyle: TripleToggleStyle {
    let indicatorColor: Color
    
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        Self.ToggleView(
            stage: configuration.$stage,
            label: configuration.label,
            indicatorColor: indicatorColor
        )
    }
}


extension KnobTripleToggleStyle {
    struct ToggleView {
        @Binding var stage: TripleToggleStage
        
        let label: Text
        let indicatorColor: Color
        
        let knobRadius: CGFloat = 40
        
        private let knobGradient = AngularGradient(
            gradient: Gradient(
               colors: [
                   .white,
                   .gray,
                   .white,
                   .gray,
                   .white,
                   .gray,
                   .white,
               ]
           ),
            center: .center
        )
    }
}


// MARK: Computeds
extension KnobTripleToggleStyle.ToggleView {
    
    var knobAngle: Angle {
        switch stage {
        case .first:
            return .radians(-.pi / 6)
        case .second:
            return .radians(0)
        case .third:
            return .radians(.pi / 6)
        }
    }
}


// MARK: View
extension KnobTripleToggleStyle.ToggleView: View {

    public var body: some View {
        ZStack {
            knob
            
            indicator
                .offset(
                    x: CGFloat(sin(knobAngle.radians)) * (knobRadius * 0.75),
                    y: CGFloat(-cos(knobAngle.radians)) * (knobRadius * 0.75)
                )
        }
        .onTapGesture(perform: performToggle)
    }
}


// MARK: View Variables
extension KnobTripleToggleStyle.ToggleView {
    
    private var knob: some View {
        Circle()
            .fill(knobGradient)
            .frame(width: knobRadius * 2, height: knobRadius * 2)
    }
    
    
    private var indicator: some View {
        Circle()
            .fill(indicatorColor)
            .frame(width: 12, height: 12)
    }
}


private extension KnobTripleToggleStyle.ToggleView {
    
    func performToggle() {
        withAnimation(
            Animation.easeInOut(duration: 0.2),
            { self.incrementToggleStage() }
        )
    }
    
    
    func incrementToggleStage() {
        switch stage {
        case .first:
            stage = .second
        case .second:
            stage = .third
        case .third:
            stage = .first
        }
    }
}
