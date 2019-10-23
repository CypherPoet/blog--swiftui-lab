//
//  MainView.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 10/23/19.
// ✌️
//

import SwiftUI


struct MainView: View {
}


// MARK: - Body
extension MainView {

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Part 1: Path Animations")) {
                    NavigationLink(destination: Example1()) {
                        Text("Example 1: Implicit Animation")
                    }
                    
                    NavigationLink(destination: Example2()) {
                        Text("Example 2: Explicit Animation")
                    }
                    
                    
                    NavigationLink(destination: Example3()) {
                        Text("Example 2: Drawing Polygon Shapes")
                    }
                }
            }
            .navigationBarTitle("SwiftUI Animation")
        }
        
    }
}


// MARK: - Preview
struct MainView_Previews: PreviewProvider {

    static var previews: some View {
        MainView()
    }
}
