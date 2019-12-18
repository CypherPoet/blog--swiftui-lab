//
//  LabelView.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/17/19.
// ✌️
//

import SwiftUI


struct LabelView: View {
    var title: String
}


// MARK: - Body
extension LabelView {

    var body: some View {
        Text(title)
            .padding()
            .font(.title)
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.purple)
                    .shadow(color: .gray, radius: 3, x: 0, y: 0)
            )
    }
}


// MARK: - Computeds
extension LabelView {


}


// MARK: - View Variables
extension LabelView {


}



// MARK: - Preview
struct LabelView_Previews: PreviewProvider {

    static var previews: some View {
        LabelView(title: "Sample Label 🤷‍♂️")
    }
}
