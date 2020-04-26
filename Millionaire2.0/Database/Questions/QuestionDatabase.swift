
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.


import Foundation

class QuestionDatabase {
    
    /// Здесь мы оперируем question-set-ами
    
    // MARK: Типы данных
    static func getQuestionsTypesOfData() -> [Question] {
        return TypesOfDataSet.getQuestions()
    }
    
    // MARK: Операторы
    static func getQuestionsOperators() -> [Question] {
        return OperatorsSet.getQuestions()
    }
    
    /*
    // MARK: Коллекции
    static func getQuestionsCollections() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Потоки
    static func getQuestionsQueues() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Функции
    static func getQuestionsFunctions() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Замыкания
    static func getQuestionsClosures() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Перечисления
    static func getQuestionsEnums() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Структуры
    static func getQuestionsStructures() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Классы
    static func getQuestionsClasses() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Свойства
    static func getQuestionsProperties() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Методы
    static func getQuestionsMethods() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Сабскрипты
    static func getQuestionsSubscripts() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Наследование
    static func getQuestionsInheritance() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Инициализация
    static func getQuestionsInitialization() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Деинициализация
    static func getQuestionsDeinitialization() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Обработка ошибок
    static func getQuestionsErrorProcessing() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Опционалы
    static func getQuestionsOptionals() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Приведение типов
    static func getQuestionsTypeCasting() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Расширения
    static func getQuestionsExtensions() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Вложенные типы
    static func getQuestionsNestedTypes() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Протоколы
    static func getQuestionsProtocols() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Шаблоны
    static func getQuestionsGenerics() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Паттерны
    static func getQuestionsPatterns() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: Алгоритмы
    static func getQuestionsAlgorithms() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }
    
    
    // MARK: ARC Автоматический подсчет ссылок
    static func getQuestionsARC() -> [Question] {
        return [
            Question(question: "4?",
                     image: "",
                     optionA: "4",
                     optionB: "4",
                     optionC: "4",
                     optionD: "4",
                     correctAnswer: 3,
                     questionId: 5,
                     helpText: "")
        ]
    }*/
}
