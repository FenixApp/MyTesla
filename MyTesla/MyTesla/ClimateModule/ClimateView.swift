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
//                .overlay(
//                    Circle()
//                        .fill(LinearGradient(colors: [.darkShadow, .lightShadow], startPoint: .topLeading, endPoint: .init(x: 0.5, y: 0.5)))
//                        .frame(width: 140, height: 140)
//                        .shadow(color: .lightShadow, radius: 7, x: -7, y: -7)
//                        .shadow(color: .darkShadow, radius: 7, x: 7, y: 7)
//                    )
//            Circle()
//                .trim(
//                from: 0.0,
//                to: <#T##CGFloat#>)
        }
    }
    
    private var disclosureGroupView: some View {
        DisclosureGroup("", isExpanded: $revealDetails) {
            VStack(spacing: 40) {
                acView
                acView
                acView
                acView
            }
        }
        .padding()
    }
    @State private var celsius: Double = 0
    private var acView: some View {
        HStack(spacing: 30) {
            Text("Ac")
                .foregroundStyle(.gray)
                .frame(width: 40)
            Button {
                
            } label: {
                Image(.snow)
                    .frame(width: 20, height: 20)
                    .neumorphismSelectedCircleStyle()
                    .overlay(
                        Circle()
                            .stroke(LinearGradient(colors: [.black.opacity(0.5), .lightShadow], startPoint: .top, endPoint: .init(x: 0.5, y: 0.7)), lineWidth: 2)
                            .opacity(0)
                        )
            }
            Slider(value: $celsius, in: 0...100)
        }
    }
}

#Preview {
    ClimateView()
        .environment(\.colorScheme, .dark)
}
