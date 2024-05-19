//
//  ContentView.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 14.05.2024.
//

import SwiftUI

/// Экран с меню настроек
struct MainView: View {
    
    private enum Constants {
        static let teslaText = "Tesla"
        static let km187 = "187 km"
        static let unlockText = "Unlock"
        static let lockText = "Lock"
        static let lockOpenImage = "lock.open.fill"
        static let lockImage = "lock.fill"
    }
    
    @State var isCarClose = false
    @State var tagSelected = 0
    @State var isClimateShow = false
    
    var body: some View {
        backgroundStackView(isLock: false) {
            VStack {
                headerView
                carView
                controlPanelView
                Spacer()
                    .frame(height: 40)
                if tagSelected == 1 {
                    closeCarControlView
                }
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private var headerView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(Constants.teslaText)
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Text(Constants.km187)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .opacity(0.4)
            }
            Spacer()
        }
        .padding(.all, 25)
    }
    
    private var carView: some View {
        Image(isCarClose ? .closeCar : .car)
            .resizable()
            .frame(height: 220)
            .padding(.horizontal)
            .padding(.bottom, 40)
            .shadow(color: .white.opacity(0.6), radius: 15, x: 10, y: 10)
    }
    
    private var gradient: LinearGradient {
        LinearGradient(colors: [.topGradient, .bottomGradient], startPoint: .bottom, endPoint: .top)
    }
    
    private var controlPanelView: some View {
        HStack(spacing: 30) {
            ForEach(1..<5) { index in
                NavigationLink(isActive: $isClimateShow) {
                    ClimateView()
                } label: {
                    Button {
                        if index == 2 {
                            isClimateShow.toggle()
                        }
                        withAnimation {
                            tagSelected = index
                        }
                    } label: {
                        Image("\(index)")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .overlay(
                                Circle()
                                    .stroke(gradient, lineWidth: 2)
                                    .opacity(tagSelected == index ? 1 : 0)
                            )
                    }
                }
                
            }
        }
        .frame(width: 300, height: 40)
        .padding()
        .background(RoundedRectangle(cornerRadius: 50).fill(.lightBackground))
        .neumorphismUnSelectedStyle()
    }
    
    private var closeCarControlView: some View {
        Button {
            withAnimation {
                isCarClose.toggle()
            }
        } label: {
            HStack(spacing: 10) {
                Label {
                    Text(isCarClose ? Constants.lockText : Constants.unlockText)
                        .foregroundStyle(.white)
                } icon: {
                    Image(systemName: isCarClose ? Constants.lockOpenImage : Constants.lockImage)
                        .renderingMode(.template)
                        .neumorphismSelectedCircleStyle()
                }
            }
            .frame(width: 120)
            .padding()
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
        .frame(width: 300)
    }
}

#Preview {
    MainView()
        .environment(\.colorScheme, .dark)
}
