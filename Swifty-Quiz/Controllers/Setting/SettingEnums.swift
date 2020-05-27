
//  Created by Евгений Никитин on 26.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

enum QuestionOrder {    // Последовательность вопросов
    case straight
    case random
}
enum QuestionText {     // Смена формулировок вопроса
    case same
    case random
}
enum HelpAfterWrong {   // Подсказка после неправильного ответа
    case proceed
    case help
}
enum SaveRecord {       // Поведение при досрочном выходе
    case save
    case dontSave
}
enum Sound {            // Звук
    case on
    case off
}
enum ChangeAfterHelp {  // Смена после подсказки
    case change
    case dontChange
}
