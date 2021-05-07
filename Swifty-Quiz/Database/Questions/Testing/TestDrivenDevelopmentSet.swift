//
//  TestingSet.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 07.05.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation

class TestDrivenDevelopmentSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: ["Testing"],
                     image: "",
                     optionA: "5",
                     optionB: "6",
                     optionC: "7",
                     optionD: "8",
                     questionId: 00000,
                     helpText: ""),
        ]
    }
}
