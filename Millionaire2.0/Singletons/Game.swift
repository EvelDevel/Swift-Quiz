
//  Created by Евгений Никитин on 11.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class Game {
    static let shared = Game()
    
    private let recordCaretaker = RecordsCaretaker()
    private var currentQyestionOrder: QuestionOrder?
    private var currentShuffelingQuestionTextStatus: QuestionText?
    
    private(set) var records: [Record] = [] {
        didSet {
            recordCaretaker.saveRecordsList(records: self.records)
        }
    }
    
    private init() {
        self.records = self.recordCaretaker.getRecordsList()
    }
    
    /// Рекорды: Добавление и удаление рекордов в таблицу
    func addRecord(_ record: Record) {
        self.records.insert(record, at: 0)
    }
    func clearRecords() {
        self.records = []
    }
    
    /// Настройки: Порядок вопросов в теме
    func setQuestionOrder(order: QuestionOrder) {
        self.currentQyestionOrder = order
    }
    func getQuestionOrderSatus() -> QuestionOrder {
        return currentQyestionOrder ?? QuestionOrder.straight
    }
    
    /// Настройки: Смена формулировок вопроса
    func setQuestionTextShuffeling(flag: QuestionText) {
        self.currentShuffelingQuestionTextStatus = flag
    }
    func getQuestionTextShuffelingStatus() -> QuestionText {
        return currentShuffelingQuestionTextStatus ?? QuestionText.same
    }
}
