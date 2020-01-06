//
//  NumberFormatters.swift
//  StateChanges
//
//  Created by CypherPoet on 1/5/20.
// ✌️
//

import Foundation


enum NumberFormatters {
    
    static let cpuPercentage: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 3
        
        return formatter
    }()
}
