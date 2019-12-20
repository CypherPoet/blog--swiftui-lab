//
//  CustomShapeTransitionsExample.swift
//  AdvancedSwiftUITransitions
//
//  Created by CypherPoet on 12/18/19.
// ✌️

import SwiftUI


struct CustomShapeTransitionsExample: View {
    @State private var isShowingDetailsView = false
    @State private var currentTransitionType: TransitionType = .scale
    @State private var currentImageIndex = 0
    
    
    private let images = [
        Image("GhostsOfTsushima1"),
        Image("GhostsOfTsushima2"),
        Image("GhostsOfTsushima3"),
        Image("GhostsOfTsushima4"),
    ]
}


// MARK: - Body
extension CustomShapeTransitionsExample {

    var body: some View {
        
        VStack(spacing: 32) {

            VStack(alignment: .center) {
                HStack {
                    Text("Picture Show")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                
                Picker("Current Transition", selection: $currentTransitionType) {
                    ForEach(TransitionType.allCases, id: \.self) { transitionType in
                        Text(transitionType.displayName).tag(transitionType)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            
            ZStack {
                ForEach(0 ..< images.count, id: \.self) { index in
                    Group {
                        if index == self.currentImageIndex {
                            self.currentImage
                                .galleryPhotoStyle()
                                .transition(self.currentTransition)
                        }
                    }
                }
            }
            
            galleryControls
            
            Spacer()
            
            HStack {
                specialTransitionButton
                    .frame(width: 44, height: 44)

                Spacer()
            }
        }
        .padding()
    }
}


// MARK: - Computeds
extension CustomShapeTransitionsExample {
    var currentImage: Image { images[currentImageIndex] }
    var currentTransition: AnyTransition { currentTransitionType.transition }
}


// MARK: - View Variables
extension CustomShapeTransitionsExample {
    
    private var galleryControls: some View {
        HStack(spacing: 88) {
            Button(action: {
                withAnimation(
                    Animation.easeInOut(duration: 1.1)
                ) {
                    self.currentImageIndex = abs(4 + (self.currentImageIndex - 1)) % self.images.count
                }
            }) {
                Image(systemName: "arrow.left")
                    .padding()
                    .background(Color.accentColor)
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
            
            Button(action: {
                withAnimation(
                    Animation.easeInOut(duration: 1.1)
                ) {
                    self.currentImageIndex = (self.currentImageIndex + 1) % self.images.count
                }
            }) {
                Image(systemName: "arrow.right")
                    .padding()
                    .background(Color.accentColor)
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
        }
    }
    
    
    private var specialTransitionButton: some View {
        Button(action: {
            withAnimation(
                Animation.easeOut(duration: 1.1)
            ) {
                self.isShowingDetailsView.toggle()
            }
        }) {
            Circle()
                .fill(Color.pink)
        }
    }

}



// MARK: - Preview
struct CustomShapeTransitionsExample_Previews: PreviewProvider {

    static var previews: some View {
        CustomShapeTransitionsExample()
    }
}



private enum TransitionType: Int, CaseIterable, Identifiable {
    var id: Int { self.rawValue }
    
    case scale
    case opacity
    case circular
    case rectangular
    case horizontalStripes
    case verticalStripes
    
    
    var displayName: String {
        switch self {
        case .scale:
            return "Scale"
        case .opacity:
            return "Opacity"
        case .circular:
            return "Circular"
        case .rectangular:
            return "Rectangular"
        case .horizontalStripes:
            return "Stripes (H)"
        case .verticalStripes:
            return "Stripes (V)"
        }
    }
    
    var transition: AnyTransition {
        switch self {
        case .scale:
            return .scale
        case .opacity:
            return .opacity
        case .circular:
            return .circular
        case .rectangular:
            return .rectangular
        case .horizontalStripes:
            return .stripes(count: 50, isHorizontal: true)
        case .verticalStripes:
            return .stripes(count: 50, isHorizontal: false)
        }
    }
}
