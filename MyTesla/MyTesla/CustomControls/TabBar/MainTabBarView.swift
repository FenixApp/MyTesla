//
//  MainTabBarView.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 18.05.2024.
//

import SwiftUI

/// Экран таббара
struct MainTabBarView: View {
    
    private enum Constants {
        static let carIcon = "carIcon"
        static let chargeIcon = "chargeIcon"
        static let geoIcon = "geoIcon"
        static let personIcon = "personIcon"
    }
    
    var body: some View {
        TeslaTabBarView(selection: $selection) {
            MainView()
                .myTabItem {
                    TabItem(iconName: Constants.carIcon)
                }
                .opacity(selection == 0 ? 1 : 0)
            ChargeView()
                .myTabItem {
                    TabItem(iconName: Constants.chargeIcon)
                }
                .opacity(selection == 1 ? 1 : 0)
            DevelopView()
                .myTabItem {
                    TabItem(iconName: Constants.geoIcon)
                }
                .opacity(selection == 2 ? 1 : 0)
            DevelopView()
                .myTabItem {
                    TabItem(iconName: Constants.personIcon)
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
