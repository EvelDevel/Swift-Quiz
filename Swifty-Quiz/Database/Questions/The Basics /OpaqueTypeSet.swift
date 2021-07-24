//
//  OpaqueTypeSet.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 04.07.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation

class OpaqueTypeSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: ["Что делает функция или метод с непрозрачным типом возвращаемого значения?"],
                     image: "",
                     optionA: "Скрывает информацию о типе",
                     optionB: "Шифрует информацию о типе",
                     optionC: "Не использует информацию о типе",
                     optionD: "",
                     questionId: 0000,
                     helpText: "Функция или метод с непрозрачным типом возвращаемого значения скрывает информацию о типе своего возвращаемого значения.")
        ]
    }
}
