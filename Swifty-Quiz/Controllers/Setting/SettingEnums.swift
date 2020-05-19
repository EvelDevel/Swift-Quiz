
//  Created by Евгений Никитин on 26.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

// Последовательность вопросов
enum QuestionOrder {
    case straight
    case random
}

// Смена формулировок вопроса
enum QuestionText {
    case same
    case random
}

// Поведение при неправильном ответе
enum EndGame {
    case proceed
    case endGame
}

// Подсказка после неправильного ответа
enum HelpAfterWrong {
    case proceed
    case help
}

// Поведение при досрочном выходе
enum SaveRecord {
    case save
    case dontSave
}

// Звук
enum Sound {
    case on
    case off
}

// Смена после подсказки
enum ChangeAfterHelp {
    case change
    case dontChange
}
