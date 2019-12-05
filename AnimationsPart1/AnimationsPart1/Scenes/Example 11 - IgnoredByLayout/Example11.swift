//
//  Example11.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 11/4/19.
// ✌️
//

import SwiftUI


struct Example11: View {
    @State private var xOffset: CGFloat = 0.0
}


// MARK: - Body
extension Example11 {

    var body: some View {
        VStack {
            SizeShowingLabel(color: .pink)
                .layoutIgnorableOffsetEffect(offsetX: xOffset)
            
            SizeShowingLabel(color: .purple)
                .layoutIgnorableOffsetEffect(offsetX: xOffset, ignoresLayout: false)
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 2.8).repeatForever()) {
                self.xOffset = 50
            }
        }
    }
}


// MARK: - View Variables
extension Example11 {
}


private struct SizeShowingLabel: View {
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 6, style: .continuous)
            .foregroundColor(color)
            .frame(width: 300, height: 50)
            .overlay(SizeReadingText())
    }
}


private struct SizeReadingText: View {
    var body: some View {
        
        GeometryReader { geometry in
            Text("X: \(Int(geometry.frame(in: .global).minX))")
                .frame(width: geometry.size.width)
        }
    }
}



// MARK: - Preview
struct Example11_Previews: PreviewProvider {

    static var previews: some View {
        Example11()
    }
}
