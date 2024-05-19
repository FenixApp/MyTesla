//
//  ClimateView.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 14.05.2024.
//

import SwiftUI

/// Экран экрана с настройками климата
struct ClimateView: View {
    
    private enum Constants {
        static let celsusString = "º C"
        static let titleText = "CLIMATE"
        static let supportText = "Tesla support"
        static let url = "https://www.tesla.com/support"
        static let cancelText = "Cancel"
        static let noText = ""
        static let acText = "Ac"
        static let fanText = "Fan"
        static let heatText = "Heat"
        static let autoText = "Auto"
    }
    
    var body: some View {
        backgroundStackView(isLock: false) {
            ZStack {
                VStack {
                    headView
                    circleView
                    disclosureGroupView
                    Spacer()
                }
                BottomSheetView()
                if climateViewModel.isAlertShow {
                    alertView
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .environmentObject(climateViewModel)
    }
    
    @Environment(\.presentationMode) private var presentation
    @StateObject private var climateViewModel = ClimateViewModel()
    
    private var headView: some View {
        HStack(alignment: .center, spacing: 25) {
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
    
    private var alertView: some View {
        VStack {
            Text(Constants.supportText)
                .fontWeight(.bold)
                .font(.title3)
                .foregroundStyle(.white)
            if let url = URL(string: Constants.url) {
                Link(Constants.supportText, destination: url)
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
        .padding(.top, 50)
        .shadow(radius: 15)
        .transition(
            .move(edge: .trailing)
            .combined(with: .scale(scale: 0.1, anchor: .topTrailing))
        )
    }
    
    private var circleView: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(colors: [.lightShadow, .black.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 200, height: 200)
                .shadow(color: .lightGrayShadow, radius: 20, x: -25, y: -25)
                .shadow(color: .darkShadow, radius: 7, x: 20, y: 20)
                .overlay(
                    Circle()
                        .fill(LinearGradient(colors: [.darkShadow, .lightShadow], startPoint: .topLeading, endPoint: .init(x: 0.5, y: 0.5)))
                        .frame(width: 140, height: 140)
                        .shadow(color: .lightShadow, radius: 7, x: -7, y: -7)
                        .shadow(color: .darkShadow, radius: 7, x: 7, y: 7)
                )
            Circle()
                .trim(
                    from: 0.0,
                    to: climateViewModel.circleProgress
                )
                .stroke(climateViewModel.selectedColor, style: StrokeStyle(
                    lineWidth: 25,
                    lineCap: .round
                ))
                .shadow(color: climateViewModel.selectedColor, radius: 7)
                .frame(height: 210)
                .rotationEffect(.degrees(-110))
            Text(
                "\(climateViewModel.currentCelsus)\(Constants.celsusString)"
            )
            .font(.system(size: 30, weight: .bold, design: .default))
            .opacity(climateViewModel.isOnClimate ? 1 : 0)
        }
        .padding(.top, 10)
    }
    
    private var disclosureGroupView: some View {
        withAnimation {
            DisclosureGroup(Constants.noText, isExpanded: $climateViewModel.isRevealDetails) {
                VStack(spacing: -10) {
                    acView
                    fanView
                    heatView
                    autoView
                }
            }
            .padding()
        }
    }
    
    private var acView: some View {
        HStack(spacing: 20) {
            Text(Constants.acText)
                .bold()
                .foregroundStyle(.gray)
                .frame(width: 41)
                .padding(.bottom)
            ZStack {
                Button {
                } label: {
                    Image(.climateButton)
                }
                Image(.snow)
                    .padding(.bottom, 10)
                    .padding(.trailing, 6)
            }
            .frame(width: 50, height: 50)
            ClimateSliderView()
        }
        .padding()
    }
    
    private var fanView: some View {
        HStack(spacing: 20) {
            Text(Constants.fanText)
                .bold()
                .foregroundStyle(.gray)
                .frame(width: 41)
                .padding(.bottom)
            ZStack {
                Button {
                } label: {
                    Image(.climateButton)
                }
                Image(.wind)
                    .padding(.bottom, 10)
                    .padding(.trailing, 6)
            }
            .frame(width: 50, height: 50)
            fakeSliderView
        }
        .padding()
    }
    
    private var heatView: some View {
        HStack(spacing: 20) {
            Text(Constants.heatText)
                .bold()
                .foregroundStyle(.gray)
                .frame(width: 41)
                .padding(.bottom)
            ZStack {
                Button {
                } label: {
                    Image(.climateButton)
                }
                Image(.drop)
                    .padding(.bottom, 10)
                    .padding(.trailing, 6)
            }
            .frame(width: 50, height: 50)
            fakeSliderView
        }
        .padding()
    }
    
    private var autoView: some View {
        HStack(spacing: 20) {
            Text(Constants.autoText)
                .bold()
                .foregroundStyle(.gray)
                .frame(width: 41)
                .padding(.bottom)
            ZStack {
                Button {
                } label: {
                    Image(.climateButton)
                }
                Image(.timer)
                    .padding(.bottom, 10)
                    .padding(.trailing, 6)
            }
            .frame(width: 50, height: 50)
            fakeSliderView
        }
        .padding()
    }
    
    private var fakeSliderView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .fill(LinearGradient(
                    colors: [.black.opacity(0.5), .lightShadow],
                    startPoint: .top,
                    endPoint: .init(x: 0.5, y: 0.7)
                ))
                .frame(width: 200, height: 8)
            Image(.knob)
                .offset(x: -85, y: 5)
        }
    }
}

#Preview {
    ClimateView()
        .environment(\.colorScheme, .dark)
}
