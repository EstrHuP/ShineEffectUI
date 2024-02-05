//
//  ShineConstants.swift
//  ShineEffectUI
//
//  Created by EstrHuP on 5/2/24.
//

import SwiftUI

struct ModifierShineConstants {
    static let duration: CGFloat = 0.5
    static let modulationDuration: CGFloat = 0.3
    static let keyframeDuration: CGFloat = 0.1
    static let rotationDegrees: Double = 45
    static let gradientColors: [Color] =
    [
        .clear,
        .clear,
        .white.opacity(0.1),
        .white.opacity(0.5),
        .white.opacity(1),
        .white.opacity(0.5),
        .white.opacity(0.1),
        .clear,
        .clear
    ]
    static let scaleEffectY: CGFloat = 8
    static let keyframeInitialValue: Double = 0.0
}

struct ViewShineConstants {
    static let imageSize: CGFloat = 200
    static let duration: CGFloat = 0.8
    static let cornerRadius: CGFloat = 10
}
