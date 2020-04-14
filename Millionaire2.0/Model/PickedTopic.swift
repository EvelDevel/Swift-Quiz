
//  Created by Евгений Никитин on 14.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

// MARK: Singleton

class PickedTopic {
    
    static let shared = PickedTopic()
    
    private(set) var questions: [Question] = []
    
    private init() { }
    
    func addQuestionSet(_ questionSet: [Question]) {
        self.questions = questionSet
    }
    
    func clearQuestions() {
        self.questions = []
    }
}
