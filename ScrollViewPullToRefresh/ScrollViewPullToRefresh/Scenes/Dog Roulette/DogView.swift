//
//  DogView.swift
//  ScrollViewPullToRefresh
//
//  Created by CypherPoet on 10/22/19.
// ✌️
//

import SwiftUI
import CypherPoetSwiftUIKitImageUtils


struct DogView: View {
    let dog: Dog
}


// MARK: - Body
extension DogView {

    var body: some View {
        VStack {
            Image(dog.picture, defaultSystemName: "questionmark.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 160)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                .padding(2)
                .overlay(Circle().strokeBorder(Color.black.opacity(0.1)))
                .shadow(radius: 3)
                .padding(4)
            
            Text(dog.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(dog.origin)
                .font(.headline)
                .foregroundColor(.blue)
            
            Text(dog.description)
                .lineLimit(nil)
                .frame(height: 1000, alignment: .top)
                .padding(.top, 20)
            
        }
    }
}


// MARK: - Preview
struct DogView_Previews: PreviewProvider {

    static var previews: some View {
        DogView(dog: sampleDogs[0])
    }
}
