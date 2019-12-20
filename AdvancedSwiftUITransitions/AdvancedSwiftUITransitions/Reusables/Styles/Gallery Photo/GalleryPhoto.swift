//
//  GalleryPhoto.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/18/19.
// ✌️
//

import SwiftUI


struct GalleryPhoto {

}


// MARK: - Animatable Data
extension GalleryPhoto {
}


// MARK: - ViewModifier
extension GalleryPhoto: ViewModifier {

    func body(content: Content) -> some View {
        content
            .clipShape(photoFrame)
            .overlay(photoFrame.stroke(Color.white, lineWidth: 2))
            .padding(2)
            .overlay(photoFrame.strokeBorder(Color.black.opacity(0.1)))
            .shadow(radius: 2)
            .padding(4)
    }
}


extension GalleryPhoto {
    
    private var photoFrame: RoundedRectangle {
        .init(cornerRadius: 12)
    }
}


// MARK: - Preview
struct GalleryPhoto_Previews: PreviewProvider {

    static var previews: some View {
        EmptyView()
    }
}
