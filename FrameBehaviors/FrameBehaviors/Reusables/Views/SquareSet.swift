//
//  SquareSet.swift
//  FrameBehaviors
//
//  Created by CypherPoet on 12/21/19.
// ✌️
//

import SwiftUI


/// All squares will be 20×20 in size and green in color. However,
/// when the width offered by the parent constrains the view, we'll only draw as
/// many squares as possible, while changingthe color to red to indicate that squares are missing.
///
/// (This is the equivalent of truncating a text view and showing the ellipses (…) character at the end.)
struct SquareSet: View {
    private let squareSize: CGFloat = 20.0
    private let squareSpacing: CGFloat = 5.0
    
    var squareCount: Int
}


// MARK: - Body
extension SquareSet {

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: self.squareSpacing) {
                ForEach(0 ..< self.maxSquareCount(givenParentWidth: geometry.size.width), id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 3.0)
                        .fill(self.squareColor(givenParentWidth: geometry.size.width))
                        .frame(width: self.squareSize, height: self.squareSize)
                }
            }
        }
        .frame(idealWidth: idealWidth, maxWidth: idealWidth)
        .border(Color.yellow, width: 2)
    }
}


// MARK: - Computeds
extension SquareSet {

    var idealWidth: CGFloat { CGFloat(squareCount) * (squareSpacing + squareSize) }
    
    
    func maxSquareCount(givenParentWidth parentWidth: CGFloat) -> Int {
        min(Int(parentWidth / (squareSize + squareSpacing)), squareCount)
    }
    
    
    func squareColor(givenParentWidth parentWidth: CGFloat) -> Color {
        maxSquareCount(givenParentWidth: parentWidth) == squareCount ? .green : .red
    }
}


// MARK: - View Variables
extension SquareSet {
}



// MARK: - Preview
struct SquareSet_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            SquareSet(squareCount: 8)
                .frame(width: 40)
            
            SquareSet(squareCount: 8)
        }
    }
}
