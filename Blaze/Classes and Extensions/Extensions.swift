//
//  NumberExtension.swift
//  Blaze
//
//  Created by Nathan Choi on 9/4/20.
//

import SwiftUI
import MapKit
import Foundation

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

extension String {
    func becomeInt() -> Int? {
        return Int(self.filter("-0123456789.".contains))
    }
    
    func becomeDouble() -> Double? {
        return Double(self.filter("-0123456789.".contains))
    }
}

extension Int {
    func inCommas() -> String? {
        let largeNumber = self
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: largeNumber))
    }
}

extension Double {
    func inCommas() -> String? {
        let largeNumber = self
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: largeNumber))
    }
}

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}

extension Color {
    static var blaze = Color("blaze")
}

/// Inverting any binding boolean with prefix: `!`
/// https://stackoverflow.com/questions/59474045/swiftui-invert-a-boolean-binding
public prefix func ! (value: Binding<Bool>) -> Binding<Bool> {
    Binding<Bool>(
        get: { !value.wrappedValue },
        set: { value.wrappedValue = !$0 }
    )
}

/// https://fivestars.blog/swiftui/conditional-modifiers.html
/// Conditional modifiers
extension View {
    @ViewBuilder func `if`<TrueContent: View, FalseContent: View>(
        _ condition: Bool,
        if ifTransform: (Self) -> TrueContent,
        else elseTransform: (Self) -> FalseContent
    ) -> some View {
        if condition { ifTransform(self) } else { elseTransform(self) }
    }
}
