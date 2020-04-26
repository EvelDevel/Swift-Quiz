
//  Created by Евгений Никитин on 14.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class SelectedTopic {
    
    static let shared = SelectedTopic()
    private let topicCaretaker = TopicCaretaker()
    
    private(set) var topic: Topic {
        didSet {
            print("Сохраняем обновленный топик в память телефона")
            print("\(self.topic.questionSet.count)")
            topicCaretaker.saveTopic(topic: self.topic)
        }
    }
    
    private init() {
        self.topic = self.topicCaretaker.getTopic()
    }
    
    func addQuestionSet(_ questionSet: [Question], topic: String, tag: Int) {
        self.topic.questionSet = questionSet
        self.topic.topicName = topic
        self.topic.topicTag = tag
    }
    
    func clearQuestions() {
        self.topic.questionSet = []
        self.topic.topicName = ""
        self.topic.topicTag = 0
    }
}
