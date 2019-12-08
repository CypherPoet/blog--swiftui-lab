//
//  ClippedCounter.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 12/6/19.
// ✌️
//

import SwiftUI


// TODO: Some of this can be more configurable
//      - The colors, border, font size, etc.


struct ClippedCounter {
    var currentNumber: Double

    @State private var height: CGFloat = 0.0
}


// MARK: - Animatable Data
extension ClippedCounter {
    
    var animatableData: Double {
        get { currentNumber }
        set { currentNumber = newValue }
    }
}


// MARK: - AnimatableModifier
extension ClippedCounter: AnimatableModifier {

    func body(content: Content) -> some View {
        HStack {
            DigitSet(
                focusedDigit: activeDigits[0],
                lowerBaseDigit: activeDigits[1],
                counterNumber: currentNumber
            )
            
            DigitSet(
                focusedDigit: activeDigits[1],
                counterNumber: currentNumber
            )
        }
        .clipShape(ClipShape())
        .background(CounterBackground(height: $height))
    }
}


// MARK: - View Variables
private extension ClippedCounter {

}


// MARK: - Computeds
extension ClippedCounter {
    
    var activeDigits: [Int] {
        String(describing: currentNumber + 1).compactMap { Int(String($0)) }
    }
}


// MARK: - Preview
struct ClippedCounter_Previews: PreviewProvider {

    static var previews: some View {
        EmptyView()
    }
}



private struct DigitSet: View {
    var focusedDigit: Int
    var lowerBaseDigit: Int? = nil
    var counterNumber: Double
    
    
    var body: some View {
        VStack {
            ForEach(visibleDigits, id: \.self) { digitString in
                Text(digitString)
                    .font(.title)
            }
        }
        .foregroundColor(Color.green).modifier(SlideUpEffect(percentage: offsetPercentage))
    }
    
    
    
    var visibleDigits: [String] {
        let focusedDigit =  Double(self.focusedDigit)
        
        return [
            abs(focusedDigit - 2),
            abs(focusedDigit - 1),
            abs(focusedDigit),
            abs(focusedDigit + 1),
            abs(focusedDigit + 2),
        ]
        .map(getUnitDigit(for:))
        .compactMap(String.init)
    }
    
    
    
    var offsetPercentage: CGFloat {
        if lowerBaseDigit == nil || lowerBaseDigit! == 0 {
            return 1 - CGFloat(counterNumber - Double(Int(counterNumber)))
        } else {
            return 0
        }
    }
    
    
    func getUnitDigit(for number: Double) -> Int {
        abs(Int(number) - ((Int(number) / 10) * 10))
    }
}



private struct SlideUpEffect: GeometryEffect {
    var percentage: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        .init(CGAffineTransform(translationX: 0, y: (size.height / 5.0) * percentage))
    }
}



private struct ClipShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        let visibleHeight = (rect.height / 5.0 + 30.0)
        var path = Path()
        
        let clippedRect = CGRect(
            x: 0,
            y: (rect.height - visibleHeight) * 0.5,
            width: rect.width,
            height: visibleHeight
        )
        
        path.addRoundedRect(
            in: clippedRect,
            cornerSize: CGSize(width: 5.0, height: 5.0)
        )
        
        return path
    }
}



private struct CounterBackground: View {
    @Binding var height: CGFloat

    
    var body: some View {
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 5.0)
                .fill(Color.black)
                .frame(width: 80, height: geometry.size.height / 5.0 + 30)
        }
    }
}
