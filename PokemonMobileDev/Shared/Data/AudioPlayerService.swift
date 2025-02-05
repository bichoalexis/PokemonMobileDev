//
//  AudioPlayerService.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 03/02/25.
//

// AudioPlayerService.swift

import AVFoundation
import Foundation
import OggDecoder

final class AudioPlayerService: AudioPlayerServiceProtocol {
    private let decoder = OGGDecoder()

    func loadAudio(from url: URL) async throws -> Result<
        AVAudioPlayer, any Error
    > {
        let (data, httpResponse) = try await URLSession.shared.data(from: url)

        guard let httpResponse = httpResponse as? HTTPURLResponse,
            httpResponse.statusCode == 200
        else {
            return .failure(URLError(.badServerResponse))
        }

        // Write the downloaded data to a temporary OGG file
        let tempDir = FileManager.default.temporaryDirectory
        let localOGGURL = tempDir.appendingPathComponent(url.lastPathComponent)
        try data.write(to: localOGGURL)

        // Decode the OGG file to a WAV file using a continuation to bridge the callback
        let savedUrl: URL = try await withCheckedThrowingContinuation {
            continuation in
            self.decoder.decode(localOGGURL) { savedWavUrl in
                if let savedUrl = savedWavUrl {
                    continuation.resume(returning: savedUrl)
                } else {
                    let error = NSError(
                        domain: "AudioPlayerService",
                        code: -2,
                        userInfo: [
                            NSLocalizedDescriptionKey:
                                "Failed to decode OGG file to WAV."
                        ]
                    )
                    continuation.resume(throwing: error)
                }
            }
        }

        // Create and prepare the AVAudioPlayer
        let audioPlayer = try AVAudioPlayer(contentsOf: savedUrl)
        audioPlayer.prepareToPlay()
        return .success(audioPlayer)
    }
}
