//
//  AudioPlayerProtocol.swift
//  PokemonMobileDev
//
//  Created by Alexis Lomeli Mejia on 03/02/25.
//

import Foundation
import AVFAudio

protocol AudioPlayerServiceProtocol {
    func loadAudio(from url: URL) async throws -> Result<AVAudioPlayer, Error>
}
