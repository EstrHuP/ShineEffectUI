//
//  ContentView.swift
//  ShineEffectUI
//
//  Created by EstrHuP on 5/2/24.
//

import SwiftUI

struct ContentView: View {
    
    // Properties
    @State private var isShine: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(.shine)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .shine(isShine, duration: 0.8, clipShape: .rect(cornerRadius: 10))
                    .onTapGesture {
                        isShine.toggle()
                    }
            }
            .navigationTitle("Shine Effect")
        }
    }
}

extension View {
    // Modifier
    @ViewBuilder
    func shine(_ toogle: Bool, duration: CGFloat = 0.5, clipShape: some Shape = .rect) -> some View {
        self
            .overlay {
                GeometryReader {
                    let size = $0.size
                    // Remove negative duration
                    let moddedDuration = max(0.3, duration)
                    
                    Rectangle()
                        .fill(
                            .linearGradient(
                                colors: [
                                    .clear,
                                    .clear,
                                    .white.opacity(0.1),
                                    .white.opacity(0.5),
                                    .white.opacity(1),
                                    .white.opacity(0.5),
                                    .white.opacity(0.1),
                                    .clear,
                                    .clear
                                ],
                                startPoint: .leading,
                                endPoint: .trailing)
                        )
                        .scaleEffect(y: 8)
                        .keyframeAnimator(initialValue: 0.0,
                                          trigger: toogle,
                                          content: { content, progress in
                            content
                                .offset(x: -size.width + (progress * (size.width * 2)))
                        },
                                          keyframes: { _ in
                            CubicKeyframe(.zero, duration: 0.1)
                            CubicKeyframe(1, duration: moddedDuration)
                        })
                        .rotationEffect(.init(degrees: 45))
                }
            }
            .clipShape(clipShape)
    }
}

#Preview {
    ContentView()
}
