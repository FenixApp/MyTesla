//
//  TeslaLogoView.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 15.05.2024.
//

import SwiftUI

/// Экран с заставкой приложения
struct TeslaLogoView: View {
    
    @State var isStartViewShow = false
    @State var isTeslaLogoShow = false
    
    var body: some View {
        NavigationView {
            backgroundStackView(isLock: false) {
                VStack {
                    TeslaLogoShape()
                        .fill(isTeslaLogoShow ? .white : .clear)
                        .shadow(color: .black, radius: 20)
                        .offset(x: 0, y: -100)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation(.linear(duration: 2)) {
                                    isTeslaLogoShow.toggle()
                                }
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                withAnimation {
                                    isStartViewShow.toggle()
                                }
                            }
                        }
                    NavigationLink(isActive: $isStartViewShow) {
                        StartView()
                    } label: {
                        EmptyView()
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    TeslaLogoView()
        .environment(\.colorScheme, .dark)
}
