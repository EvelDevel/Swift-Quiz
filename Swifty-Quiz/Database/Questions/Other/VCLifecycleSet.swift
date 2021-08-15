//
//  VCLifecycleSet.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 16.08.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation

class VCLifecycleSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: ["Соответствие приложения требованиям безопасности MASVS ведет к этому",
                                "К чему приводит приведение приложения к соответствию требованиям MASVS (мобильная безопасность)?"],
                     image: "",
                     optionA: "Увеличение стоимости разработки",
                     optionB: "Улучшение user experience",
                     optionC: "Повышение рисков",
                     optionD: "Снижение безопасности",
                     questionId: 110659720,
                     helpText: "Соответствие требованиям MASVS повышает безопасность, но в то же время увеличивает стоимость разработки и потенциально ухудшает опыт конечного пользователя (классический компромисс между удобством и безопасностью)."),
        ]
    }
}
