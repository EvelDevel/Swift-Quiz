//
//  FCM.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 19.09.2022.
//  Copyright © 2022 Evel-Devel. All rights reserved.
//

import Foundation

class FCM {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                ""
            ],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     questionId: 000_000_000,
                     helpText: """
                     text
                     """),
        ]
    }
}
