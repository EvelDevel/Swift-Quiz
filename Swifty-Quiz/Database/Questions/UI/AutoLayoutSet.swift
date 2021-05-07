//
//  UISet.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 07.05.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation

class AutoLayoutSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: ["UI"],
                     image: "",
                     optionA: "1",
                     optionB: "2",
                     optionC: "3",
                     optionD: "",
                     questionId: 00000,
                     helpText: ""),
        ]
    }
}
