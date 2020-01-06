//
//  CPUWheel.swift
//  StateChanges
//
//  Created by CypherPoet on 1/4/20.
// ✌️
//

import SwiftUI


struct CPUWheel: View {
    @ObservedObject private var viewModel = ViewModel()
}


// MARK: - Body
extension CPUWheel {

    var body: some View {
        Circle()
            .stroke(Color.black, lineWidth: 3)
            .foregroundColor(.primary)
            .background(
                Circle()
                    .fill(wheelGradient)
                    .clipShape(CircleArcClipShape(completionPercentage: viewModel.cpuPercentage))
            )
            .shadow(radius: 4)
            .overlay(cpuLabel)
    }
}


// MARK: - Computeds
extension CPUWheel {}


// MARK: - View Variables
extension CPUWheel {
    
    private var wheelGradient: AngularGradient {
        .init(
            gradient: Gradient(
                colors: [.green, .yellow, .red]
            ),
            center: .center
        )
    }
    
    
    private var cpuLabel: some View {
        VStack {
            Text(viewModel.formattedCPUPercentage)
                .font(.title)
                .fontWeight(.semibold)
            
            Text("CPU")
                .font(.body)
        }
        .transaction( { $0.animation = nil })
    }
}



// MARK: - Preview
struct CPUWheel_Previews: PreviewProvider {

    static var previews: some View {
        CPUWheel()
    }
}
