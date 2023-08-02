
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

struct Question: Codable {
    let question: [String]  // Массив с формулировками вопроса
    let image: String
    let optionA: String
    let optionB: String     // Правильный ответ всегда в optionA
    let optionC: String
    let optionD: String
    let id: Int
    var links: [String]?
    let helpText: String
}
