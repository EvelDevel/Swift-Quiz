
//  Created by Евгений Никитин on 11.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class Game {
    
    static let shared = Game()
    
    private let recordCaretaker = RecordsCaretaker()
    private let settingsCaretaker = SettingsCaretaker()
    private var weShowedAlert: Bool = false
    
    private(set) var settings: Settings {
        didSet {
            settingsCaretaker.saveSettings(
                settings: self.settings
            )
        }
    }
    
    private(set) var records: [Record] = [] {
        didSet {
            recordCaretaker.saveRecordsList(
                records: self.records
            )
        }
    }
    
    private init() {
        self.records = self.recordCaretaker.getRecordsList()
        self.settings = self.settingsCaretaker.getSettings()
    }
}


// MARK: Работа с подсказкой по незавершенной игре
extension Game {
    
    func showSettingsAlertStatus() -> Bool {
        return self.weShowedAlert
    }
    
    func showTopicAlertStatus() -> Bool {
        return self.weShowedAlert
    }
    
    func showNewGameAlertStatus() -> Bool {
        return self.weShowedAlert
    }
    
    func setThatWeShowedAlert() {
        self.weShowedAlert = true
    }
}


// MARK: Сохранение, удаление, редактирование рекордов
extension Game {
    
    func addRecord(_ record: Record) {
        self.records.insert(record, at: 0)
    }
    
    func replaceRecord(_ record: Record) {
        self.records.remove(at: 0)
        self.records.insert(record, at: 0)
    }
    
    func clearRecords() {
        self.records = []
    }
    
    func deleteOneRecord(index: Int) {
        self.records.remove(at: index)
    }
    
    func changeContinueStatus() {
        if self.records.count != 0 {
            var lastRecord = self.records[0]
            lastRecord.continueGameStatus = false
            self.records.remove(at: 0)
            self.records.insert(lastRecord, at: 0)
        }
    }
    
    func getRecordsList() -> [Record] {
        self.recordCaretaker.getRecordsList()
    }
}


// MARK: Сохранение настроек
extension Game {
    
    func saveSettings(_ settings: Settings) {
        self.settings = settings
    }
}


// MARK: Установка значений настроек
extension Game {
    
    /// Настройки: Порядок вопросов в теме
    func setQuestionOrder(setting: QuestionOrder) {
        if setting == .random {
            self.settings.questionOrder = 1
        } else {
            self.settings.questionOrder = 0
        }
    }
    
    /// Настройки: Смена формулировок вопроса
    func setQuestionTextShuffeling(setting: QuestionText) {
        if setting == .random {
            self.settings.questionTextShuffling = 1
        } else {
            self.settings.questionTextShuffling = 0
        }
    }
    
    /// Настройки: Помощь после неправильного ответа
    func setHelpAfterWrong(setting: HelpAfterWrong) {
        if setting == .help {
            self.settings.helpAfterWrong = 1
        } else {
            self.settings.helpAfterWrong = 0
        }
    }
    
    /// Настройки: Звук
    func setSound(setting: Sound) {
        if setting == .off {
            self.settings.sound = 1
        } else {
            self.settings.sound = 0
        }
    }
    
    /// Настройки: Смена вопросов после подсказки
    func setChangeAfterHelp(setting: ChangeAfterHelp) {
        if setting == .dontChange {
            self.settings.changeAfterHelp = 0
        } else {
            self.settings.changeAfterHelp = 1
        }
    }
    
    /// Сохранение текущей версии приложения
    func saveAppVersion(version: String) {
        self.settings.appLastVersion = version
    }
}
