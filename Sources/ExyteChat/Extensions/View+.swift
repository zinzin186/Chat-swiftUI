//
//  View+.swift
//
//
//  Created by Alisa Mylnikova on 09.03.2023.
//

import SwiftUI

@available(iOS 15.0, *)
extension View {
    func viewSize(_ size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }

    func circleBackground(_ color: Color) -> some View {
        self.background {
            Circle().fill(color)
        }
    }

    @ViewBuilder
    func applyIf<T: View>(_ condition: Bool, apply: (Self) -> T) -> some View {
        if condition {
            apply(self)
        } else {
            self
        }
    }
}
