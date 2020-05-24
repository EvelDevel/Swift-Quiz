
//  Created by Евгений Никитин on 11.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class ControlFlowSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: ["Сколько разных циклов поддерживает Swift?",
                                "Swift поддерживает столько разных циклов"],
                     image: "",
                     optionA: "три",
                     optionB: "два",
                     optionC: "четыре",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 1,
                     helpText: "Циклы for-in, while, repeat-while"),
            
            Question(question: ["Для чего используется цикл for-in?",
                                "Цикл for-in используется именно для этого"],
                     image: "",
                     optionA: "Итерация элементов коллекции",
                     optionB: "Выполнение набора инструкций",
                     optionC: "Вычисление условий",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 2,
                     helpText: "Цикл for-in используется для итерации по коллекциям элементов, таких как диапазоны чисел, элементы массива или символы в строке."),
            
            Question(question: ["При итерации какой коллекции, мы можем разложить вернувшееся значение на отдельные константы?",
                                "При итерации этой коллекции, вернувшееся значение можно разложить на отдельные константы",
                                "При итерации какой коллекции нам возвращается кортеж значений, который можно разложить на отдельные константы?"],
                     image: "",
                     optionA: "Словарь",
                     optionB: "Множество",
                     optionC: "Массив",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 3,
                     helpText: "Вы можете производить итерацию по словарю, чтобы получить доступ к его паре ключ-значение. Когда происходит итерация по словарю, каждый его элемент возвращается как кортеж (ключ, значение). Вы можете разложить члены кортежа на отдельные константы для того, чтобы использовать их в теле цикла for-in. "),
            
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
                     helpText: "")
        ]
    }
}
