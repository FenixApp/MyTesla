//
//  BottomSheetViewModel.swift
//  MyTesla
//
//  Created by Dmitriy Starozhilov on 17.05.2024.
//

import SwiftUI

/// Вью модель для bottomsheet
final class BottomSheetViewModel: ObservableObject {
    
    @Published var currentMenuOffsetY: CGFloat = 0.0
    @Published var lastMenuOffsetY: CGFloat = 0.0
    
    func getYOffset() {
        let maxHeight = UIScreen.main.bounds.height / 6
        if -currentMenuOffsetY > maxHeight / 2 {
            currentMenuOffsetY = -maxHeight
        } else {
            currentMenuOffsetY = 0
        }
        lastMenuOffsetY = currentMenuOffsetY
    }
}
