//
//  RXSwift.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 26.01.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import Foundation

final class Combine {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "Что из себя представляет Combine?"
            ],
                     image: "",
                     optionA: "Фреймворк",
                     optionB: "Язык программирования",
                     optionC: "",
                     optionD: "",
                     id: 674974751,
                     links: [
                        "https://developer.apple.com/documentation/combine"
                     ],
                     helpText: """
                     Набор инструментов. Combine - это фреймворк от Apple, который предоставляет декларативные примитивы для обработки событий и управления потоками данных.
                     
                     Он позволяет реагировать на изменения значений и связывать различные потоки данных, что упрощает асинхронное программирование и управление потоками в Swift.
                     
                     Combine интегрирует в себя множество парадигм функционального программирования, таких как работа с потоками, обработка ошибок, операторы для преобразования и фильтрации данных, а также возможности для создания собственных кастомных операторов.
                     """
                    ),
        ]
    }
}
 
