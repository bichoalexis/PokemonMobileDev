//
//  AudioPlayer.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 03/02/25.
//

import AVKit
import SwiftUI

struct AudioPlayerView: View {
    var url: URL?
    var title: LocalizedStringKey
    @StateObject var audioPlayerViewModel = AudioPlayerViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            if audioPlayerViewModel.isLoading {
                Rectangle()
                    .frame(width: 50, height: 8)
                    .shimmer()
                Rectangle()
                    .frame(width: 300, height: 16)
                    .shimmer()
            }
            if let player = audioPlayerViewModel.player {
                Text(title)
                    .font(.system(size: 18, weight: .medium))
                HStack {
                    Button(action: {
                        audioPlayerViewModel.togglePlayback()
                    }) {
                        Image(
                            systemName: audioPlayerViewModel.isPlaying
                                ? "pause.circle.fill"
                                : "play.circle.fill"
                        )
                        .font(.largeTitle)
                    }
                    .buttonStyle(PlainButtonStyle())

                    Slider(
                        value: Binding(
                            get: { audioPlayerViewModel.currentTime },
                            set: { newValue in
                                player.currentTime = newValue
                                audioPlayerViewModel.currentTime = newValue
                            }
                        ),
                        in: 0...audioPlayerViewModel.totalTime
                    )
                    .accentColor(.blue)
                }

                HStack {
                    Text(audioPlayerViewModel.currentTime.formatAsTimer)
                    Spacer()
                    Text(audioPlayerViewModel.totalTime.formatAsTimer)
                }
                .padding(.horizontal)
            }
        }
        .task {
            if let url = url {
                await audioPlayerViewModel.setUpAudioPlayer(withURL: url)
            }
        }
        .onReceive(
            Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        ) { _ in
            audioPlayerViewModel.updateProgress()
        }
        .onDisappear {
            audioPlayerViewModel.player?.stop()
        }
    }
}
