//
//  AudioPlayerViewModel.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 04/02/25.
//

import AVFoundation
import Foundation
import OggDecoder

@MainActor
class AudioPlayerViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var player: AVAudioPlayer?  // The audio player instance
    @Published var isPlaying = false  // Tracks whether the audio is playing or not
    @Published var totalTime: TimeInterval = 0.0  // Total duration of the audio
    @Published var currentTime: TimeInterval = 0.0  // Current playback time of the audio
    let audioPlayerService: AudioPlayerServiceProtocol

    init(audioPlayerService: AudioPlayerService = AudioPlayerService()) {
        self.audioPlayerService = audioPlayerService
    }

    let decoder = OGGDecoder()

    func setUpAudioPlayer(withURL: URL) async {
        guard !isLoading else { return }
        isLoading = true
        let data = try? await audioPlayerService.loadAudio(from: withURL)
        switch data {
        case .success(let player):
            self.player = player
            totalTime = player.duration
            isLoading = false
        default:
            isLoading = false
            return
        }

    }

    func updateProgress() {
        guard let player = player, player.isPlaying else {
            isPlaying = false
            currentTime = totalTime
            return
        }
        currentTime = player.currentTime  // Update the current time state
    }

    func togglePlayback() {
        guard let player = player else { return }
        isPlaying.toggle()
        if isPlaying {
            player.play()
        } else {
            player.pause()
        }
    }
}
