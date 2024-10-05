//
//  ContentView.swift
//  MusicDemo
//
//  Created by Steven on 2024/10/5.
//

import LNPopupUI
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var musicPlayerEnv: MusicPlayerEnv

    var body: some View {
        print("the root view is being redrawn")

        return VStack {
            Text("Root View")
                .font(.largeTitle)
                .padding(20)
        }
        .popup(isBarPresented: $musicPlayerEnv.isBarPresented,
               isPopupOpen: $musicPlayerEnv.isPopupOpen) {
            // player view
            PlayerView()
                .popupTitle(musicPlayerEnv.title, subtitle: musicPlayerEnv.subTitle)
        }
        .popupBarStyle(.floating)
        .popupInteractionStyle(.customizedSnap(percent: 0.2))
        .popupCloseButtonStyle(.none)
        .popupBarProgressViewStyle(.none)
    }
}

struct PlayerView: View {
    @EnvironmentObject var musicPlayerEnv: MusicPlayerEnv
    @EnvironmentObject var musicPlayerTimerEnv: MusicPlayerTimerEnv

    var body: some View {
        print("the player view is being redrawn")

        return VStack {
            Spacer()

            Text("Player View")
                .font(.largeTitle)

            Text("Timer: \(musicPlayerTimerEnv.progress)")
                .font(.largeTitle)
                .padding(20)

            Button(action: {
                musicPlayerTimerEnv.startOrPauseTimer()
            }, label: {
                Text(musicPlayerTimerEnv.isPlaying ? "PAUSE" : "PLAY")
                    .background(.red)
                    .font(.largeTitle)
                    .padding()

            })

            Button(action: {
                musicPlayerEnv.isPopupOpen = false
            }, label: {
                Text("Close Player View")
                    .background(.green)
                    .font(.title)
                    .padding()
            })

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue)
    }
}

#Preview {
    ContentView()
}
