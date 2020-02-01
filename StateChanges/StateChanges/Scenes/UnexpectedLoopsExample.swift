//
//  UnexpectedLoopsExample.swift
//  StateChanges
//
//  Created by CypherPoet on 1/24/20.
// ✌️
//

import SwiftUI


struct UnexpectedLoopsExample {
    @State private var width: CGFloat = 0.0
}


// MARK: - View
extension UnexpectedLoopsExample: View {

    var body: some View {
        Text("Current Width: \(width)")
//            .font(.largeTitle)
            // With the Menlo font, all numbers have the same size,
            // so no matter the value, the text view width will remain stable.
            .font(.custom("Menlo", size: 32))
            .background(WidthGetter(width: $width))
    }
}


// MARK: - Computeds
extension UnexpectedLoopsExample {
}


// MARK: - View Variables
extension UnexpectedLoopsExample {
}


// MARK: - Views
extension UnexpectedLoopsExample {
    struct WidthGetter {
        @Binding var width: CGFloat
    }
}

extension UnexpectedLoopsExample.WidthGetter: View {
    
    var body: some View {
        GeometryReader { geometry -> AnyView in
            DispatchQueue.main.async {
                self.width = geometry.frame(in: .local).width
            }
            
            return AnyView(Color.clear)
        }
    }
}



// MARK: - Private Helpers
private extension UnexpectedLoopsExample {
}




// MARK: - Preview
struct UnexpectedLoopsExample_Previews: PreviewProvider {

    static var previews: some View {
        UnexpectedLoopsExample()
    }
}
