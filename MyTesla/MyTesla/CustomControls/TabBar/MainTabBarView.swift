//
//  MainTabBarView.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 18.05.2024.
//

import SwiftUI

struct MainTabBarView: View {
    
    var body: some View {
        TeslaTabBarView(selection: $selection) {
            MainView()
                .myTabItem {
                    TabItem(iconName: "carIcon")
                }
                .opacity(selection == 0 ? 1 : 0)
            Text("")
                .myTabItem {
                    TabItem(iconName: "chargeIcon")
                }
                .opacity(selection == 1 ? 1 : 0)
            Text("")
                .myTabItem {
                    TabItem(iconName: "geoIcon")
                }
                .opacity(selection == 2 ? 1 : 0)
            Text("")
                .myTabItem {
                    TabItem(iconName: "personIcon")
                }
                .opacity(selection == 3 ? 1 : 0)
        }
    }
    
    @State private var selection = 0
}

#Preview {
    MainTabBarView()
        .environment(\.colorScheme, .dark)
}
