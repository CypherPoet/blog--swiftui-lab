//
//  CustomPolygonExample.swift
//  TrigRecipies
//
//  Created by CypherPoet on 11/11/19.
// ✌️
//

import SwiftUI


struct CustomPolygonExample: View {
    @State private var sideCount: CGFloat = 3.0
    @State private var scale: CGFloat = 1.0
}


// MARK: - Body
extension CustomPolygonExample {

    var body: some View {
        VStack {
            Polygon(
                sideCount: Int(sideCount),
                scale: scale
            )
            .animation(.easeInOut(duration: 1.3))
            
            
            controls
                .padding()
        }
    }
}


// MARK: - Computeds
extension CustomPolygonExample {

}


// MARK: - View Variables
extension CustomPolygonExample {
    
    private var controls: some View {
        VStack(spacing: 22.0) {
            
            VStack(spacing: 8) {
                Text("Sides: \(sideCount)")

                Slider(value: $sideCount, in: 1...30, step: 1, minimumValueLabel: Text("1"), maximumValueLabel: Text("30")) {
                    Text("Side Count")
                }
            }
            
            VStack(spacing: 8) {
                Text("Scale: \(scale)")

                Slider(value: $scale, in: 0.01...1, minimumValueLabel: Text("0.01"), maximumValueLabel: Text("1")) {
                    Text("Scale: \(scale)")
                }
            }
        }
        .labelsHidden()
    }

}



// MARK: - Preview
struct CustomPolygonExample_Previews: PreviewProvider {

    static var previews: some View {
        CustomPolygonExample()
    }
}
