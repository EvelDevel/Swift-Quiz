//
//  ServiceLocator.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 28.01.2022.
//  Copyright © 2022 Evel-Devel. All rights reserved.
//

import Foundation

class ServiceLocator {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     questionId: 00000,
                     helpText: "")
        ]
    }
}
