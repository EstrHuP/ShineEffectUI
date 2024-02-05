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
                Image(.oliver)
                    .resizable()
                    .scaledToFill()
                    .frame(width: ViewShineConstants.imageSize,
                           height: ViewShineConstants.imageSize)
                    .shine(
                        isShine,
                        duration: ViewShineConstants.duration,
                        clipShape: .rect(cornerRadius: ViewShineConstants.cornerRadius)
                    )
                    .onTapGesture {
                        isShine.toggle()
                    }
            }
            .navigationTitle("ShineEffectUI")
        }
    }
}

#Preview {
    ContentView()
}
