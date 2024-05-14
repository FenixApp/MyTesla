//
//  NeumorphismUnSelectedCircle.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 14.05.2024.
//

import SwiftUI

struct NeumorphismUnSelectedCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .background(Circle().fill(.lightBackground))
            .neumorphismUnSelectedStyle()
    }
}
