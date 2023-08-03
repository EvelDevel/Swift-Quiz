
//  Created by Евгений Никитин on 25.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

final class SettingsCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let settingsUserDefaultsKey = "settings"
    
    func saveSettings(
        settings: Settings
    ) {
        do {
            let data = try encoder.encode(settings)
            
            UserDefaults.standard.set(
                data,
                forKey: settingsUserDefaultsKey
            )
        } catch {
            print("SettingsCaretaker, Error saving settings: \(error)")
        }
    }
    
    func getSettings() -> Settings {
        guard let data = UserDefaults.standard.data(forKey: settingsUserDefaultsKey) else {
            return Settings(
                questionOrder: 0,
                questionTextShuffling: 0,
                sound: 0,
                changeAfterHelp: 0,
                helpAfterWrong: 0,
                appLastVersion: ""
            )
        }
        
        do {
            return try decoder.decode(Settings.self, from: data)
        } catch {
            print("SettingsCaretaker, Error retrieving settings from memory: \(error)")
            return Settings(
                questionOrder: 0,
                questionTextShuffling: 0,
                sound: 0,
                changeAfterHelp: 0,
                helpAfterWrong: 0,
                appLastVersion: ""
            )
        }
    }
}
