//
//  DashedRingLoader+PercentageLabel.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 12/4/19.
// ✌️
//

import SwiftUI


extension DashedRingLoader {
    
    struct PercentageLabel: View {
        let percentage: CGFloat
        
        let font: Font
        let fontWeight: Font.Weight
        
        
        static let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            
            formatter.numberStyle = .percent
            
            // Add a space in between the number and the percent symbol
            formatter.positiveSuffix = " \(formatter.positiveSuffix!)"
            formatter.negativeSuffix = " \(formatter.negativeSuffix!)"
            
            return formatter
        }()
    }
}


// MARK: - Body
extension DashedRingLoader.PercentageLabel {

    var body: some View {
        Text(Self.formatter.string(for: percentage) ?? "")
            .fontWeight(fontWeight)
            .font(font)
    }
}


// MARK: - Computeds
extension DashedRingLoader.PercentageLabel {


}


// MARK: - View Variables
extension DashedRingLoader.PercentageLabel {


}



// MARK: - Preview
struct DashedRingLoaderPercentageLabel_Previews: PreviewProvider {

    static var previews: some View {
        DashedRingLoader.PercentageLabel(
            percentage: 0.33,
            font: .largeTitle,
            fontWeight: .bold
        )
        .frame(width: 200, height: 200)
    }
}
