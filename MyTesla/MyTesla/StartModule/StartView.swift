//
//  StartView.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 14.05.2024.
//

import SwiftUI

struct StartView: View {
    
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
    }
    
    private var settingsButtonView: some View {
        NavigationLink(isActive: $isSettingsScreenShow) {
            MainView()
        } label: {
            Button {
                isSettingsScreenShow = true
            } label: {
                Image(.gear)
            }
        }
        
    }
    
    private var hiTextView: some View {
        Text("Hi")
            .foregroundStyle(.gray)
            .font(.system(size: 20))
            .padding(.bottom, 10)
            .opacity(isCarClose ? 0 : 1)
    }
    
    private var welcomeTextView: some View {
        Text("Welcome back")
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
            withAnimation {
                isCarClose.toggle()
            }
            isCarShadowClose.toggle()
        } label: {
            HStack(alignment: .center) {
                Text(isCarClose ? "Unlock" : "Lock")
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
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color("lightBackground"))
            )
            .neumorphismSelectedStyle()
        }
    }
}

#Preview {
    StartView()
        .environment(\.colorScheme, .dark)
}
