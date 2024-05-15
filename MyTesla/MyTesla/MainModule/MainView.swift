//
//  ContentView.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 14.05.2024.
//

import SwiftUI

struct MainView: View {
    
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
                Text("Tesla")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Text("187 km")
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
                            .frame(width: 20, height: 20)
                            .neumorphismSelectedCircleStyle()
                            .overlay(
                            Circle()
                                .stroke(gradient, lineWidth: 2)
                                .opacity(tagSelected == index ? 1 : 0)
                            )
                    }
                }
                
            }
        }
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
                    Text(isCarClose ? "Lock" : "Unlock")
                        .foregroundStyle(.white)
                } icon: {
                    Image(systemName: isCarClose ? "lock.open.fill" : "lock.fill")
                        .renderingMode(.template)
                        .neumorphismSelectedCircleStyle()
                }
            }
            .frame(width: 120)
            .padding()
            .background(RoundedRectangle(cornerRadius: 50).fill(.lightBackground))
            .neumorphismSelectedStyle()
        }
        .frame(width: 300)
    }
}

#Preview {
    MainView()
        .environment(\.colorScheme, .dark)
}
