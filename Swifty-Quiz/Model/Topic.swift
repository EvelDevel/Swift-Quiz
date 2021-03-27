
//  Created by Евгений Никитин on 25.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

struct Topic: Codable {
    
    var questionSet: [Question]         // Исходный сет вопросов
    var continueQuestionSet: [Question] // Потенциально зашафленный сет (для продолжения игры)
    var topicTag: Int                   // Порядковый номер текущей темы
    var topicName: String               // Тема выбранной категории
}
