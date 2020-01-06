//
//  TorchingCPUView.swift
//  StateChanges
//
//  Created by CypherPoet on 1/4/20.
// ✌️
//

import SwiftUI


struct TorchingCPUView: View {
    @State private var counter = 0
}


// MARK: - Body
extension TorchingCPUView {

    var body: some View {
        DispatchQueue.main.async {
            self.counter += 1
        }
        
        return Text("Current View Render: \(counter)")
    }
}


// MARK: - Computeds
extension TorchingCPUView {


}


// MARK: - View Variables
extension TorchingCPUView {


}



// MARK: - Preview
struct TorchingCPUView_Previews: PreviewProvider {

    static var previews: some View {
        TorchingCPUView()
    }
}
