//
//  DevelopView.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 18.05.2024.
//

import SwiftUI

/// Пустой экран "В процессе разработки"
struct DevelopView: View {
    
    private enum Constants {
        static let text = "Functionality in development"
    }
    
    var body: some View {
        backgroundStackView(isLock: false) {
            ZStack {
                Text(Constants.text)
                    .bold()
                    .foregroundStyle(.white)
                    .font(.title)
            }
        }
    }
}

#Preview {
    DevelopView()
        .environment(\.colorScheme, .dark)
}
