//
//  StripeClipShape.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/20/19.
// ✌️
//

import SwiftUI



struct StripeClipShape {
    var completionPercentage: CGFloat
    var stripeCount: Int
    var isHorizontal: Bool
    var isInsertion: Bool
}


// MARK: - AnimatableData
extension StripeClipShape {

    var animatableData: CGFloat {
        get { completionPercentage }
        set { completionPercentage = newValue }
    }
}


// MARK: - Shape
extension StripeClipShape: Shape {

    func path(in rect: CGRect) -> Path {
        isHorizontal ? horizontalStripesPath(in: rect) : verticalStripesPath(in: rect)
    }
    
    
    private func horizontalStripesPath(in rect: CGRect) -> Path {
        var path = Path()
        let stripeHeight = rect.height / CGFloat(stripeCount)

        for index in 0 ..< stripeCount {
            if isInsertion {
                path.addRect(
                    CGRect(
                        x: 0,
                        y: CGFloat(index) * stripeHeight,
                        width: rect.width,
                        height: stripeHeight * (1 - completionPercentage)
                    )
                )
            } else {
                path.addRect(
                    CGRect(
                        x: 0,
                        y: CGFloat(index) * stripeHeight + (stripeHeight * completionPercentage),
                        width: rect.width,
                        height: stripeHeight * (1 - completionPercentage)
                    )
                )
            }
        }
        
        return path
    }
    
    
    private func verticalStripesPath(in rect: CGRect) -> Path {
        var path = Path()
        let stripeWidth = rect.width / CGFloat(stripeCount)
        
        for index in 0 ..< stripeCount {
            if isInsertion {
                path.addRect(
                    CGRect(
                        x: CGFloat(index) * stripeWidth,
                        y: 0,
                        width: stripeWidth * (1 - completionPercentage),
                        height: rect.height
                    )
                )
            } else {
                path.addRect(
                    CGRect(
                        x: CGFloat(index) * stripeWidth + (stripeWidth * completionPercentage),
                        y: 0,
                        width: stripeWidth * (1 - completionPercentage),
                        height: rect.height
                    )
                )
            }
        }
        
        return path
    }
}
