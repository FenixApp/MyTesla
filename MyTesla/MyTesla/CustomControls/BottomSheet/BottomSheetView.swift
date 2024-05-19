//
//  BottomSheetView.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 16.05.2024.
//

import SwiftUI

/// Кастомный bottomsheet
struct BottomSheetView: View {
    
    private enum Constants {
        static let celsusString = "º"
        static let acOnText = "A/C is ON"
        static let descriptionText = "Tap to turn off or swipe up for a fast setup"
        static let powerImage = "power"
        static let noText = ""
        static let onText = "On"
        static let ventText = "Vent"
    }
    
    var body: some View {
        VStack {
            Capsule()
                .fill(.black)
                .frame(width: 80, height: 4)
                .padding(.top)
            HStack(spacing: 60) {
                leadingTitleTextView
                onButtonView
            }
            .padding(.bottom, 20)
            settingsButtonsView
            bottomTextView
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.7)
        .background(
            .ultraThinMaterial, in: RoundedRectangle(cornerRadius: 40)
        )
        .ignoresSafeArea(.all, edges: .bottom)
        .offset(y: UIScreen.main.bounds.height / 2 + 120)
        .offset(y: bottomSheetViewModel.currentMenuOffsetY)
        .gesture(dragGesture)
    }
    
    @EnvironmentObject private var climateViewModel: ClimateViewModel
    @StateObject private var bottomSheetViewModel = BottomSheetViewModel()
    @GestureState private var gestureOffset = CGSize.zero
    
    private var leadingTitleTextView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(Constants.acOnText)
                .bold()
                .font(.system(size: 20))
                .foregroundStyle(.white)
            Text(Constants.descriptionText)
                .foregroundStyle(.gray)
                .lineLimit(2)
                .frame(width: 200, alignment: .leading)
        }
        .padding(.leading)
    }
    
    private var onButtonView: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(colors: [.topGradient, .blue.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(height: 70)
                .neumorphismUnSelectedStyle()
            Button {
                withAnimation {
                    climateViewModel.isOnClimate.toggle()
                }
            } label: {
                Image(systemName: Constants.powerImage)
                    .font(.title3)
                    .foregroundStyle(.white)
                    .frame(width: 63, height: 63)
                    .background(
                        Circle()
                            .fill(LinearGradient(
                                colors: [.blue, .topGradient],
                                startPoint: .init(x: 0, y: 0.5),
                                endPoint: .init(x: 1, y: 1)
                            ))
                    )
            }
        }
    }
    
    private var settingsButtonsView: some View {
        HStack(spacing: 30) {
            ColorPicker(Constants.noText, selection: $climateViewModel.selectedColor)
            Spacer()
            Button {
                withAnimation {
                    climateViewModel.decreaseValue()
                    climateViewModel.getCircleGradus()
                }
            } label: {
                Image(.backChevron)
            }
            Text("\(climateViewModel.currentCelsus)\(Constants.celsusString)")
                .font(.system(size: 30, weight: .medium))
                .frame(width: 50)
            Button {
                withAnimation {
                    climateViewModel.increaseValue()
                    climateViewModel.getCircleGradus()
                }
            } label: {
                Image(.nextChevron)
            }
            Spacer()
            Image(.carDoor)
        }
        .padding(.horizontal, 40)
        .padding(.bottom, 20)
    }
    
    private var bottomTextView: some View {
        HStack {
            Text(Constants.onText)
            Spacer()
            Text(Constants.ventText)
        }
        .padding(.horizontal, 40)
    }
    
    private var dragGesture: some Gesture {
        DragGesture()
            .updating($gestureOffset) { value, state, _ in
                state = value.translation
                onChangeMenuOffset()
            }
            .onEnded { _ in
                withAnimation {
                    bottomSheetViewModel.getYOffset()
                }
            }
    }
    
    private func onChangeMenuOffset() {
        DispatchQueue.main.async {
            bottomSheetViewModel.currentMenuOffsetY = gestureOffset.height + bottomSheetViewModel.lastMenuOffsetY
        }
    }
}

#Preview {
    ClimateView()
        .environment(\.colorScheme, .dark)
}
