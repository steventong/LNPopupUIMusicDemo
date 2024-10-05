//
//  MusicDemoApp.swift
//  MusicDemo
//
//  Created by Steven on 2024/10/5.
//

import SwiftUI

@main
struct MusicDemoApp: App {
    @StateObject private var musicPlayerEnv = MusicPlayerEnv()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(musicPlayerEnv)
        }
    }
}
