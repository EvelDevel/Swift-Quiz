
//  Created by Евгений Никитин on 25.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

// MARK: Модель "настройки"
struct Settings: Codable {
    
    var questionOrder: Int          // Порядок вопросов
    var questionTextShuffeling: Int // Изменение формулировок вопроса
    var sound: Int                  // Звук
    var changeAfterHelp: Int        // Поведение после подсказки (меняем вопрос или остаемся)
    var helpAfterWrong: Int         // Поведение после неправильного ответа (показываем подсказку или переходим)
    var appLastVersion: String      // Сохранение текущей версии приложения (чтобы когда обновляем, рефрешить контент)
}
