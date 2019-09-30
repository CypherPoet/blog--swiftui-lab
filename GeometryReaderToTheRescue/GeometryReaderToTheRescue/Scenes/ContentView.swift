//
//  ContentView.swift
//  GeometryReaderToTheRescue
//
//  Created by Brian Sipple on 9/30/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            VStack {
                Text("Applying the \"Rounded Corners\" view as a background")
                    .frame(height: 88)
                
                HStack {
                    
                    Text("Seattle")
                        .foregroundColor(.black)
                        .font(.title)
                        .padding()
                        .background(
                            RoundedCorners(
                                topRight: 30,
                                bottomLeft: 30,
                                backgroundColor: .green
                            )
                    )
                    
                    Text("Seahawks")
                        .foregroundColor(.black)
                        .font(.title)
                        .padding()
                        .background(
                            RoundedCorners(
                                topLeft: 30,
                                bottomRight: 30,
                                backgroundColor: .blue
                            )
                    )
                    
                }
                .padding(20)
                .border(Color.gray, width: 2)
            }
            
            VStack {
                
                Text("Applying the \"Rounded Corners\" view as an overlay")
                    .frame(height: 66)
                HStack {
                    
                    Text("Seattle")
                        .foregroundColor(.black)
                        .font(.title)
                        .padding()
                        .overlay(
                            RoundedCorners(
                                topRight: 30,
                                bottomLeft: 30,
                                backgroundColor: .green
                            )
                                .opacity(0.5)
                    )
                    
                    Text("Seahawks")
                        .foregroundColor(.black)
                        .font(.title)
                        .padding()
                        .background(
                            RoundedCorners(
                                topLeft: 30,
                                bottomRight: 30,
                                backgroundColor: .blue
                            )
                                .opacity(0.5)
                    )
                    
                }
                .padding(20)
                .border(Color.gray, width: 2)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
