//
//  Example2.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 10/23/19.
// ✌️
//

import SwiftUI


struct Example2: View {
    @State private var isScaledDown: Bool = false
    @State private var isDimmed: Bool = false
}


// MARK: - Computeds
extension Example2 {
    var currentScale: CGFloat { isScaledDown ? 0.5 : 1.0 }
    var currentOpacity: Double { isDimmed ? 0.3 : 1.0 }
}


// MARK: - Body
extension Example2 {

    var body: some View {
        GeometryReader { geometry in
                
            Image("link")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: geometry.size.width * 0.9)
                .scaleEffect(self.currentScale)
                .opacity(self.currentOpacity)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.7)) {
                        self.isScaledDown.toggle()
                        self.isDimmed.toggle()
                    }
                }
        }
        .navigationBarTitle("Explicit Animation")
    }
}



// MARK: - Preview
struct Example2_Previews: PreviewProvider {

    static var previews: some View {
        Example2()
    }
}
