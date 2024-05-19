//
//  ChargeView.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 18.05.2024.
//

import SwiftUI

/// Экран с зарядкой
struct ChargeView: View {
    
    private enum Constants {
        static let titleText = "CHARGING"
        static let text65 = "65"
        static let percent = "%"
        static let nearbyText = "Nearby Superchargers"
        static let doYouWantText = "Do you want to know how to make this?"
        static let url = "https://sites.google.com/view/roadmap-ios/главная-страница"
        static let goToRmText = "Go to RM"
        static let cancelText = "Cancel"
    }
    
    var body: some View {
        backgroundStackView(isLock: false) {
            ZStack {
                VStack {
                    headView
                    imagesView
                    boxView
                    Spacer()
                }
                if climateViewModel.isAlertShow {
                    alertView
                }
            }
            
        }
    }
    
    @Environment(\.presentationMode) private var presentation
    @StateObject private var climateViewModel = ClimateViewModel()
    
    private var headView: some View {
        HStack(alignment: .center, spacing: 20) {
            Button {
                presentation.wrappedValue.dismiss()
            } label: {
                Image(.backButton)
            }
            Text(Constants.titleText)
                .bold()
                .foregroundStyle(.white)
                .font(.system(size: 20))
                .padding(.bottom, 10)
                .frame(width: 110)
            Button {
                withAnimation {
                    climateViewModel.isAlertShow.toggle()
                }
            } label: {
                Image(.gear)
            }
        }
        .padding(.horizontal)
    }
    
    private var imagesView: some View {
        VStack(spacing: -80) {
            Image(.carCharg)
            ZStack(alignment: .top) {
                ZStack(alignment: .centerFirstTextBaseline) {
                    Text(Constants.text65)
                        .bold()
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding(.top, 40)
                    Text(Constants.percent)
                        .bold()
                        .font(.title3)
                        .foregroundStyle(.gray)
                        .padding(.leading, 55)
                }
                Image(.battery)
            }
        }
    }
    
    private var boxView: some View {
        HStack {
            Text(Constants.nearbyText)
                .bold()
                .font(.title3)
            Image(.upButton)
        }
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
    
    private var alertView: some View {
        VStack {
            Text(Constants.doYouWantText)
                .fontWeight(.bold)
                .font(.title3)
                .foregroundStyle(.white)
            if let url = URL(string: Constants.url) {
                Link(Constants.goToRmText, destination: url)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.blue)
                    .padding(.vertical)
                Button(Constants.cancelText) {
                    withAnimation {
                        climateViewModel.isAlertShow.toggle()
                    }
                }
                .foregroundColor(.red)
                .font(.system(size: 20, weight: .regular, design: .default))
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.lightShadow)
        )
        .frame(width: 250)
        .padding(.top, 20)
        .shadow(radius: 15)
        .transition(
            .move(edge: .top)
        )
    }
}

#Preview {
    ChargeView()
        .environment(\.colorScheme, .dark)
}
