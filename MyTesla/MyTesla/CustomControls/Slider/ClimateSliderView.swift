//
//  ClimateSliderView.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 15.05.2024.
//

import SwiftUI

struct ClimateSliderView: View {

    private enum Constants {
        static let dotOffsetNumber: CGFloat = 95
        static let sliderLightOffsetNumber: CGFloat = -55
    }

    // MARK: - Public property

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .fill(LinearGradient(
                    colors: [.black.opacity(0.5), .lightShadow],
                    startPoint: .top,
                    endPoint: .init(x: 0.5, y: 0.7)
                ))
                .frame(width: 200, height: 8)
            RoundedRectangle(cornerRadius: 2)
                .fill(climateViewModel.selectedColor)
                .frame(width: acSliderOffset + Constants.dotOffsetNumber, height: 8)
                .offset(x: Constants.sliderLightOffsetNumber + (acSliderOffset / 2))
            Image(.knob)
                .offset(x: acSliderOffset, y: 5)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if
                                value.location.x <= totalWidth,
                                value.location.x > -85
                            {
                                acSliderOffset = climateViewModel.sliderMove(value: value)
                            }
                        }
                )
        }
    }

    @EnvironmentObject private var climateViewModel: ClimateViewModel
    @State private var acSliderOffset: CGFloat = -85.0
    @State private var totalWidth: CGFloat = 115
}
