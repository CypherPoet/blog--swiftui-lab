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
    @State private var drawAsMesh: Bool = false
}


// MARK: - Body
extension CustomPolygonExample {

    var body: some View {
        VStack {
            Polygon(
                sideCount: Int(sideCount),
                scale: scale,
                drawAsMesh: drawAsMesh
            )
            .stroke(Color.red)
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
//        VStack(spacing: 22.0) {
        List {
            
            HStack {
                Text("Draw As Mesh")

                Spacer()
                
                Toggle(isOn: $drawAsMesh) {
                    Text("Draw As Mesh")
                }
            }
            .padding(.vertical)
            
            
            VStack(spacing: 2) {
                Text("Sides: \(sideCount)")

                Slider(value: $sideCount, in: 1...30, step: 1, minimumValueLabel: Text("1"), maximumValueLabel: Text("30")) {
                    Text("Side Count")
                }
            }
            .padding(.vertical)
            
            
            VStack(spacing: 2) {
                Text("Scale: \(scale)")
                
                Slider(value: $scale, in: 0.01...1, minimumValueLabel: Text("0.01"), maximumValueLabel: Text("1")) {
                    Text("Scale: \(scale)")
                }
            }
            .padding(.vertical)
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
