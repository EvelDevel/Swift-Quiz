//
//  UIView.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 07.11.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation


class UIViewSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     questionId: 00000,
                     helpText: ""),
        ]
    }
}
