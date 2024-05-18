//
//  PlusButton.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 18.05.2024.
//

import SwiftUI

/// Кнопка "Plus" над таббаром
struct PlusButton: View {
    
    var body: some View {
        Button {
        } label: {
            Image(.plusIcon)
        }
    }
}

#Preview {
    PlusButton()
}
