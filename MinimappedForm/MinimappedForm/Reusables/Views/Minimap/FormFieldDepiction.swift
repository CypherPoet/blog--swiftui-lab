//
//  FormFieldDepiction.swift
//  MinimappedForm
//
//  Created by CypherPoet on 10/15/19.
// ✌️
//

import SwiftUI


extension Minimap {
    struct FormFieldDepiction: View {
        let fillColor: Color
        let fieldWidth: CGFloat
        let fieldHeight: CGFloat
        let offsetX: CGFloat
        let offsetY: CGFloat
        

        var body: some View {
            Rectangle()
                .fill(fillColor)
                .frame(width: fieldWidth, height: fieldHeight)
                .offset(x: offsetX, y: offsetY)
        }
    }

}



//struct FormFieldDepiction_Previews: PreviewProvider {
//    static var previews: some View {
//        Minimap.FormFieldDepiction()
//    }
//}
