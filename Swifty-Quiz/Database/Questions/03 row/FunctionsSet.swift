
//  Created by Евгений Никитин on 11.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class FunctionsSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: ["Какие имена должны быть у функций?",
                                "У функций должны быть такие имена"],
                     image: "",
                     optionA: "Уникальные",
                     optionB: "Написанные на Русском",
                     optionC: "С заглавной буквы",
                     optionD: "Состоящие из 1 слова",
                     correctAnswer: 1,
                     questionId: 1,
                     helpText: "Функции – это самостоятельные фрагменты кода, решающие определенную задачу. Каждой функции присваивается уникальное имя, по которому ее можно идентифицировать и вызвать в нужный момент."),
            
            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 2,
                     helpText: ""),
            
            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 3,
                     helpText: ""),
            
            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 4,
                     helpText: ""),
            
        ]
    }
}
