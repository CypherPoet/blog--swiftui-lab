//
//  DismissGuardianViewModel.swift
//  ModalDismissGestureHacking
//
//  Created by CypherPoet on 12/11/19.
// ✌️
//


import SwiftUI
import Combine


final class DismissGuardianDemoViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()


    // MARK: - Published Outputs
    @Published var preventsDismissal: Bool = false
    @Published var didAttemptDismissal: Bool = false


    // MARK: - Init
    init() {
        setupSubscribers()
    }
}


// MARK: - Publishers
extension DismissGuardianDemoViewModel {

    private var someValuePublisher: AnyPublisher<String, Never> {
        Just("")
            .eraseToAnyPublisher()
    }
}


// MARK: - Computeds
extension DismissGuardianDemoViewModel {
}


// MARK: - Public Methods
extension DismissGuardianDemoViewModel {
}



// MARK: - Private Helpers
private extension DismissGuardianDemoViewModel {

    func setupSubscribers() {
    }
}
