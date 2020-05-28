
//  Created by Евгений Никитин on 05.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit
import AVFoundation

enum Sounds {
    case menuMainButton
    case topicAndSettingsButton
    case answerButtonRight
    case answerButtonWrong
    case clearRecordsSound
    case infoAboutSetting
}

class SoundPlayer {
    
    static let shared = SoundPlayer()
    var player = AVAudioPlayer()
    private init() { }
    
    func playSound(sound: Sounds) {
        if Game.shared.settings.sound == 0 {
            
            var name: String = ""
            var soundExtension: String = ""
            
            switch sound {
            case .menuMainButton:
                name = "button1"
                soundExtension = "wav"
            case .topicAndSettingsButton:
                name = "button2"
                soundExtension = "wav"
            case .answerButtonRight:
                name = "button1"
                soundExtension = "wav"
            case .answerButtonWrong:
                name = "button2"
                soundExtension = "wav"
            case .clearRecordsSound:
                name = "trash"
                soundExtension = "mp3"
            case .infoAboutSetting:
                name = "button1"
                soundExtension = "wav"
            }
            
            guard let url = Bundle.main.url(forResource: name, withExtension: soundExtension) else {
                return
            }
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.play()
            } catch {
                print("Error witn button sounds")
            }
        }
    }
}
