
//  Created by Евгений Никитин on 14.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class SelectedTopic {
    static let shared = SelectedTopic()
    private let topicCaretaker = TopicCaretaker()
    
    private init() {
        selectedCategory = self.topicCaretaker.getTopic()
    }
    
    private(set) var selectedCategory: Topic {
        didSet {
            topicCaretaker.saveTopic(
                topic: self.selectedCategory
            )
        }
    }
    
    func saveQuestionSet(
        _ questionSet: [Question],
        category: String,
        tag: Int
    ) {
        selectedCategory.questionSet = questionSet
        selectedCategory.topicName = category
        selectedCategory.topicTag = tag
    }
    
    func saveShuffledSet(
        _ continueSet: [Question]
    ) {
        self.selectedCategory.continueQuestionSet = continueSet
    }
}
