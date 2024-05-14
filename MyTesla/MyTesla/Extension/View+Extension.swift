//
//  View+Extension.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 14.05.2024.
//

import SwiftUI

extension View {
    func neumorphismUnSelectedStyle() -> some View {
        modifier(NeumorphismUnSelected())
    }
    
    func neumorphismSelectedStyle() -> some View {
        modifier(NeumorphismSelected())
    }
    
    func neumorphismSelectedCircleStyle() -> some View {
        modifier(NeumorphismUnSelectedCircle())
    }
    
    func backgroundStackView<Content: View>(content: () -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(.lightBackground)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            content()
        }
    }
}
