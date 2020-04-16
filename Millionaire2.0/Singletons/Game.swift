
//  Created by Евгений Никитин on 11.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

// MARK: Singleton

class Game {
    
    static let shared = Game()
    private let recordCaretaker = RecordsCaretaker()
    
    private(set) var records: [Record] = [] {
        didSet {
            recordCaretaker.saveRecordsList(records: self.records)
        }
    }
    
    private init() {
        self.records = self.recordCaretaker.getRecordsList()
    }
    
    func addRecord(_ record: Record) {
        self.records.insert(record, at: 0)
    }
    func clearRecords() {
        self.records = []
    }
}







