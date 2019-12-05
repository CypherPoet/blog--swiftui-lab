//
//  Example14.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 12/5/19.
// ✌️
//

import SwiftUI


struct Example14: View {
    @State private var completionPercentage: CGFloat = 0.0
    
    
    private var startColors: [UIColor] = [
        #colorLiteral(red: 1, green: 0.877946794, blue: 0, alpha: 1),
        #colorLiteral(red: 1, green: 0.589461267, blue: 0.2027931213, alpha: 1),
    ]
    
    private var endColors: [UIColor] = [
        #colorLiteral(red: 0.7437468171, green: 0.646396637, blue: 0.03841748461, alpha: 1),
        #colorLiteral(red: 0.6265649199, green: 0.3683329821, blue: 0.1237609759, alpha: 1),
    ]
}


// MARK: - Body
extension Example14 {

    var body: some View {
        VStack {
            Color.clear.overlay(
                EmptyView()
                    .animatableGradient(
                        startColors: startColors,
                        endColors: endColors,
                        cornerRadius: 24,
                        percentage: min(max(0.2, completionPercentage), 0.8)
                    )
                    .frame(width: 300, height: 300)
            )
        }
        .onAppear {
            withAnimation(
                Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)
            ) {
                self.completionPercentage = 1.0
            }
        }
        
    }
}


// MARK: - Computeds
extension Example14 {


}


// MARK: - View Variables
extension Example14 {
}



// MARK: - Preview
struct Example14_Previews: PreviewProvider {

    static var previews: some View {
        Example14()
    }
}
