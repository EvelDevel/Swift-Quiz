
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

struct Question: Codable {
    let question: [String]  // Массив с формулировками вопроса
    let image: String       // Изображение для вопроса
    let optionA: String     // Варианты ответа (4 варианта, вариативно может быть от 2 до 4)
    let optionB: String     // Правильный ответ всегда в optionA
    let optionC: String
    let optionD: String
    let id: Int             // Уникальный номер вопроса
    var links: [String]?
    let helpText: String    // Теоретическая подсказка
}
