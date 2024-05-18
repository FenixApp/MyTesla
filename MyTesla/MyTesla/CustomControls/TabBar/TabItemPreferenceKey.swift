//
//  TabItemPreferenceKey.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 18.05.2024.
//

import SwiftUI

struct TabItemPreferenceKey: PreferenceKey {
    static var defaultValue: [TabItem] = []
    
    static func reduce(value: inout [TabItem], nextValue: () -> [TabItem]) {
        value += nextValue()
    }
}
