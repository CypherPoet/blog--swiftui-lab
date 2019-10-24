//
//  Example5.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 10/23/19.
// ✌️
//

import SwiftUI



struct Example5: View {
    @State var numSides: Int = 4
    @State var scale: Double = 1.0
    @State var drawAsMesh: Bool = false
}


// MARK: - Body
extension Example5 {

    var body: some View {
        VStack {
            PolygonShape(sides: numSides, scale: scale, drawAsMesh: drawAsMesh)
                .stroke(Color.purple, lineWidth: 2)
                .animation(.easeOut(duration: 0.76))
                .padding()
                .layoutPriority(1)
                .frame(height: 500)

            
            Form {
                
                VStack(spacing: 4.0) {
                    Text("Number of sides")
                        .font(.headline)
                    
                    Picker("Number of Sides", selection: $numSides) {
                        ForEach([2, 3, 5, 10, 20, 40], id: \.self) { sideCount in
                            Text("\(sideCount)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .accessibility(label: Text("Select the number of sides"))
                }
                .padding()
                
                
                VStack(spacing: 4.0) {
                    Text("Scale")
                        .font(.headline)
                    
                    Slider(
                        value: $scale,
                        in: 0.1...1,
                        step: 0.01,
                        minimumValueLabel: Text("0.1"),
                        maximumValueLabel: Text("1")
                    ) {
                        Text("Scale")
                    }
                }.padding()
                
                
                Toggle(isOn: $drawAsMesh) {
                    Text("Draw As Mesh")
                }
            }
            
        }
        .navigationBarTitle("Example 5")
    }
}
// MARK: - Preview
struct Example4_Preview5: PreviewProvider {

    static var previews: some View {
        Example5()
    }
}
