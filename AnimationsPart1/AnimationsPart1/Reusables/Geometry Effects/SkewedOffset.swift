//
//  SkewedOffset.swift
//  AnimationsPart1
//
//  Created by CypherPoet on 11/1/19.
// ✌️
//

import SwiftUI


struct SkewedOffset {
    var currentOffset: CGFloat
    
    /// To simulate keyframes, this will animate between 0 and 1
    var animationPct: CGFloat
    
    
    let direction: Direction
}


extension SkewedOffset {
    enum Direction {
        case left
        case right
        
        var skewMultiplier: CGFloat {
            switch self {
            case .left:
                return 1.0
            case .right:
                return -1.0
            }
        }
    }
}




// MARK: - Animatable Data
extension SkewedOffset {
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { AnimatablePair(currentOffset, animationPct) }
        
        set {
            currentOffset = newValue.first
            animationPct = newValue.second
        }
    }
}


// MARK: - Computeds
extension SkewedOffset {

    var currentSkew: CGFloat {
        switch animationPct {
        case 0 ..< 0.2:
            return (animationPct * 5) * 0.5 * direction.skewMultiplier
        case 0.2 ... 0.8:
            return 0.5 * direction.skewMultiplier
        default:
            return ((1 - animationPct) * 5) * 0.5 * direction.skewMultiplier
        }
    }
}


// MARK: - GeometryEffect
extension SkewedOffset: GeometryEffect {
    
    
    /// Effect: The skew effect needs to increase and decrease during the first and last 20% of
    /// the animation.
    ///
    /// In the middle of the animation, the skew effect will remain steady.
    
    
    /// Creates an effect that skews and moves our view
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(
                a: 1, b: 0, c: currentSkew, d: 1, tx: currentOffset, ty: 0
            )
        )
    }
}



// MARK: - Preview
struct SkewedOffset_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            EmptyView()
        }
    }
}
