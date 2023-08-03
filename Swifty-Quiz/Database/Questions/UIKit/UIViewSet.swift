//
//  UIView.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 07.11.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation


final class UIViewSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: ["Какой из этих методов работает асинхронно?"],
                     image: "",
                     optionA: "setNeedsLayout()",
                     optionB: "layoutIfNeeded()",
                     optionC: "",
                     optionD: "",
                     id: 623882062,
                     helpText: "setNeedsLayout(). Это асинхронный метод. Он завершается и немедленно возвращается (хотя мы и не видим его эффект сразу же)."),
            
            Question(question: ["layoutIfNeeded() выполняется сразу же, не ожидая следующего цикла обновления. Правда ли это?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 298697702,
                     helpText: "Да. Метод layoutIfNeeded сообщает системе, что вы хотите, чтобы перерисовка вью и его сабвью выполнялись немедленно, не дожидаясь следующего цикла обновления. Когда вызов этого метода завершен, макет уже настроен и отрисован на основе всех изменений, которые были отмечены вами до вызова метода."),
            
            Question(question: ["Этот метод сообщает системе, что вы хотите, чтобы перерисовка вью и его сабвью выполнялись немедленно, не дожидаясь следующего цикла обновления"],
                     image: "",
                     optionA: "layoutIfNeeded()",
                     optionB: "setNeedsLayout()",
                     optionC: "",
                     optionD: "",
                     id: 614660374,
                     helpText: "layoutIfNeeded(). Метод layoutIfNeeded сообщает системе, что вы хотите, чтобы перерисовка вью и его сабвью выполнялись немедленно, не дожидаясь следующего цикла обновления."),
            
            Question(question: ["Этот метод записывает запрос на обновление вью и сразу же возвращается, не вызывая немедленное обновление"],
                     image: "",
                     optionA: "setNeedsLayout()",
                     optionB: "layoutIfNeeded()",
                     optionC: "",
                     optionD: "",
                     id: 525359519,
                     helpText: "setNeedsLayout(). Метод setNeedsLayout записывает запрос на обновление вью и сразу же возвращается, не вызывая немедленное обновление."),
            
            Question(question: ["Внутри какого метода мы можем написать свою реализацию установки фреймов для всех или части ваших вью?"],
                     image: "",
                     optionA: "layoutSubviews()",
                     optionB: "layoutIfNeeded()",
                     optionC: "setNeedsLayout()",
                     optionD: "",
                     id: 162682892,
                     helpText: """
                     layoutSubviews(). Подклассы могут переопределять этот метод по мере необходимости для более точной отрисовки интерфейса.
                     
                     Вы должны переопределять этот метод только в том случае, если Auto Layout и Constraints из коробки не предлагают желаемого поведения.
                     
                     Вы можете написать свою реализацию внутри этого метода для непосредственной установки фреймов всех или части ваших вью.
                     """),
            
            Question(question: ["Должны ли мы обращаться к методу layoutSubviews напрямую?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 819892835,
                     helpText: "Нет. Вы не должны вызывать этот метод напрямую. Если вы хотите принудительно обновить макет, вызовите метод setNeedsLayout(), чтобы сделать это в следующий цикл обновления. Если же вы хотите немедленно обновить ваши вью - вызовите метод layoutIfNeeded()."),
            
            Question(question: ["Какой из этих нативных методов UIView может быть переопределен (override)?"],
                     image: "",
                     optionA: "layoutSubviews()",
                     optionB: "layoutIfNeeded()",
                     optionC: "setNeedsLayout()",
                     optionD: "",
                     id: 300785833,
                     helpText: "layoutSubviews(). Из трех представленных методов, переопределяемым является только метод layoutSubviews. При его переопределении (override) вы так же должны обращаться к его супер-классу, super.layoutSubviews()."),
            
            Question(question: ["При переопределении метода layoutSubviews, должны ли вы обращаться к его суперклассу?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 268781975,
                     helpText: "Да. Переопределение метода layoutSubviews предполагает вызов super.layoutSubviews()."),
            
            Question(question: ["Метод setNeedsLayout() выполняется сразу же, не ожидая следующего цикла обновления. Правда ли это?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 104695270,
                     helpText: """
                     Нет. Метод setNeedsLayout для UIView сообщает системе, что вы хотите, чтобы произошла перерисовка вью и всех его сабвью, когда наступит следующий цикл обновления. Он вызывается в основном потоке приложения.
                     
                     Он записывает запрос на обновление вью и сразу же возвращается. Поскольку этот метод не вызывает немедленное обновление, вы можете объединить все обновления вью в один цикл обновления, что обычно лучше для производительности.
                     """),
            
            Question(question: ["Будет ли вызываться метод layoutSubviews() после вызова layoutIfNeeded() или setNeedsLayout()?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 856112029,
                     helpText: "Да. Если вы хотите принудительно вызвать метод layoutSubviews - вызовите метод setNeedsLayout(), чтобы сделать это в следующий цикл обновления, или вызовите метод layoutIfNeeded() чтобы сделать это немедленно."),
        ]
    }
}
