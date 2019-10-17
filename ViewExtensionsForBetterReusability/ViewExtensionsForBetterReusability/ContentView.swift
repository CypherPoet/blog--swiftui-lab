//
//  ContentView.swift
//  ViewExtensionsForBetterReusability
//
//  Created by Brian Sipple on 10/16/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI
import ViewModifiers
import ImageUtils


struct ContentView: View {
    enum BoundsID {
        static let emojiView = UUID()
        static let sentenceView = UUID()
    }
    
    @State private var emojiViewBounds: CGRect = .zero
    @State private var sentenceViewBounds: CGRect = .zero
    
    
    var body: some View {
        
        VStack(spacing: 20) {
            Image("foobar", defaultSystemName: "table")
                .selectOnTap(borderColor: .blue, borderWidth: 4)

            emojiView
            sentenceView

            Spacer()
            
            LinearGradient(gradient: .init(colors: [Color.green, Color.blue]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)).frame(width: 50, height: 50)
                .selectOnTap(borderColor: .blue)

            boundsDetails

            Spacer()
        }
        .coordinateSpace(name: CoordinateSpaceName.mainViewBoundsDemo)
        .applyBounds(matchingViewID: BoundsID.emojiView, to: $emojiViewBounds)
        .applyBounds(matchingViewID: BoundsID.sentenceView, to: $sentenceViewBounds)
    }
}


extension ContentView {

    private var boundsDetails: some View {
        VStack {
            HStack {
                Spacer()
                Text("Bounds Data:")
                Spacer()
            }
            Text("Emoji View: \(emojiViewBounds.debugDescription)")
            Text("Sentence View: \(sentenceViewBounds.debugDescription)")
            
        }
    }
    
    
    private var emojiView: some View {
        Text("⚡️")
            .padding()
            .conditionallyApply(
                RoundedBorder(Color.pink, width: 12, cornerRadius: 8),
                if: true
            )
            .saveBounds(
                forViewID: BoundsID.emojiView,
                in: CoordinateSpace.named(CoordinateSpaceName.mainViewBoundsDemo)
            )
    }
    
    
    private var sentenceView: some View {
        Text("SwiftUI is the best UI")
            .padding()
            .conditionallyApply(
                RoundedBorder(Color.pink, width: 12, cornerRadius: 8),
                if: false,
                otherwiseApply: RoundedBorder(Color.yellow, width: 12, cornerRadius: 8)
            )
            .saveBounds(
                forViewID: BoundsID.sentenceView,
                in: CoordinateSpace.named(CoordinateSpaceName.mainViewBoundsDemo)
            )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
