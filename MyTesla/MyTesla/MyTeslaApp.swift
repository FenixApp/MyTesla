//
//  MyTeslaApp.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 14.05.2024.
//

import SwiftUI

@main
struct MyTeslaApp: App {
    var body: some Scene {
        WindowGroup {
            TeslaLogoView()
                .environment(\.colorScheme, .dark)
        }
    }
}
