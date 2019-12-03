//
//  MainView.swift
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
                NavigationLink(destination: CustomPolygonExample()) {
                    Text("Example 1: Custom Polygon Shape")
                }
                NavigationLink(destination: BulgingTextExample()) {
                    Text("Example 2: Progressively Scaling Text")
                }
            }
            .navigationBarTitle("SwiftUI Trig Recipies")
        }
    }
}


// MARK: - Preview
struct MainView_Previews: PreviewProvider {

    static var previews: some View {
        MainView()
    }
}
