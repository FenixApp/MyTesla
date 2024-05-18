//
//  TabItem.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 18.05.2024.
//

import Foundation

/// Кнопка таббара
struct TabItem: Identifiable, Equatable {
    /// Идентификатор
    var id = UUID()
    /// Название картинки
    var iconName: String
}
