//
//  ClimateView.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 14.05.2024.
//

import SwiftUI

struct ClimateView: View {
    var body: some View {
        backgroundStackView(isLock: false) {
            ZStack {
                VStack {
                    headView
                    circleView
                        .padding(.top, 30)
                    disclosureGroupView
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @Environment(\.presentationMode) private var presentation
    @State var revealDetails = true
    
    private var headView: some View {
        HStack(alignment: .center, spacing: 25) {
            Button {
                presentation.wrappedValue.dismiss()
            } label: {
                Image(.backButton)
            }
            Text("CLIMATE")
                .bold()
                .foregroundStyle(.white)
                .font(.system(size: 20))
                .padding(.bottom, 10)
            Button {
                
            } label: {
                Image(.gear)
            }
        }
        .padding(.horizontal)
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
//            Circle()
//                .trim(
//                from: 0.0,
//                to: <#T##CGFloat#>)
        }
    }
    
    private var disclosureGroupView: some View {
        DisclosureGroup("", isExpanded: $revealDetails) {
            VStack(spacing: -10) {
                acView
                fanView
                heatView
                autoView
            }
        }
        .padding()
    }

    private var acView: some View {
        HStack(spacing: 20) {
            Text("Ac")
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
            Text("Fan")
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
            ClimateSliderView()
        }
        .padding()
    }
    
    private var heatView: some View {
        HStack(spacing: 20) {
            Text("Heat")
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
            ClimateSliderView()
        }
        .padding()
    }
    
    private var autoView: some View {
        HStack(spacing: 20) {
            Text("Auto")
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
            ClimateSliderView()
        }
        .padding()
    }
}

#Preview {
    ClimateView()
        .environment(\.colorScheme, .dark)
}
