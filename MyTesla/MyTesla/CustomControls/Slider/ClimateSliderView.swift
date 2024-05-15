//
//  ClimateSliderView.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 15.05.2024.
//

import SwiftUI

struct ClimateSliderView: View {
    @State var isSliderOn = false
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
                .fill(.topGradient)
                .frame(width: -85.0 + 95, height: 8)
                .offset(x: -55 + (-85.0 / 2))
            Image(.knob)
                .offset(x: -85.0, y: 5)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if
                                value.location.x <= 115,
                                value.location.x > -85
                            {
//                                -85.0 = sliderMove(value: value)
                            }
                        }
                )
        }
    }
    
//    func sliderMove(value: DragGesture.Value) -> CGFloat {
//        isSliderOn = true
//        let stpCnt = floorf(Float(value.location.x / sliderPxPerStep()))
//        makeMinimumValueText(sliderOffset: CGFloat(stpCnt) * sliderPxPerStep())
//        return CGFloat(stpCnt) * sliderPxPerStep()
//    }
    
//    private func sliderPxPerStep() -> CGFloat {
//        sliderStep * (sliderWidth / sliderMaxValue)
//    }
}

#Preview {
    ClimateSliderView()
        .environment(\.colorScheme, .dark)
}
