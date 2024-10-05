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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Text("Timer: \(musicPlayerEnv.progress)")
                .font(.largeTitle)
            
            Button(action: {
                musicPlayerEnv.startOrPauseTimer()
            }, label: {
                Text(musicPlayerEnv.isPlaying ? "pause" : "play")
                    .background(.red)
                    .font(.largeTitle)
            })
        }
        .environmentObject(musicPlayerEnv)
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
    @State var timer: Double = 0.0
//    @EnvironmentObject var musicPlayerEnv: MusicPlayerEnv

    var body: some View {
        VStack {
            Spacer()

//            Text("Timer: \(musicPlayerEnv.progress)")

//            Button(action: {
//                musicPlayerEnv.startOrPauseTimer()
//            }, label: {
//                Text(musicPlayerEnv.isPlaying ? "pause" : "play")
//                    .background(.red)
//            })

            Spacer()

        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.blue)
    }
}

#Preview {
    ContentView()
}
