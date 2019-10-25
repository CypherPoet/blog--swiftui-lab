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
                        Text("Example 3: Animating Polygon Sides")
                    }
                    
                    NavigationLink(destination: Example4()) {
                        Text("Example 4: Animating Multiple Polygon Properties")
                    }
                    
                    NavigationLink(destination: Example5()) {
                        Text("Example 5: Vertex-Connected Polygons")
                    }
                    
                    NavigationLink(destination: Example6()) {
                        Text("Example 6: Custom Animatable Types")
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
