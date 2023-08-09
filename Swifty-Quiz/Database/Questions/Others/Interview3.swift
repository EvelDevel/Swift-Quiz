//
//  Interview.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 20.01.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import Foundation

final class Interview3 {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "Что мы получим в консоль?"
            ],
                     image: "Closures05",
                     optionA: "5, 10",
                     optionB: "5, 5",
                     optionC: "Получим ошибку",
                     optionD: "",
                     id: 876333566,
                     links: [
                        "https://swiftbook.ru/content/languageguide/closures/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/"
                     ],
                     helpText: """
                     5, 10. Мы создаем параметр типа Int и выводим его значение на консоль с помощью замыкания.
                     
                     Int — это структура (value type), значение которого должно передаваться копированием. Но при этом замыкание всегда выводит актуальное значение параметра.
                     
                     Это говорит о том, что внутри замыкания используется не копия параметра a, а ссылка на него.
                     
                     Это пример того, как значимый тип данных может быть передан по ссылке, замыкания всегда захватывают значения по ссылке, а не копированием, даже value type.
                     """
                    ),
        ]
    }
}
