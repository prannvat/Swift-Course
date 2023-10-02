//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Prannvat Singh on 30/09/2023.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical, 5)
            .padding(.horizontal, 15)
            .background(
                // Conditional Statement with Nil Coalescing
                // Conditon ? A : B
                configuration.isPressed ?
                // A: When user presses button
                LinearGradient(colors: [
                    .customGrayMedium,
                    .customGrayLight],
                               startPoint: .top,
                               endPoint: .bottom)
                :
                // B: When bitton is not pressed
                LinearGradient(colors: [
                    .customGrayLight,
                    .customGrayMedium],
                               startPoint: .top,
                               endPoint: .bottom))
            .cornerRadius(40)
        
    }
}
