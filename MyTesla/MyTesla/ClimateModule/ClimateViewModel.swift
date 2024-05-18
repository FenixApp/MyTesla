//
//  ClimateViewModel.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 16.05.2024.
//

import SwiftUI

final class ClimateViewModel: ObservableObject {
    
    @Published var isOnClimate = false
    @Published var isAlertShow = false
    @Published var isSliderOn = false
    @Published var isRevealDetails = true
    @Published var minCelsus: CGFloat = 15
    @Published var maxCelsus: CGFloat = 30
    @Published var currentCelsus = 15
    @Published var circleProgress: CGFloat = 0.0
    @Published var selectedColor: Color = .topGradient
    
    private let sliderStep: CGFloat = 1
    private let sliderMaxValue: CGFloat = 15
    private let sliderWidth: CGFloat = 200
    
    func getCircleGradus() {
        circleProgress = 1.0 - ((maxCelsus - CGFloat(currentCelsus)) / minCelsus)
    }
    
    func makeMinimumValueText(sliderOffset: CGFloat) {
        currentCelsus = Int((sliderOffset + 100) / sliderPxPerStep()) + Int(minCelsus)
        getCircleGradus()
    }
    
    func increaseValue() {
        guard currentCelsus < Int(maxCelsus) else { return }
        currentCelsus += 1
    }
    
    func decreaseValue() {
        guard currentCelsus > Int(minCelsus) else { return }
        currentCelsus -= 1
    }
    
    func sliderMove(value: DragGesture.Value) -> CGFloat {
        isSliderOn = true
        let stpCnt = floorf(Float(value.location.x / sliderPxPerStep()))
        makeMinimumValueText(sliderOffset: CGFloat(stpCnt) * sliderPxPerStep())
        return CGFloat(stpCnt) * sliderPxPerStep()
    }
    
    private func sliderPxPerStep() -> CGFloat {
        sliderStep * (sliderWidth / sliderMaxValue)
    }
}
