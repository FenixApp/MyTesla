//
//  StartView.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 14.05.2024.
//

import SwiftUI

struct StartView: View {
    
    @State var isCarClose = true
    
    var body: some View {
        backgroundStackView {
            VStack {
                
            }
        }
    }
    
    private var settingsButtonView: some View {
        Button {
            
        } label: {
            
        }
    }
}

#Preview {
    StartView()
        .environment(\.colorScheme, .dark)
}
