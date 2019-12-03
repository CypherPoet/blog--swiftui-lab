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
                    
                    NavigationLink(destination: Example7()) {
                        Text("Example 7: Petal to the Metal 🌼")
                    }
                }
                
                
                Section(header: Text("Part 2: GeometryEffect")) {
                    NavigationLink(destination: Example8()) {
                        Text("Example 8: Skewed Sliding View")
                    }
                    
                    NavigationLink(destination: Example9()) {
                        Text("Example 9: Animation Feedback + 3D Rotation")
                    }
                    
                    NavigationLink(destination: Example10()) {
                        Text("Example 10: Animating Along a Path")
                    }
                    
                    NavigationLink(destination: Example11()) {
                        Text("Example 11: \"Ignored By Layout\"")
                    }
                }
                
                
                Section(header: Text("Part 3: AnimatableModifier")) {
                    NavigationLink(destination: Example12()) {
                        Text("Example 12: Reproducing an AnimatableModifier Bug")
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
