//
//  View+RotateCompassNeedleEffect .swift
//  StateChanges
//
//  Created by CypherPoet on 1/23/20.
// ✌️
//

import SwiftUI


extension View {

    public func compassNeedleRotationEffect(
        cardinalDirection: Binding<CompassDirection>,
        angle: Angle
    ) -> some View {
        modifier(CompassNeedleRotationEffect(
            cardinalDirection: cardinalDirection,
            angle: angle
        ))
    }
}

