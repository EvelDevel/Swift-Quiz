//
//  DrawingAndAnimation.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 14.08.2022.
//  Copyright © 2022 Evel-Devel. All rights reserved.
//

import Foundation

class DrawingAndAnimation {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "Как в SwiftUI называется контейнер, который определяет свое содержимое как функцию собственного размера и пространства координат?"
            ],
                     image: "",
                     optionA: "GeometryReader",
                     optionB: "ViewBuilder",
                     optionC: "Path",
                     optionD: "",
                     questionId: 320291560,
                     helpText: """
                     GeometryReader. Контейнер, который определяет свое содержимое как функцию собственного размера и пространства координат.
                     
                     Если вы хотите, чтобы два вью занимали половину доступной ширины экрана, это было бы невозможно с использованием жестко запрограммированных значений, потому что мы не знаем заранее, какой будет ширина экрана.

                     Чтобы решить эту проблему, GeometryReader предоставляет нам входное значение, говорящее нам о доступной ширине и высоте, и затем мы можем использовать это для любых расчетов, которые нам нужны. Итак, если бы у нас было два представления, и мы хотели бы, чтобы одно занимало треть экрана, а другое — две трети, мы могли бы использовать GeometryReader.
                     """),
            
            Question(question: [
                "Какой тип в SwiftUI позволит вам отрисовать контур 2D-формы?"
            ],
                     image: "",
                     optionA: "Path",
                     optionB: "GeometryReader",
                     optionC: "Text",
                     optionD: "",
                     questionId: 453982010,
                     helpText: """
                     Path. SwiftUI предоставляет нам специальный тип Path для рисования пользовательских фигур.

                     Точно так же, как цвета, градиенты и формы, контуры сами по себе являются представлениями (view). Это означает, что мы можем использовать их точно так же, как текстовые вью (Text) и изображения (Image).
                     """),
            
            Question(question: [
                "Как называется структура, позволяющая создать цветовой градиент в SwiftUI?"
            ],
                     image: "",
                     optionA: "Gradient",
                     optionB: ".linearGradient",
                     optionC: "",
                     optionD: "",
                     questionId: 481923730,
                     helpText: """
                     Gradient. Эта структура позволяет создать цветовой градиент, представленный в виде массива цветовых точек - Gradient(colors: [Color]).
                     
                     В свою очередь linearGradient - это функция (модификатор), позволяющая создавать заливку с градиентом, используя дополнительные параметры (startPoint:, endPoint:).
                     """),
            
            Question(question: [
                "Какой модификатор позволит нам создать градиентную заливку в SwiftUI?"
            ],
                     image: "",
                     optionA: ".linearGradient",
                     optionB: ".gradient",
                     optionC: ".fill",
                     optionD: "",
                     questionId: 202976277,
                     helpText: """
                     linearGradient. linearGradient - это функция (модификатор), позволяющая создавать заливку с градиентом, используя дополнительные параметры (startPoint:, endPoint:).
                     """),
            
            Question(question: [
                "Какие параметры необходимы для создания градиентной заливки в SwiftUI с использованием модификатора .linearGradient?"
            ],
                     image: "",
                     optionA: "startPoint и endPoint",
                     optionB: "points и shape",
                     optionC: "startPoint, endPoint, shape",
                     optionD: "",
                     questionId: 595530231,
                     helpText: """
                     startPoint и endPoint. linearGradient - это функция (модификатор), позволяющая создавать заливку с градиентом, используя дополнительные параметры (startPoint:, endPoint:).
                     """),
        ]
    }
}
