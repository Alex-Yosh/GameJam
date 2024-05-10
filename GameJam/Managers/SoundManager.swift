//
//  SoundManager.swift
//  GameJam
//
//  Created by Shannon Cui on 2024-05-10.
//

import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    var audioPlayer1: AVAudioPlayer?
    var audioPlayer2: AVAudioPlayer?
    
    // Replace with actual file names and extensions
    let audioFile1 = "pop"
    let audioFile2 = "bubble"
    let audioFileExtension = "mp3"
    
    init() {
        setupAudioPlayers()
    }
    
    func setupAudioPlayers() {
        guard let url1 = Bundle.main.url(forResource: audioFile1, withExtension: audioFileExtension),
              let url2 = Bundle.main.url(forResource: audioFile2, withExtension: audioFileExtension) else {
            print("One or both audio files not found")
            return
        }
        
        do {
            audioPlayer1 = try AVAudioPlayer(contentsOf: url1)
            audioPlayer1?.prepareToPlay()
            
            audioPlayer2 = try AVAudioPlayer(contentsOf: url2)
            audioPlayer2?.prepareToPlay()
        } catch {
            print("Error initializing audio players: \(error.localizedDescription)")
        }
    }
    
    func playBombSound() {
        audioPlayer1?.play()
    }
    
    func playFishSound() {
        audioPlayer2?.play()
    }
    
    func stopAllSounds() {
        audioPlayer1?.stop()
        audioPlayer2?.stop()
    }
}
