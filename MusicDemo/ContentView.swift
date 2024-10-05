//
//  ContentView.swift
//  MusicDemo
//
//  Created by Steven on 2024/10/5.
//

import LNPopupUI
import SwiftUI

struct ContentView: View {

    @StateObject var musicPlayerEnv = MusicPlayerEnv()

    var body: some View {
        VStack {
            Text("root View").font(.largeTitle)
        }
        .popup(isBarPresented: $musicPlayerEnv.isBarPresented, isPopupOpen: $musicPlayerEnv.isPopupOpen) {
            // player view
            PlayerView()
                .environmentObject(musicPlayerEnv)
                .popupTitle(musicPlayerEnv.title, subtitle: musicPlayerEnv.subTitle)
        }
        .popupBarStyle(.floating)
        .popupInteractionStyle(.customizedSnap(percent: 0.2))
        .popupCloseButtonStyle(.none)
        .popupBarProgressViewStyle(.none)
    }
}

struct PlayerView: View {
    @StateObject var musicPlayerTimerEnv = MusicPlayerTimerEnv()
    
    var body: some View {
        VStack {
            Spacer()

            Text("Music Player")
                .font(.largeTitle)

            Text("Timer: \(musicPlayerTimerEnv.progress)")
                .font(.largeTitle)
                .padding(20)

            Button(action: {
                musicPlayerTimerEnv.startOrPauseTimer()
            }, label: {
                Text(musicPlayerTimerEnv.isPlaying ? "pause" : "play")
                    .background(.red)
                    .font(.largeTitle)
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
