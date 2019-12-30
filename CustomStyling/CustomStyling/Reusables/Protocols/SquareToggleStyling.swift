//
//  SquareToggleStyling.swift
//  CustomStyling
//
//  Created by CypherPoet on 12/28/19.
// ✌️
//

import UIKit


public protocol SquareToggleStyling {
    var trackWidth: CGFloat { get }
    var verticalSpacing: CGFloat { get }
    var fabWidth: CGFloat { get }
    var trackHeight: CGFloat { get }
    var cornerRadius: CGFloat { get }
}



extension SquareToggleStyling {
    var verticalSpacing: CGFloat { 2.0 }
    var fabWidth: CGFloat { (trackWidth / 2) }
    var trackHeight: CGFloat { (trackWidth / 2) }
    var cornerRadius: CGFloat { trackWidth * CGFloat(0.065) }
}
