
//  Created by Евгений Никитин on 14.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

// MARK: Singleton

class SelectedTopic {
    
    static let shared = SelectedTopic()
    private(set) var questions: [Question] = []
    private(set) var topic: String = ""
    
    private init() { }
    
    /// Работа с сетом вопросов
    func addQuestionSet(_ questionSet: [Question], topic: String) {
        self.questions = questionSet
        self.topic = topic
    }
    func clearQuestions() {
        self.questions = []
        self.topic = ""
    }
}
