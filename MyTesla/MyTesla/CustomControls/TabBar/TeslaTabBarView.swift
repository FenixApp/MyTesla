//
//  TeslaTabBarView.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 18.05.2024.
//

import SwiftUI

/// Кастомный таббар
struct TeslaTabBarView<Content: View>: View {
    
    @Binding var selection: Int
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
            ZStack {
                PlusButton()
                    .offset(y: -55)
                TabBarShape()
                    .fill(.black)
                    .neumorphismUnSelectedStyle()
                HStack {
                    tabsView
                }
            }
            .frame(width: UIScreen.main.bounds.width - 10, height: 80)
            .offset(y: -10)
            .ignoresSafeArea(.all)
        }
        .onPreferenceChange(TabItemPreferenceKey.self) { value in
            tabs = value
        }
    }
    
    @Namespace private var tabBarItem
    @State private var tabs: [TabItem] = []
    private var content: Content
    
    private var tabsView: some View {
        HStack {
            ForEach(Array(tabs.enumerated()), id: \.offset) { index, element in
                Spacer()
                ZStack {
                    Circle()
                        .fill(.clear)
                        .background(
                            ZStack {
                                if selection == index {
                                    Circle()
                                        .fill(.topGradient.opacity(0.8))
                                        .matchedGeometryEffect(id: "tabBarItem", in: tabBarItem)
                                        .frame(width: 70, height: 50)
                                }
                            }
                        )
                        .blur(radius: 20)
                    Image(element.iconName)
                        .renderingMode(.template)
                        .foregroundStyle(selection == index ? .topGradient : .white)
                        .onTapGesture {
                            withAnimation {
                                selection = index
                            }
                        }
                }
                Spacer()
            }
        }
    }
    
    init(selection: Binding<Int>, @ViewBuilder content: () -> Content) {
        _selection = selection
        self.content = content()
    }
}

#Preview {
    MainTabBarView()
        .environment(\.colorScheme, .dark)
}
