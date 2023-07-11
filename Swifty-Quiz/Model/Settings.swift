
//  Created by Евгений Никитин on 25.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

struct Settings: Codable {
    var questionOrder: Int          // Порядок вопросов
    var questionTextShuffling: Int // Изменение формулировок вопроса
    var sound: Int                  // Звук
    var changeAfterHelp: Int        // Поведение после подсказки (меняем вопрос или остаемся)
    var helpAfterWrong: Int         // После неправильного ответа (показываем подсказку или переходим)
    var appLastVersion: String      // Сохранение версии приложения (чтобы когда обновляем, рефрешить контент)
}
