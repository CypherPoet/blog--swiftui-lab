//
//  ClockTime.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 10/24/19.
// ✌️
//

import Foundation
import SwiftUI


struct ClockTime {

    /// Hour needle should jump by integer numbers
    var hours: Int
    
    /// Minute needle should jump by integer numbers
    var minutes: Int
    
    /// Second needle should move smoothly
    var seconds: Double
    
    
    private static let secondsPerHour = 60 * 60
    private static let secondsPerMinute = 60
    
    private static let clockUnitFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        formatter.minimumIntegerDigits = 2
        
        return formatter
    }()
}

extension ClockTime: Hashable {}


// MARK: - Initializers
extension ClockTime {

    /// Initialize from a total number of seconds
    init(totalSeconds: Double) {
        let hours = Int(totalSeconds) / Self.secondsPerHour
        
        let minutes = (
            (Int(totalSeconds) - (hours * Self.secondsPerHour))
            / Self.secondsPerMinute
        )
        
        let seconds = totalSeconds
            - Double(hours * Self.secondsPerHour)
            - Double(minutes * Self.secondsPerMinute)
        
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }
}


// MARK: - Computeds
extension ClockTime {
    
    var totalSeconds: Double {
        Double(hours * Self.secondsPerHour)
            + Double(minutes * Self.secondsPerMinute)
            + seconds
    }

    
    var formattedHours: String { Self.clockUnitFormatter.string(for: hours) ?? "" }
    var formattedMinutes: String { Self.clockUnitFormatter.string(for: minutes) ?? "" }
    var formattedSeconds: String { Self.clockUnitFormatter.string(for: seconds) ?? "" }
    

    var formattedTime: String {
        [formattedHours, formattedMinutes, formattedSeconds]
            .joined(separator: ":")
    }
}


// MARK: - VectorArithmetic
extension ClockTime: VectorArithmetic {
    
    static var zero: ClockTime { .init(totalSeconds: 0) }
    
    var magnitudeSquared: Double { 1 }
    
    
    mutating func scale(by rhs: Double) {
        var totalSeconds = self.totalSeconds
        totalSeconds.scale(by: rhs)

        let newClockTime = ClockTime(totalSeconds: totalSeconds)
        
        self.hours = newClockTime.hours
        self.minutes = newClockTime.minutes
        self.seconds = newClockTime.seconds
    }
    
    
    static func - (lhs: ClockTime, rhs: ClockTime) -> ClockTime {
        .init(totalSeconds: lhs.totalSeconds - rhs.totalSeconds)
    }
    
    static func -= (lhs: inout ClockTime, rhs: ClockTime) {
        lhs = lhs - rhs
    }
    
    
    static func + (lhs: ClockTime, rhs: ClockTime) -> ClockTime {
        .init(totalSeconds: lhs.totalSeconds + rhs.totalSeconds)
    }
    
    static func += (lhs: inout ClockTime, rhs: ClockTime) {
        lhs = lhs + rhs
    }
}
