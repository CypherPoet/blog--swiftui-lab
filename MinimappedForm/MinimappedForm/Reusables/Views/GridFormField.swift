//
//  GridFormField.swift
//  MinimappedForm
//
//  Created by CypherPoet on 10/15/19.
// ✌️
//

import SwiftUI


struct GridFormField: View {
    @Binding var fieldValue: String
    let label: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.callout)
                .fontWeight(.bold)
            
            TextField("Field", text: $fieldValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .anchorPreference(
                    key: MinimappedFormView.PreferenceKey.self,
                    value: .bounds
                ) { anchorBounds in
                    [
                        MinimappedFormView.PreferenceData(
                            viewKind: .formField(self.fieldStatus),
                            bounds: anchorBounds
                        )
                    ]
            }
        }
        .padding()
        .frame(width: 200.0)
        .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(white: 0.9))
            )
            // 🔑 Calling `anchorPreference()` on the `Vstack` would prevent the call on the `TextField`.
            // Instead, we use `transformAnchorPreference()` on the `VStack`.
            // This way we add data, instead of replacing it.
            .transformAnchorPreference(
                key: MinimappedFormView.PreferenceKey.self,
                value: .bounds
            ) { (preferenceData: inout MinimappedFormView.PreferenceKey.Value, anchorBounds: Anchor<CGRect>) in
                preferenceData.append(.init(viewKind: .formFieldContainer, bounds: anchorBounds))
            }
    }
}



extension GridFormField {
    private var fieldStatus: FormFieldStatus {
        FormFieldStatus(forCurrentInputLength: fieldValue.count)
    }
}



struct GridFormField_Previews: PreviewProvider {
    static var previews: some View {
        GridFormField(
            fieldValue: .constant("Some Text"),
            label: "Some Label"
        )
    }
}
