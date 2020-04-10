
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.


import Foundation

class QuestionDatabase {
    static func getQuestion() -> [Question] {
        return [
            Question(question: "Как переводится имя паттерна Memento?",
                     optionA: "Наблюдатель",
                     optionB: "Момент",
                     optionC: "Хранитель",
                     optionD: "Склад",
                     correctAnswer: 3),
            
            Question(question: "Как переводится имя паттерна Singleton?",
                     optionA: "Односолодовый",
                     optionB: "Один",
                     optionC: "Единоличник",
                     optionD: "Одиночка",
                     correctAnswer: 4),
            
            Question(question: "Как переводится имя паттерна Observer?",
                     optionA: "Блюдящий",
                     optionB: "Наблюдатель",
                     optionC: "Обзёрвер",
                     optionD: "Смотрящий",
                     correctAnswer: 2),
            
            Question(question: "Самый популярный паттерн в iOS?",
                     optionA: "Delegate",
                     optionB: "Memento",
                     optionC: "Observer",
                     optionD: "Singleton",
                     correctAnswer: 1),
            
            Question(question: "Произвольная текстовая информация, коллекция символов",
                     optionA: "Character",
                     optionB: "Double",
                     optionC: "String",
                     optionD: "Float",
                     correctAnswer: 3),
            
            ///
            
            Question(question: "Минимальная автономная единица, выполняющая команду?",
                     optionA: "Оператор",
                     optionB: "Величина",
                     optionC: "Единица",
                     optionD: "Операнд",
                     correctAnswer: 1),
            
            Question(question: "Значение, которое операторы затрагивают в своей работе?",
                     optionA: "Величина",
                     optionB: "Операнд",
                     optionC: "Оператор",
                     optionD: "Источник",
                     correctAnswer: 2),
            
            Question(question: "Операторы, применяемые к одной величине?",
                     optionA: "Инфиксные",
                     optionB: "Тренарные",
                     optionC: "Унарные",
                     optionD: "Бинарные",
                     correctAnswer: 3),
            
            Question(question: "Операторы, применяемые к двум величинам?",
                     optionA: "Постфиксные",
                     optionB: "Бинарные",
                     optionC: "Тренарные",
                     optionD: "Префиксные",
                     correctAnswer: 2),
            
            Question(question: "Математическая функция модуля числа?",
                     optionA: "abs()",
                     optionB: "sqrt()",
                     optionC: "floor()",
                     optionD: "ceil()",
                     correctAnswer: 1)
        ]
    }
}
