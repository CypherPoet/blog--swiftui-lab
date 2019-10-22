//
//  DogsViewModel.swift
//  ScrollViewPullToRefresh
//
//  Created by CypherPoet on 10/21/19.
// ✌️
//

import Foundation
import Combine


final class DogsViewModel: ObservableObject {
    @Published var dogs: [Dog]
    @Published var currentDog: Dog
    
    @Published var isLoading: Bool = false {
        didSet {
            if isLoading && oldValue == false {
                self.loadNewDog()
            }
        }
    }
    
    private var currentDogIndex: Int
    
    
    init(dogs: [Dog]) {
        self.dogs = dogs
        self.currentDogIndex = 0
        self.currentDog = dogs[currentDogIndex]
    }
}


// MARK: - Private Helpers
extension DogsViewModel {

    /// Simulates an async task for loading a new dog
    private func loadNewDog() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.currentDogIndex = self.currentDogIndex + 1 % self.dogs.count
            
            self.currentDog = self.dogs[self.currentDogIndex]
            self.isLoading = false
        }
    }
}
