//
//  DashedRingLoader+CompletionArc.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 12/4/19.
// ✌️
//

// 📝 NOTE: It's not necessary to make this `Animatable`, because the containing
// `AnimatableModifier` is already creating the shape multiple times, with
// different pct values.


import SwiftUI


extension DashedRingLoader {
    
    struct CompletionArc {
        let percentage: CGFloat
        let lineWidth: CGFloat = 10.0
    }
}


// MARK: - Shape
extension DashedRingLoader.CompletionArc: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(
            center: center(in: rect),
            radius: radius(in: rect),
            startAngle: .radians(0),
            endAngle: .radians(2.0 * .pi * Double(percentage)),
            clockwise: false
        )
        
        return path.strokedPath(
            StrokeStyle(
                lineWidth: lineWidth,
                dash: [6, 3],
                dashPhase: lineWidth
            )
        )
    }
}


// MARK: - Computeds
extension DashedRingLoader.CompletionArc {

    private func center(in rect: CGRect) -> CGPoint {
        .init(x: rect.midX, y: rect.midY)
    }

    
    private func radius(in rect: CGRect) -> CGFloat {
        (max(rect.width, rect.height) / 2) + (lineWidth / 2)
    }
}


// MARK: - View Variables
extension DashedRingLoader.CompletionArc {


}



// MARK: - Preview
struct DashedRingLoaderCompletionArc_Previews: PreviewProvider {

    static var previews: some View {
        DashedRingLoader.CompletionArc(
            percentage: 0.3
        )
        .frame(width: 200, height: 200)
    }
}
