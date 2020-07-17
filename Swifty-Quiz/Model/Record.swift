
//  Created by Евгений Никитин on 11.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

// MARK: Модель рекорда игры
struct Record: Codable {
    
    var date: Date?                         /// Дата
    var score: Int?                         /// Общий счет
    var topic: String?                      /// Тема игры (название категории)
    var totalQuestion: Int?                 /// Общее количество вопросов
    var percentOfCorrectAnswer: Double?     /// Процент правильных ответов
    var helpCounter: Int?                   /// Счетчик подсказок
    var playedNum: Int?                     /// Отыгранное количество вопросов
    var continueGameStatus: Bool?           /// Статус "продолжаем" игру или нет
}
