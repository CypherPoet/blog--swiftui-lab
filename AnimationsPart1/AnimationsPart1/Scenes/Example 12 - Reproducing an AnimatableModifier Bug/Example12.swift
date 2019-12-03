//
//  Example12.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 12/2/19.
// ✌️
//

import SwiftUI


// As of Xcode 11.2.1, `PctModifier` WON'T work.
private struct ModifierOutsideOfContainerExampleView: View {
    @State private var flag = false
    
    var body: some View {
        Rectangle()
            .foregroundColor(.green)
            .frame(width: 100, height: 50)
            .modifier(PctModifier(pct: self.flag ? 0 : 1))
            .onTapGesture {
                withAnimation(.easeInOut(duration: 2.0)) {
                    self.flag.toggle()
                }
        }
    }
}


// As of Xcode 11.2.1, `PctModifier` WILL work.
private struct ModifierInsideOfContainerExampleView: View {
    @State private var flag = false
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.green)
                .frame(width: 100, height: 50)
                .modifier(PctModifier(pct: self.flag ? 0 : 1))
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 2.0)) {
                        self.flag.toggle()
                    }
            }
        }
    }
}

private struct PctModifier: AnimatableModifier {
    var pct: CGFloat = 0
    
    var animatableData: CGFloat {
        get { pct }
        set { pct = newValue }
    }
    
    func body(content: Content) -> some View {
        content.overlay(Text("\(Int(pct * 100))").font(.largeTitle).foregroundColor(.primary))
    }
}



struct Example12: View {
}


// MARK: - Body
extension Example12 {

    var body: some View {
        Group {
            ModifierOutsideOfContainerExampleView()
            ModifierInsideOfContainerExampleView()
        }
    }
}



// MARK: - Preview
struct Example12_Previews: PreviewProvider {

    static var previews: some View {
        Example12()
    }
}
