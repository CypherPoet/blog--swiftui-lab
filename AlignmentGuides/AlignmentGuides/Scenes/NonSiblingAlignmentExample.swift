//
//  NonSiblingAlignmentExample.swift
//  AlignmentGuides
//
//  Created by CypherPoet on 12/17/19.
// ✌️
//

import SwiftUI


struct NonSiblingAlignmentExample: View {
    @State private var selectedIndex = 0
    
    
    let labels = [
        "001",
        "002",
        "003",
        "004",
        "005",
        "006",
    ]
}


// MARK: - Body
extension NonSiblingAlignmentExample {
    
    var body: some View {
        
        HStack(alignment: .verticalListItemAlignment) {
            
            Image(systemName: "arrow.right.circle.fill")
                .resizable()
                .foregroundColor(.purple)
                .frame(width: 42, height: 42)
                .alignmentGuide(.verticalListItemAlignment) { dimensions in
                    dimensions[VerticalAlignment.center]
                }
            
            
            VStack(spacing: 12) {
                ForEach(labels.indices, id: \.self) { index in
                    
                    Group {
                        if index == self.selectedIndex {
                            // 📝 If this is the item that's being rendered at the selected index,
                            // it will establish a vertical alignment for our `verticalListItemAlignment` guide.
                            LabelStrip(title: self.labels[index], height: 60)
                                .transition(AnyTransition.identity)
                                .alignmentGuide(.verticalListItemAlignment) { dimensions in
                                    dimensions[VerticalAlignment.center]
                                }
                        } else {
                            LabelStrip(title: self.labels[index], height: 60)
                                .transition(AnyTransition.identity)
                                .onTapGesture {
                                    withAnimation {
                                        self.selectedIndex = index
                                    }
                                }
                        }
                    }
                }
            }
            
        }
    }
}


// MARK: - Computeds
extension NonSiblingAlignmentExample {
    
    
}


// MARK: - View Variables
extension NonSiblingAlignmentExample {
    
    
}



// MARK: - Preview
struct NonSiblingAlignmentExample_Previews: PreviewProvider {
    
    static var previews: some View {
        NonSiblingAlignmentExample()
    }
}
