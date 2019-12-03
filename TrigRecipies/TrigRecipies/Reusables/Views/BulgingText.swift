//
//  BulgingText.swift
//  TrigRecipies
//
//  Created by CypherPoet on 12/2/19.
// ✌️
//

import SwiftUI


struct BulgingText: View {
    private var textValue: String
    private var baseFontWeight: Font.Weight
    
    init(
        _ textValue: String,
        baseFontWeight: Font.Weight = .bold
    ) {
        self.textValue = textValue
        self.baseFontWeight = baseFontWeight
    }
}


// MARK: - Body
extension BulgingText {

    var body: some View {
        let characterCount = textValue.count
        
        return HStack {
            ForEach(Array(textValue.enumerated()), id: \.0) { (index, character) in
                CharacterView(
                    character: character,
                    weight: self.baseFontWeight,
                    scale: self.scale(forCharacterAt: index, outOf: characterCount)
                )
            }
        }
    }
}


extension Double {
    static let twoPi = 2 * pi
    static let halfPi = pi / 2
}


// MARK: - Private Helpers
private extension BulgingText {
    
    func scale(forCharacterAt index: Int, outOf totalCharacterCount: Int) -> CGFloat {
        // Normalized character position, to a value between 0 and 1
        let x = Double(index) / Double(totalCharacterCount)
        
        // Get a number between 0 and 1, according to a sine wave
        let y = (sin((.twoPi * x) - .halfPi) + 1) / 2
        
        // Return a scale value from 1 (normal) to 3 (3 times the size).
        return 1.0 + (2.0 * CGFloat(y))
    }
}




// MARK: - Preview
struct BulgingText_Previews: PreviewProvider {

    static var previews: some View {
        BulgingText("AAAAAAAA")
            .font(.largeTitle)
    }
}



private struct CharacterView: View {
    var character: Character
    var weight: Font.Weight
    var scale: CGFloat
    
    
    var body: some View {
        Text(String(character))
            .fontWeight(weight)
            .scaleEffect(scale)
    }
}
