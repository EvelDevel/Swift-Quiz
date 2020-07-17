
//  Created by Евгений Никитин on 25.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

struct Topic: Codable {
    var questionSet: [Question]
    var continueQuestionSet: [Question]
    var topicTag: Int
    var topicName: String 
}
