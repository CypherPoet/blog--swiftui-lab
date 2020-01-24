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
        
        // 📝 When we update the state inside an async closure, we are
        // saying: "Finish computing the view body, and then, update the state".
        //
        // However, since a state change will trigger a view invalidation,
        // the view body will get computed again, a new state change will
        // be scheduled and this story will never end.
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
