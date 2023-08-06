//
//  MacrosSet.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 06.08.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import Foundation

final class MacrosSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "Могут ли макросы в Swift удалять или изменять существующий код?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "В некоторых случаях",
                     optionD: "",
                     id: 332814551,
                     links: [
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/macros/",
                        "https://habr.com/ru/companies/cleverpumpkin/articles/744414/"
                     ],
                     helpText: """
                     Нет. Макросы добавляют новый код, но они никогда не удаляют или изменяют существующий код.
                     """
                    ),
            
            Question(question: [
                "Если при реализации макроса в Swift допустить ошибку, будет ли она рассматриваться как ошибка компиляции?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 332814551,
                     links: [
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/macros/",
                        "https://habr.com/ru/companies/cleverpumpkin/articles/744414/"
                     ],
                     helpText: """
                     Да. Входные данные для макроса и его результат проверяются на соответствие синтаксису Swift и на наличие правильных типов.
                     
                     Если реализация макроса вызывает ошибку, компилятор рассматривает это как ошибку компиляции.
                     
                     Эти проверки облегчают анализ кода, использующего макросы, и облегчают выявление багов при неправильном использовании или ошибках в его реализации.
                     """
                    ),
            
            Question(question: [
                "Этот тип макроса в Swift можно расположить произвольно по коду"
            ],
                     image: "",
                     optionA: "freestanding",
                     optionB: "attached",
                     optionC: "",
                     optionD: "",
                     id: 307358330,
                     links: [
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/macros/",
                        "https://habr.com/ru/companies/cleverpumpkin/articles/744414/"
                     ],
                     helpText: """
                     freestanding. На данный момент в Swift существует 2 типа макросов:

                     freestanding – это макросы, которые можно расположить произвольно по коду. Применение такого макроса возможно через символ решетки: (#macro).

                     attached – это макросы, которые присоединяются к какому либо объявлению. Применение такого макроса возможно через символ «собаки»: (@Macro).
                                          
                     Вы вызываете прикрепленные и не прикрепленные макросы немного по-разному, но оба они следуют одной и той же модели расширения макросов, и их реализуют с помощью одного и того же подхода.
                     """
                    ),
            
            Question(question: [
                "Этот тип макроса в Swift присоединяется к какому либо объявлению"
            ],
                     image: "",
                     optionA: "attached",
                     optionB: "freestanding",
                     optionC: "",
                     optionD: "",
                     id: 933060242,
                     links: [
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/macros/",
                        "https://habr.com/ru/companies/cleverpumpkin/articles/744414/"
                     ],
                     helpText: """
                     attached. На данный момент в Swift существует 2 типа макросов:

                     freestanding – это макросы, которые можно расположить произвольно по коду. Применение такого макроса возможно через символ решетки: (#macro).

                     attached – это макросы, которые присоединяются к какому либо объявлению. Применение такого макроса возможно через символ «собаки»: (@Macro).
                     
                     Вы вызываете прикрепленные и не прикрепленные макросы немного по-разному, но оба они следуют одной и той же модели расширения макросов, и их реализуют с помощью одного и того же подхода.
                     """
                    ),
            
            Question(question: [
                "К какому типу макроса в Swift можно обратиться через решетку (#)?"
            ],
                     image: "",
                     optionA: "freestanding",
                     optionB: "attached",
                     optionC: "",
                     optionD: "",
                     id: 236854078,
                     links: [
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/macros/",
                        "https://habr.com/ru/companies/cleverpumpkin/articles/744414/"
                     ],
                     helpText: """
                     freestanding. Это тип макроса, который можно расположить произвольно по коду.
                     
                     Применение такого макроса возможно через символ решетки: (#macro).
                     """
                    ),
            
            Question(question: [
                "К какому типу макроса в Swift мы обращаемся через собаку (@)?"
            ],
                     image: "",
                     optionA: "attached",
                     optionB: "freestanding",
                     optionC: "",
                     optionD: "",
                     id: 933060242,
                     links: [
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/macros/",
                        "https://habr.com/ru/companies/cleverpumpkin/articles/744414/"
                     ],
                     helpText: """
                     attached. Это тип макроса, который присоединяются к какому либо объявлению.
                     
                     Применение такого макроса возможно через символ «собаки»: (@Macro).
                     """
                    ),
        ]
    }
}
