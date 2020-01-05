//
//  TripleToggle+TripleToggleStyle.swift
//  CustomStyling
//
//  Created by CypherPoet on 12/28/19.
// ✌️
//

import SwiftUI



/// 📝:v https://swiftui-lab.com/custom-styling/
public protocol TripleToggleStyle {
    associatedtype Body: View
    
    func makeBody(configuration: Self.Configuration) -> Self.Body
    
    typealias Configuration = TripleToggleStyleConfiguration
}


extension TripleToggleStyle {
    func makeBodyTypeErased(configuration: Self.Configuration) -> AnyView {
        AnyView(self.makeBody(configuration: configuration))
    }
}


// MARK: - TripleToggleStyleConfiguration
public struct TripleToggleStyleConfiguration {
    @Binding var stage: TripleToggleStage
    
    var label: Text
}


// MARK: - Type-Erased "AnyTripleToggleStyle"
public struct AnyTripleToggleStyle: TripleToggleStyle {
    private let _makeBody: (TripleToggleStyle.Configuration) -> AnyView
    
    
    init<Style: TripleToggleStyle>(_ style: Style) {
        self._makeBody = style.makeBodyTypeErased
    }
    
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        self._makeBody(configuration)
    }
}


// MARK: - EnvironmentValues
extension EnvironmentValues {
    var tripleToggleStyle: AnyTripleToggleStyle {
        get {
            self[TripleToggleKey.self]
        }
        set {
            self[TripleToggleKey.self] = newValue
        }
    }
}


public struct TripleToggleKey: EnvironmentKey {
    public static var defaultValue = AnyTripleToggleStyle(DefaultTripleToggleStyle())
}
