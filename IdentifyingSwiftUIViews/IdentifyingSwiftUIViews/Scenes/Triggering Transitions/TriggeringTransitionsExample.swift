//
//  TriggeringTransitionsExample.swift
//  IdentifyingSwiftUIViews
//
//  Created by CypherPoet on 2/1/20.
// ✌️
//

import SwiftUI


struct TriggeringTransitionsExample {
    @State private var circleSetViewID = 0
}


// MARK: - View
extension TriggeringTransitionsExample: View {

    var body: some View {
        
        VStack(spacing: 22) {
            AwesomeCircle()
                .frame(width: 230, height: 230)
                .transition(AnyTransition.opacity.combined(with: .slide))
                .id(circleSetViewID)
            
            Text("Circle View ID: \(circleSetViewID)")
            
            
            Button(action: {
                withAnimation(
                    Animation.easeOut(duration: 1.3)
                ) {
                    self.circleSetViewID += 1
                }
            }) {
                Text("Change ID")
            }
        }
    }
}


// MARK: - Computeds
extension TriggeringTransitionsExample {
}


// MARK: - View Variables
extension TriggeringTransitionsExample {
}


// MARK: - Private Helpers
private extension TriggeringTransitionsExample {
}



extension TriggeringTransitionsExample {
    struct AwesomeCircle {
        private let color: Color = [.red, .green, .blue, .purple, .orange, .pink, .yellow].randomElement()!
    }
}


extension TriggeringTransitionsExample.AwesomeCircle: View {
    
    var body: some View {
        Circle()
            .fill(color)
    }
}



// MARK: - Preview
struct TriggeringTransitionsExample_Previews: PreviewProvider {

    static var previews: some View {
        TriggeringTransitionsExample()
    }
}
