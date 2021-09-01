
//  Created by Евгений Никитин on 25.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

// MARK: Memento

class TopicCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "topic"
    
    func saveTopic(topic: Topic) {
        do {
            let data = try self.encoder.encode(topic)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("We have some problems with saving topic")
        }
    }
    
    func getTopic() -> Topic {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return Topic(questionSet: [],
                         continueQuestionSet: [],
                         topicTag: 0,
                         topicName: "")
        }
        do {
            return try self.decoder.decode(Topic.self, from: data)
        } catch {
            print("We have some problems with retrieving topic from memory")
            return Topic(questionSet: [],
                         continueQuestionSet: [],
                         topicTag: 0,
                         topicName: "")
        }
    }
}
