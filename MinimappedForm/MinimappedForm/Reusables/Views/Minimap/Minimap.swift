//
//  Minimap.swift
//  MinimappedForm
//
//  Created by CypherPoet on 10/15/19.
// ✌️
//

import SwiftUI


struct Minimap: View {
    let geometry: GeometryProxy
    let preferences: MinimappedFormView.PreferenceKey.Value
    
    
    var body: some View {
  
        ZStack(alignment: .topLeading) {
            
            // Preferences are traversed in reverse order, otherwise the branch views
            // would be covered by their ancestors
            ForEach(preferences.reversed()) { preferenceData in
                if preferenceData.viewKind.isInMinimap {
                    FormFieldDepiction(
                        fillColor: preferenceData.viewKind.minimapColor,
                        fieldWidth: self.geometry[preferenceData.bounds].size.width / self.scalingFactor,
                        fieldHeight: self.geometry[preferenceData.bounds].size.height / self.scalingFactor,
                        offsetX: (
                            (self.geometry[preferenceData.bounds].minX - self.formContainerPosition.x) / self.scalingFactor
                        ) + self.minimapPosition.x,
                        offsetY: (
                            (self.geometry[preferenceData.bounds].minY - self.formContainerPosition.y) / self.scalingFactor
                        ) + self.minimapPosition.y
                    )
                }
            }
        }
        .padding(5)
    }
}


extension Minimap {
    
    private var formContainerAnchor: Anchor<CGRect> {
        guard let formContainerPrefs = preferences.first(where: { $0.viewKind == .formContainer }) else {
            preconditionFailure()
        }
        
        return formContainerPrefs.bounds
    }
    
    
    private var minimapAreaAnchor: Anchor<CGRect> {
        guard let minimapAreaPrefs = preferences.first(where: { $0.viewKind == .miniMapArea }) else {
            preconditionFailure()
        }
        
        return minimapAreaPrefs.bounds
    }
    
    
    // Calculate a multiplier factor to scale the views from the form, into the minimap.
    private var scalingFactor: CGFloat {
        geometry[formContainerAnchor].size.width / (geometry[minimapAreaAnchor].size.width - 10.0)
    }

    
    private var formContainerPosition: CGPoint {
        CGPoint(
            x: geometry[formContainerAnchor].minX,
            y: geometry[formContainerAnchor].minY
        )
    }
    
    
    private var minimapPosition: CGPoint {
        CGPoint(
            x: geometry[minimapAreaAnchor].minX,
            y: geometry[minimapAreaAnchor].minY
        )
    }
    
}



extension Minimap {
    
    struct FieldContentBar: View {
        let fillColor: Color

        var body: some View {
            Rectangle()
                .fill(fillColor)
                .frame(height: 12)
        }
    }
    
}


struct Minimap_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Minimap.FieldContentBar(fillColor: .purple)
        }
    }
}
