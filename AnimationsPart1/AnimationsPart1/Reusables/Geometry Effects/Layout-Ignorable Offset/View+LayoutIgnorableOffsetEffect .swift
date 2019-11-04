//
//  View+LayoutIgnorableOffsetEffect .swift
//  AnimationsPart1
//
//  Created by CypherPoet on 11/4/19.
// ✌️
//

import SwiftUI


extension View {

    public func layoutIgnorableOffsetEffect(
        offsetX: CGFloat = 0.0,
        offsetY: CGFloat = 0.0,
        ignoresLayout: Bool = true
    ) -> some View {
        Group {
            if ignoresLayout {
                modifier(
                    LayoutIgnorableOffsetEffect(
                        offsetX: offsetX,
                        offsetY: offsetY
                    )
                    .ignoredByLayout()
                )
            } else {
                modifier(
                    LayoutIgnorableOffsetEffect(
                        offsetX: offsetX,
                        offsetY: offsetY
                    )
                )
            }
        }
    }
}

