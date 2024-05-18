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
    
    func backgroundStackView<Content: View>(isLock: Bool = true, content: () -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(isLock ? LinearGradient(colors: [.lightShadow, .black], startPoint: .top, endPoint: .init(x: 0.5, y: 0.4)) : LinearGradient(colors: [.lightBackground], startPoint: .top, endPoint: .bottom))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            content()
        }
    }
    
    func myTabItem(_ label: () -> TabItem) -> some View {
        modifier(TabItemModifier(tabBarItem: label()))
    }
}
