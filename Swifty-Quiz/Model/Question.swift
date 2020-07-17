
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

// MARK: Модель вопроса игры
struct Question: Codable {
    
    let question: [String]  /// Массив с формулировками вопроса
    let image: String       /// Изображение для вопроса
    let optionA: String     /// Варианты ответа (4 варианта, вариативно может быть от 2 до 4)
    let optionB: String
    let optionC: String
    let optionD: String
    let correctAnswer: Int  /// Номер правильного ответа (возможно придется деприкейтнуть, после 3 темы все правильный в optionA)
    let questionId: Int     /// Уникальный номер вопроса
    let helpText: String    /// Теоретическая подсказка
}
