//
//  View+.swift
//  ShineEffectUI
//
//  Created by EstrHuP on 5/2/24.
//

import SwiftUI

extension View {
    
    /// Applies a shine effect to the view.
    ///
    /// - Parameters:
    ///   - toggle: A boolean value to trigger the shine effect.
    ///   - duration: The duration of the shine animation.
    ///   - clipShape: The shape used for clipping the shine effect.
    /// - Returns: A modified view with the shine effect applied.
    @ViewBuilder
    func shine(_ toggle: Bool,
               duration: CGFloat = ModifierShineConstants.duration,
               clipShape: some Shape = .rect) -> some View {
        self
            .overlay {
                GeometryReader {
                    let size = $0.size // $0 == geometry
                    let modifiedDuration = max(ModifierShineConstants.modulationDuration, duration) // Ensure a minimum duration
                    
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: ModifierShineConstants.gradientColors,
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .scaleEffect(y: ModifierShineConstants.scaleEffectY)
                        .keyframeAnimator(
                            initialValue: ModifierShineConstants.keyframeInitialValue,
                            trigger: toggle,
                            content: { content, progress in
                                content
                                    .offset(x: -size.width + (progress * (size.width * 2)))
                            },
                            keyframes: { _ in
                                // Keyframes for the normal animation
                                CubicKeyframe(0, duration: 0.1)
                                CubicKeyframe(1, duration: modifiedDuration)
                                
                                // Keyframes for the reverse animation
                                CubicKeyframe(0, duration: 0.3)
                                CubicKeyframe(-1, duration: modifiedDuration)
                            }
                        )
                        .rotationEffect(.degrees(ModifierShineConstants.rotationDegrees))
                }
            }
            .clipShape(clipShape)
    }
}
