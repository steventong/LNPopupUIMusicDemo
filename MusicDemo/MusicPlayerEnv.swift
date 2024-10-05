//
//  MusicPlayerEnv.swift
//  MusicDemo
//
//  Created by Steven on 2024/10/5.
//

import Combine
import Foundation
import SwiftUI

class MusicPlayerEnv: ObservableObject {
    @Published var isBarPresented = true
    @Published var isPopupOpen = false

    @Published var title = "Title"
    @Published var subTitle = "SubTitle"

}


class MusicPlayerTimerEnv: ObservableObject {
  
    @Published var progress: Double = 0

    @Published var isPlaying = false
    @Published var timerCancellable: Cancellable?

    func startOrPauseTimer() {
        if isPlaying {
            stopTimer()
        } else {
            startTimer()
        }
    }

    func startTimer() {
        isPlaying = true
        timerCancellable = Timer.publish(every: 0.1, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.progress += 0.1
            }
    }

    func stopTimer() {
        isPlaying = false
        timerCancellable?.cancel()
    }
}
