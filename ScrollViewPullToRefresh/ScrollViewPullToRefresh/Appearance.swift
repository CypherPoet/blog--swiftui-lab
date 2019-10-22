//
//  Appearance.swift
//  ScrollViewPullToRefresh
//
//  Created by CypherPoet on 10/22/19.
// ✌️
//

import UIKit


enum Appearance {
    
    enum Navbar {
        static let `default`: UINavigationBarAppearance = {
            let appearance = UINavigationBarAppearance()
            
            appearance.configureWithOpaqueBackground()
            
            return appearance
        }()
    }
    
    
    static func set(navBarAppearance: UINavigationBarAppearance) {
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
}

