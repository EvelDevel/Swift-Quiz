
//  Created by Евгений Никитин on 11.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class Game {
    static let shared = Game()
    private let recordCaretaker = RecordsCaretaker()
    private var currentQyestionOrder: QuestionOrder?
    private var currentShuffelingQuestionTextStatus: QuestionText?
    private var currentEndGameStatus: EndGame?
    
    private(set) var records: [Record] = [] {
        didSet {
            recordCaretaker.saveRecordsList(records: self.records)
        }
    }
    private init() {
        self.records = self.recordCaretaker.getRecordsList()
    }
}


///


// MARK: Сохранение рекордов
extension Game {
    /// Рекорды: Добавление и удаление рекордов в таблицу
    func addRecord(_ record: Record) {
        self.records.insert(record, at: 0)
    }
    func clearRecords() {
        self.records = []
    }
}


// MARK: Сохранение настроек
extension Game {
    /// Настройки: Порядок вопросов в теме
    func setQuestionOrder(setting: QuestionOrder) {
        self.currentQyestionOrder = setting
    }
    func getQuestionOrderSatus() -> QuestionOrder {
        return currentQyestionOrder ?? QuestionOrder.straight
    }
    /// Настройки: Смена формулировок вопроса
    func setQuestionTextShuffeling(setting: QuestionText) {
        self.currentShuffelingQuestionTextStatus = setting
    }
    func getQuestionTextShuffelingStatus() -> QuestionText {
        return currentShuffelingQuestionTextStatus ?? QuestionText.same
    }
    /// Настройки: Поведение при неправильном ответе
    func setEndGame(setting: EndGame) {
        self.currentEndGameStatus = setting
    }
    func getEndGameStatus() -> EndGame {
        return currentEndGameStatus ?? EndGame.proceed
    }
}
