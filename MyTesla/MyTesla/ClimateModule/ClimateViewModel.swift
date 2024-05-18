//
//  ClimateViewModel.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 16.05.2024.
//

import SwiftUI

/// Вью модель для экрана настроек климата
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
        let stepCount = floorf(Float(value.location.x / sliderPxPerStep()))
        makeMinimumValueText(sliderOffset: CGFloat(stepCount) * sliderPxPerStep())
        return CGFloat(stepCount) * sliderPxPerStep()
    }
    
    private let sliderStep: CGFloat = 1
    private let sliderMaxValue: CGFloat = 15
    private let sliderWidth: CGFloat = 200
    
    private func sliderPxPerStep() -> CGFloat {
        sliderStep * (sliderWidth / sliderMaxValue)
    }
}
