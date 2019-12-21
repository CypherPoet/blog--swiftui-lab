//
//  SquareFixerView.swift
//  FrameBehaviors
//
//  Created by CypherPoet on 12/21/19.
// ✌️
//

import SwiftUI


struct SquareFixerView: View {
    @State private var squareContainerWidth: CGFloat = 100.0
    @State private var isSquareWidthFixed = false
}


// MARK: - Body
extension SquareFixerView {

    var body: some View {
        
        VStack {
            Spacer()
            self.squaresSection
            Spacer()

            Form {
                self.controlsSection
            }
        }
        .padding(.top, 40)
    }
}


// MARK: - Computeds
extension SquareFixerView {


}


// MARK: - View Variables
extension SquareFixerView {

    private var squaresSection: some View {
        VStack {
            SquareSet(squareCount: 6)
                .border(Color.primary, width: 2)
                .fixedSize(horizontal: self.isSquareWidthFixed, vertical: false)
        }
        .frame(width: self.squareContainerWidth)
        .background(self.backgroundGradient)
    }

    
    private var controlsSection: some View {
        Group {
            Section {
                GeometryReader { geometry in
                        Slider(
                            value: self.$squareContainerWidth,
                            in: 0...geometry.size.width,
                            minimumValueLabel: Text("0"),
                            maximumValueLabel: Text("\(Int(geometry.size.width))")
                        ) {
                            Text("Width")
                        }
                }
            }
        
            Section {
                Toggle(isOn: self.$isSquareWidthFixed) {
                    Text("Fixed Width")
                }
            }
        }
    }
    
    
    private var backgroundGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    Color.red.opacity(0.2),
                    Color.green.opacity(0.2),
                ]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}



// MARK: - Preview
struct SquareFixerView_Previews: PreviewProvider {

    static var previews: some View {
        SquareFixerView()
    }
}
