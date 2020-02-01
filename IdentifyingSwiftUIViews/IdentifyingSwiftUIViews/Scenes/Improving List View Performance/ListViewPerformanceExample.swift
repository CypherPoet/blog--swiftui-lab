//
//  ListViewPerformanceExample.swift
//  IdentifyingSwiftUIViews
//
//  Created by CypherPoet on 2/1/20.
// ✌️
//

import SwiftUI

// When Lists start to have a few hundred rows, performance can become an issue if
// the backing array is modified.
//
// This is because, in its quest for being so “automatic”, SwiftUI tries to diff
// the before and after rows, detect the changes, and animate the modified rows
// into their new locations.
//
// This is a wonderful feature, but it can play against us when dealing with large data sets.
// 
// Some of those problems can be solved with the .id() method.
//
// By assigning an id to the List view, we can make sure we update that
// id whenever we update the array.
// This prevents SwiftUI from diffing the before and after, and instead,
// it creates a brand new List.
//
// This trick may help us deal with long lists, but there are a couple of
// downsides, which depending on your actual needs, may become a show stopper, or not:
//
//  - Changes to row locations will not be animated.
//  - The scroll position will reset to the top.


struct ListViewPerformanceExample {
    @State private var strings: [String] = (0..<500).map { _ in UUID().uuidString }
    @State private var stringListID = 1
}


// MARK: - View
extension ListViewPerformanceExample: View {

    var body: some View {
        VStack {
            List(strings, id: \.self) { string in
                Text(string)
            }
            .id(stringListID)  // Comment and uncomment to compare the diffing performance!
            
            
            Button(action: {
                self.strings.shuffle()
                self.stringListID += 1
            }) {
                Text("Shuffle Strings")
            }
        }
    }
}


// MARK: - Computeds
extension ListViewPerformanceExample {
}


// MARK: - View Variables
extension ListViewPerformanceExample {
}


// MARK: - Private Helpers
private extension ListViewPerformanceExample {
}



// MARK: - Preview
struct ListViewPerformanceExample_Previews: PreviewProvider {

    static var previews: some View {
        ListViewPerformanceExample()
    }
}
