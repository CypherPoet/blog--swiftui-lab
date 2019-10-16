//
//  UserForm.swift
//  MinimappedForm
//
//  Created by Brian Sipple on 10/14/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI
import PreviewUtils


fileprivate let formRowWidthRange: ClosedRange<Double> = 360.0...540.0


struct UserForm: View {
    
//    @State private var fieldValues = Array(repeating: "", count: 5)
    @State private var secondRowWidth = formRowWidthRange.lowerBound
    @State private var isShowingTwitterField = false
    
    
    @State private var firstName: String = ""
    @State private var middleName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var twitterHandle: String = ""
    
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack(alignment: .center) {
                minimapBackdrop
                
                formContainer
                    .transformAnchorPreference(
                        key: MinimappedFormView.PreferenceKey.self,
                        value: .bounds,
                        transform: { (preferenceData: inout MinimappedFormView.PreferenceKey.Value, anchorBounds: Anchor<CGRect>) in
                            preferenceData.append(MinimappedFormView.PreferenceData(viewKind: .formContainer, bounds: anchorBounds))
                        }
                    )

                Spacer()
            }
            .overlayPreferenceValue(MinimappedFormView.PreferenceKey.self) { preferences in
                GeometryReader { geometry in
                    Minimap(geometry: geometry, preferences: preferences)
                }
            }
            
            
            Spacer()
        }
        .background(
            /*@START_MENU_TOKEN@*/Color(hue: 1.0, saturation: 0.009, brightness: 0.593)/*@END_MENU_TOKEN@*/
                .edgesIgnoringSafeArea(.all)
        )
    }
}


extension UserForm {
    
    var minimapBackdrop: some View {
        Color(.secondarySystemBackground)
            .frame(width: 200.0)
            .anchorPreference(key: MinimappedFormView.PreferenceKey.self, value: .bounds) { anchorBounds in
                [MinimappedFormView.PreferenceData(viewKind: .miniMapArea, bounds: anchorBounds)]
            }
            .padding(.horizontal, 30)
    }
    
    
    var formContainer: some View {
        VStack(alignment: .leading) {
            
            VStack {
                Text("Hello, \(firstName) \(middleName) \(lastName)")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .anchorPreference(key: MinimappedFormView.PreferenceKey.self, value: .bounds) { anchorBounds in
                        [MinimappedFormView.PreferenceData(viewKind: .formTitle, bounds: anchorBounds)]
                    }
                
                Divider()
            }
            
            
            // Switch + Slider
            HStack {
                Toggle(isOn: $isShowingTwitterField) {
                    Text("Show the Twitter Handle Field")
                }
                
                Slider(value: $secondRowWidth, in: formRowWidthRange) {
                    Text("Twitter Handle Field Width")
                }
                .layoutPriority(1)
            }
            .labelsHidden()
            .padding(.bottom, 5)
            
            
            // First row of text fields
            HStack {
                GridFormField(fieldValue: $firstName, label: "First Name")
                GridFormField(fieldValue: $middleName, label: "Middle Name")
                GridFormField(fieldValue: $lastName, label: "Last Name")
            }
            .frame(width: CGFloat(formRowWidthRange.upperBound), alignment: .leading)
            
            
            // Second row of text fields
            HStack {
                GridFormField(fieldValue: $email, label: "Email")
                
                if isShowingTwitterField {
                    GridFormField(fieldValue: $twitterHandle, label: "Twitter")
                } else {
                    Spacer()
                }
            }
            .frame(width: CGFloat(secondRowWidth), alignment: .leading)
        }
    }
}


struct UserForm_Previews: PreviewProvider {
    static var previews: some View {
        UserForm()
            .previewLayout(.iPhone11Landscape)
    }
}
