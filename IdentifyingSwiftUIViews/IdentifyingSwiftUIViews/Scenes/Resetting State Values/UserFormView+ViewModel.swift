//
//  UserFormView+ViewModel.swift
//  IdentifyingSwiftUIViews
//
//  Created by CypherPoet on 2/1/20.
// ✌️
//


import SwiftUI
import Combine


extension UserFormView {
    final class ViewModel: ObservableObject {
        private var subscriptions = Set<AnyCancellable>()


        // MARK: - Published Outputs
        @Published var firstNameText: String = ""
        @Published var lastNameText: String = ""


        // MARK: - Init
        init() {
            setupSubscribers()
        }
    }
}


// MARK: - Publishers
extension UserFormView.ViewModel {

    private var someValuePublisher: AnyPublisher<String, Never> {
        Just("")
            .eraseToAnyPublisher()
    }
}


// MARK: - Computeds
extension UserFormView.ViewModel {
}


// MARK: - Public Methods
extension UserFormView.ViewModel {
}



// MARK: - Private Helpers
private extension UserFormView.ViewModel {

    func setupSubscribers() {
//        someValuePublisher
//            .receive(on: DispatchQueue.main)
//            .assign(to: \.someValue, on: self)
//            .store(in: &subscriptions)
    }
}
