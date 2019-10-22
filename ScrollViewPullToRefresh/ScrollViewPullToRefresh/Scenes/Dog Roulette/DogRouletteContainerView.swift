//
//  DogRouletteContainerView.swift
//  ScrollViewPullToRefresh
//
//  Created by CypherPoet on 10/21/19.
// ✌️
//

import SwiftUI


struct DogRouletteContainerView: View {
    @ObservedObject var dogsViewModel: DogsViewModel
    
    private let dogs: [Dog]
    
    
    init(dogs: [Dog]) {
        self.dogs = dogs
        self.dogsViewModel = DogsViewModel(dogs: dogs)
    }
}


// MARK: - Body
extension DogRouletteContainerView {

    var body: some View {
        NavigationView {
            RefreshableScrollView(isRefreshing: $dogsViewModel.isLoading) {
                DogView(dog: dogsViewModel.currentDog)
                .padding()
                .padding()
                .background(Color(UIColor.systemBackground))
            }
            .background(Color(UIColor.secondarySystemBackground))
            .navigationBarTitle("Dog Roulette", displayMode: .large)
        }
        .onAppear {
            Appearance.set(navBarAppearance: Appearance.Navbar.default)
        }
    }
}


// MARK: - Preview
struct MainView_Previews: PreviewProvider {

    static var previews: some View {
        return DogRouletteContainerView(dogs: sampleDogs)
    }
}
