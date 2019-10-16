//
//  ContentView.swift
//  ViewExtensionsForBetterReusability
//
//  Created by Brian Sipple on 10/16/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Text("Hello World")
            .padding()
            .roundedBorder(Color.pink, width: 2, cornerRadius: 8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
