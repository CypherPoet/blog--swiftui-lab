//
//  UserInfoFormViewModel.swift
//  ModalDismissGestureHacking
//
//  Created by CypherPoet on 12/11/19.
// ✌️
//


import SwiftUI
import Combine


final class UserInfoFormViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()

    @Binding var didAttemptDismissal: Bool
    @Published var warnsOnDismissal: Bool = false

    
    // MARK: - Published Outputs
    @Published var firstName: String = ""
    @Published var lastName: String = ""

    @Published var hasUnsavedChanges: Bool = false
    @Published var isShowingDismissalAlert: Bool = false


    // MARK: - Init
    init(
        warnsOnDismissal: Bool = false,
        didAttemptDismissal: Binding<Bool>
    ) {
        self.warnsOnDismissal = warnsOnDismissal
        self._didAttemptDismissal = didAttemptDismissal
        
        setupSubscribers()
    }
}


// MARK: - Publishers
extension UserInfoFormViewModel {

    private var hasUnsavedChangesPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($firstName, $lastName)
            .print("hasUnsavedChangesPublisher")
            .map {
                !$0.0.isEmpty ||
                !$0.1.isEmpty
            }
            .eraseToAnyPublisher()
    }
    
    
    private var didAttemptDismissalPublisher: AnyPublisher<Bool, Never> {
        CurrentValueSubject(didAttemptDismissal)
            .eraseToAnyPublisher()
    }
    
    
    private var isShowingDismissalAlertPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest3(
            $hasUnsavedChanges,
            $warnsOnDismissal,
            didAttemptDismissalPublisher
        )
            .print("isShowingDismissalAlertPublisher")
            .map { $0.0 && $0.1 && $0.2 }
            .eraseToAnyPublisher()
    }
}


// MARK: - Computeds
extension UserInfoFormViewModel {
}


// MARK: - Public Methods
extension UserInfoFormViewModel {
    
    func save() {
        print("Data Saved!")
        resetForm()
    }
    
    
    func resetForm() {
        firstName = ""
        lastName = ""
    }
}



// MARK: - Private Helpers
private extension UserInfoFormViewModel {

    func setupSubscribers() {
        hasUnsavedChangesPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.hasUnsavedChanges, on: self)
            .store(in: &subscriptions)
        
        
        isShowingDismissalAlertPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.isShowingDismissalAlert, on: self)
            .store(in: &subscriptions)
    }
}
