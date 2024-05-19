//
//  StartView.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 14.05.2024.
//

import SwiftUI

/// Стартовый экран приложения
struct StartView: View {
    
    private enum Constants {
        static let hiText = "Hi"
        static let welcomeText = "Welcome back"
        static let unlockText = "Unlock"
        static let lockText = "Lock"
    }
    
    @State var isCarClose = true
    @State var isSettingsScreenShow = false
    @State var isCarShadowClose = true
    
    var body: some View {
        NavigationView {
            backgroundStackView(isLock: isCarClose) {
                VStack(spacing: 50) {
                    settingsButtonView
                        .padding(.leading, 280)
                    VStack {
                        hiTextView
                        welcomeTextView
                    }
                    carImageView
                    lockCarControlView
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private var settingsButtonView: some View {
        NavigationLink(isActive: $isSettingsScreenShow) {
            MainTabBarView()
        } label: {
            Button {
                isSettingsScreenShow = true
            } label: {
                Image(.gear)
            }
        }
    }
    
    private var hiTextView: some View {
        Text(Constants.hiText)
            .foregroundStyle(.gray)
            .font(.system(size: 20))
            .padding(.bottom, 10)
            .opacity(isCarClose ? 0 : 1)
    }
    
    private var welcomeTextView: some View {
        Text(Constants.welcomeText)
            .bold()
            .foregroundStyle(.white)
            .font(.system(size: 35))
            .opacity(isCarClose ? 0 : 1)
    }
    
    private var carImageView: some View {
        Image(isCarClose ? .night : .day)
            .resizable()
            .frame(height: 250)
            .padding(.horizontal)
            .shadow(color: isCarShadowClose ? .black : .white.opacity(0.6), radius: 15, x: 0, y: 10)
            .shadow(color: isCarShadowClose ? .black : .topGradient.opacity(0.1), radius: 55, x: 0, y: -50)
    }
    
    private var lockCarControlView: some View {
        Button {
            withAnimation(.linear(duration: 0.5)) {
                isCarClose.toggle()
                isCarShadowClose.toggle()
            }
        } label: {
            HStack(alignment: .center) {
                Text(isCarClose ? Constants.unlockText : Constants.lockText)
                    .foregroundStyle(.white)
                    .padding(.leading)
                Spacer()
                Image(isCarClose ? .lock : .unlock)
                    .frame(width: 62, height: 62)
                    .padding(.top)
            }
            .padding()
            .frame(width: 180, height: 90)
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(.black, lineWidth: 10)
                    .blur(radius: 10)
                    .mask(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(
                                LinearGradient(colors: [.darkShadow, .clear], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                    )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(.white.opacity(0.11), lineWidth: 8)
                    .blur(radius: 4)
                    .offset(x: -5, y: -2)
                    .mask(
                        RoundedRectangle(cornerRadius: 40)
                            .fill(
                                LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                            )
                    )
            )
        }
    }
}

#Preview {
    StartView()
        .environment(\.colorScheme, .dark)
}
