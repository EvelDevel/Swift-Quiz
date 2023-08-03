//  Created by Евгений Никитин on 25.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

final class TopicCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let topicUserDefaultsKey = "topic"
    
    func saveTopic(topic: Topic) {
        do {
            let data = try encoder.encode(topic)
            
            UserDefaults.standard.set(
                data,
                forKey: topicUserDefaultsKey
            )
        } catch {
            print("TopicCaretaker, Error encoding topic: \(error)")
        }
    }
    
    func getTopic() -> Topic {
        guard let data = UserDefaults.standard.data(
            forKey: topicUserDefaultsKey
        ) else {
            print("TopicCaretaker, Topic data not found in UserDefaults")
            return Topic(
                questionSet: [],
                continueQuestionSet: [],
                topicTag: 0,
                topicName: ""
            )
        }
        
        do {
            return try decoder.decode(
                Topic.self,
                from: data
            )
        } catch {
            print("TopicCaretaker, Error decoding topic: \(error)")
            return Topic(
                questionSet: [],
                continueQuestionSet: [],
                topicTag: 0,
                topicName: ""
            )
        }
    }
}
