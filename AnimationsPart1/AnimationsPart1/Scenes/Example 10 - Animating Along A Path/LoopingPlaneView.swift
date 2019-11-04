//
//  LoopingPlaneView.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 11/3/19.
// ✌️
//

import SwiftUI


struct LoopingPlaneView: View {
    let container: GeometryProxy
    let loopLineWidth: CGFloat = 5.0
    
    @State private var loopAnimationPct: CGFloat = 0.0
}


// MARK: - Computeds
extension LoopingPlaneView {
    
    var rectForLoop: CGRect {
        CGRect(x: 0, y: 0, width: container.size.width, height: 300)
    }
    
    var pathForLoop: Path {
        InfinityShape.createInfinityPath(in: rectForLoop, lineWidth: loopLineWidth)
    }
}


// MARK: - Body
extension LoopingPlaneView {
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            InfinityShape(lineWidth: loopLineWidth)
                .stroke(
                    Color.purple,
                    style: StrokeStyle(
                        lineWidth: loopLineWidth,
                        lineCap: .round,
                        lineJoin: .miter,
                        miterLimit: 0,
                        dash: [7, 7],
                        dashPhase: 0
                    )
                )
                .frame(width: rectForLoop.width, height: rectForLoop.height)
            
            plane
                .onAppear {
                    withAnimation(
                        Animation.linear(duration: 4.0).repeatForever(autoreverses: false)
                    ) {
                        self.loopAnimationPct = 1.0
                    }
                }
        }
        .frame(alignment: .topLeading)
    }
}


// MARK: - View Variables
extension LoopingPlaneView {
    
    private var plane: some View {
        Image(systemName: "airplane")
            .resizable()
            .foregroundColor(.pink)
            .frame(width: 50, height: 50)
            .offset(x: -25, y: -25)
            .tracingEffect(path: pathForLoop, animationPct: loopAnimationPct)
    }
}



// MARK: - Preview
struct LoopingPlaneView_Previews: PreviewProvider {
    
    static var previews: some View {
        GeometryReader { geometry in
            LoopingPlaneView(container: geometry)
        }
    }
}
