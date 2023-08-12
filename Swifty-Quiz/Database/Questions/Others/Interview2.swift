//
//  Interview.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 20.01.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import Foundation

final class Interview2 {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "Когда происходит автоматическая расстановка retain / release в ARC?"
            ],
                     image: "",
                     optionA: "На этапе компиляции",
                     optionB: "В райнтайме",
                     optionC: "",
                     optionD: "",
                     id: 504040212,
                     links: [
                        "https://habr.com/ru/articles/592385/"
                     ],
                     helpText: """
                     На этапе компиляции. ARC отличается от MRC тем, что компилятор сам расставляет методы retain/release за программиста. Важно понимать, что ARC работает при компиляции, а подсчет ссылок — в рантайме.
                     """
                    ),
            
            Question(question: [
                "В какой момент происходит подсчет ссылок в ARC?"
            ],
                     image: "",
                     optionA: "В райнтайме",
                     optionB: "На этапе компиляции",
                     optionC: "В дебаг режиме",
                     optionD: "",
                     id: 595096940,
                     links: [
                        "https://habr.com/ru/articles/592385/"
                     ],
                     helpText: """
                     В рантайме. ARC отличается от MRC тем, что компилятор сам расставляет методы retain/release за программиста. Важно понимать, что ARC работает при компиляции, а подсчет ссылок — уже в рантайме.
                     """
                    ),
        ]
    }
}
