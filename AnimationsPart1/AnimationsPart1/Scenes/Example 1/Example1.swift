//
//  Example1.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 10/23/19.
// ✌️
//

import SwiftUI


struct Example1: View {
    @State private var isScaledDown: Bool = false
    @State private var isDimmed: Bool = false
}


// MARK: - Computeds
extension Example1 {
    var currentScale: CGFloat { isScaledDown ? 0.5 : 1.0 }
    var currentOpacity: Double { isDimmed ? 0.3 : 1.0 }
}


// MARK: - Body
extension Example1 {

    var body: some View {
        GeometryReader { geometry in
                
            Image("link")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: geometry.size.width * 0.9)
                .scaleEffect(self.currentScale)
                .opacity(self.currentOpacity)
                .animation(.easeInOut(duration: 0.7))
                .onTapGesture {
                    self.isDimmed.toggle()
                    self.isScaledDown.toggle()
                }
        }
        .navigationBarTitle("Implicit Animation")
    }
}


// MARK: - Preview
struct Example1_Previews: PreviewProvider {

    static var previews: some View {
        Example1()
    }
}
