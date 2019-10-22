//
//  ActivityIndicator.swift
//  ScrollViewPullToRefresh
//
//  Created by CypherPoet on 10/22/19.
// ✌️
//

import SwiftUI


struct ActivityIndicator: UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView
    

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIViewType {
        UIActivityIndicatorView()
    }
    
    
    func updateUIView(_ activityIndicator: UIViewType, context: UIViewRepresentableContext<ActivityIndicator>) {
        activityIndicator.startAnimating()
    }
}
