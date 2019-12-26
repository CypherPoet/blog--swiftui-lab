//
//  CustomTogglesExample.swift
//  CustomStyling
//
//  Created by CypherPoet on 12/23/19.
// ✌️
//

import SwiftUI


struct CustomTogglesExample: View {
    @State private var isToggled = false
}


// MARK: - Body
extension CustomTogglesExample {

    var body: some View {
        Form {
            Toggle(isOn: $isToggled) {
                Text("Likes Squares")
            }
            .toggleStyle(CustomToggleStyles.SquareToggle())
        }
    }
}


// MARK: - Computeds
extension CustomTogglesExample {


}


// MARK: - View Variables
extension CustomTogglesExample {


}



// MARK: - Preview
struct CustomTogglesExample_Previews: PreviewProvider {

    static var previews: some View {
        CustomTogglesExample()
    }
}
