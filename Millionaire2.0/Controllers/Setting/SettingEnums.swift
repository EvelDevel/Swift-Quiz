
//  Created by Евгений Никитин on 26.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

// MARK: Последовательность вопросов
enum QuestionOrder {
    case straight
    case random
}

// MARK: Смена формулировок вопроса
enum QuestionText {
    case same
    case random
}

// MARK: Поведение при неправильном ответе
enum EndGame {
    case proceed
    case endGame
}
