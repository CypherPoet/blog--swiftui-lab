//
//  View+RetrieveBounds.swift
//  ViewExtensionsForBetterReusability
//
//  Created by CypherPoet on 10/17/19.
// ✌️
//

import Foundation
import SwiftUI



extension View {
    
    public func saveBounds(
        forViewID viewID: SavedBounds.PreferenceData.ID,
        in coordinateSpace: CoordinateSpace = .global
    ) -> some View {
        background(
            GeometryReader { geometry in
                Color.clear.preference(
                    key: SavedBounds.PreferenceKey.self,
                    value: [
                        SavedBounds.PreferenceData(
                            id: viewID, bounds: geometry.frame(in: coordinateSpace)
                        )
                    ]
                )
            }
        )
    }
    
    
    public func applyBounds(
        matchingViewID viewID: SavedBounds.PreferenceData.ID,
        to rectBinding: Binding<CGRect>
    ) -> some View {
        onPreferenceChange(SavedBounds.PreferenceKey.self) { preferences in
            DispatchQueue.main.async {
                // The async is used to prevent a possible blocking loop,
                // due to the child and the ancestor modifying each other.
                let preferenceData = preferences.first(where: { $0.id == viewID })
                
                rectBinding.wrappedValue = preferenceData?.bounds ?? .zero
            }
        }
    }
}
