//
//  Example6.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 10/24/19.
// ✌️
//

import SwiftUI



struct Example6: View {
    @State private var currentClockTime = ClockTime(hours: 2, minutes: 0, seconds: 10)
    @State private var scale: CGFloat = 1.0
    @State private var duration: Double = 1.0
}


// MARK: - Body
extension Example6 {
    
    var body: some View {
        VStack {
            ClockShape(time: currentClockTime)
                .stroke(Color.purple, lineWidth: 2)
                .animation(.easeInOut(duration: duration))
                .scaleEffect(scale)
                .animation(.easeInOut(duration: duration / 2))
                .padding()
                .layoutPriority(1)
                .frame(height: 400)
            

            controlsForm
            
        }
        .navigationBarTitle("Custom Shape Animation")
    }
}


// MARK: - View Variables
extension Example6 {
    
    private var controlsForm: some View {
        let clockTimes = [
            ClockTime(hours: 2, minutes: 0, seconds: 50),
            ClockTime(hours: 2, minutes: 1, seconds: 30),
            ClockTime(hours: 2, minutes: 10, seconds: 42),
            ClockTime(hours: 2, minutes: 33, seconds: 30),
            ClockTime(hours: 3, minutes: 01, seconds: 0),
        ]
        
        return List {
            
            VStack(spacing: 4.0) {
                Text("Times")
                    .font(.headline)
                
                Picker("Clock times", selection: $currentClockTime) {
                    ForEach(clockTimes, id: \.self) { clockTime in
                        Text(clockTime.formattedTime)
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
        }
    }
}


// MARK: - Preview
struct Example6_Preview: PreviewProvider {
    
    static var previews: some View {
        Example6()
    }
}
