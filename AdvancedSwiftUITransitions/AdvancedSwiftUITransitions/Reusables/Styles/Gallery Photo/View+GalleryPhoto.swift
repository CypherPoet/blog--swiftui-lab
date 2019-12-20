//
//  View+GalleryPhoto.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/18/19.
// ✌️
//

import SwiftUI


extension Image {

    public func galleryPhotoStyle(

    ) -> some View {
        self
            .resizable()
            .scaledToFit()
            .modifier (
                GalleryPhoto(
                
                )
            )
    }
}
