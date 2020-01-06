//
//  CPUWheel+ViewModel.swift
//  StateChanges
//
//  Created by CypherPoet on 1/4/20.
// ✌️
//


import SwiftUI
import Combine


extension CPUWheel {
    
    final class ViewModel: ObservableObject {
        private var subscriptions = Set<AnyCancellable>()
        
        
        // MARK: - Published Properties
        @Published var cpuPercentage: CGFloat = 0.0
        
        
        // MARK: - Init
        init() {
            setupSubscribers()
        }
    }
}


// MARK: - Publishers
extension CPUWheel.ViewModel {
    
    private var timePublisher: AnyPublisher<Date, Never> {
        Timer.publish(every: 0.1, on: .current, in: .common)
            .autoconnect()
            .eraseToAnyPublisher()
    }
    
    
    private var cpuPercentagePublisher: AnyPublisher<CGFloat, Never> {
        timePublisher
            .map { _ in CGFloat(CPUReader.getUsage()) }
            .eraseToAnyPublisher()
    }
}


// MARK: - Computeds
extension CPUWheel.ViewModel {
    
    var formattedCPUPercentage: String {
        NumberFormatters.cpuPercentage.string(for: cpuPercentage) ?? ""
    }
}


// MARK: - Public Methods
extension CPUWheel.ViewModel {
}



// MARK: - Private Helpers
private extension CPUWheel.ViewModel {
    
    func setupSubscribers() {
        cpuPercentagePublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.cpuPercentage, on: self)
            .store(in: &subscriptions)
    }
}
