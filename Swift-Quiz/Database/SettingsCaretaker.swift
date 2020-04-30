
//  Created by Евгений Никитин on 25.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

// MARK: Memento

class SettingsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "settings"
    
    func saveSettings(settings: Settings) {
        do {
            let data = try self.encoder.encode(settings)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("We have some problems with saving settings")
        }
    }
    
    func getSettings() -> Settings {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return Settings(questionOrder: 0,
                            questionTextShuffeling: 0,
                            endGame: 0)
        }
        do {
            return try self.decoder.decode(Settings.self, from: data)
        } catch {
            print("We have some problems with retrieving settings from memory")
            return Settings(questionOrder: 0,
                            questionTextShuffeling: 0,
                            endGame: 0)
        }
    }
}
