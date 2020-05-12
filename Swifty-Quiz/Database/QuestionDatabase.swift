
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.


import Foundation

class QuestionDatabase {
    
    // MARK: 01 row
    // Типы данных
    static func getQuestionsTypesOfData() -> [Question] { return TypesOfDataSet.getQuestions() }
    // Операторы
    static func getQuestionsOperators() -> [Question] { return OperatorsSet.getQuestions() }
    // Коллекции
    static func getQuestionsCollections() -> [Question] { return CollectionsSet.getQuestions() }
    
    
    // MARK: 02 row
    // Потоки
    static func getQuestionsQueues() -> [Question] { return QueuesSet.getQuestions() }
    // Функции
    static func getQuestionsFunctions() -> [Question] { return FunctionsSet.getQuestions() }
    // Замыкания
    static func getQuestionsClosures() -> [Question] { return ClosuresSet.getQuestions() }
    // Перечисления
    static func getQuestionsEnums() -> [Question] { return EnumsSet.getQuestions() }
    

    // MARK: 03 row
    // Структуры
    static func getQuestionsStructures() -> [Question] { return StructuresSet.getQuestions() }
    // Классы
    static func getQuestionsClasses() -> [Question] { return ClassesSet.getQuestions() }
    // Свойства
    static func getQuestionsProperties() -> [Question] { return PropertiesSet.getQuestions() }
    // Методы
    static func getQuestionsMethods() -> [Question] { return MethodsSet.getQuestions() } 
     
    
    // MARK: 04 row
    // Сабскрипты
    static func getQuestionsSubscripts() -> [Question] { return SubscriptsSet.getQuestions() }
    // Наследование
    static func getQuestionsInheritance() -> [Question] { return InheritanceSet.getQuestions() }
    // Инициализация
    static func getQuestionsInitialization() -> [Question] { return InitializationSet.getQuestions() }
    
    
    // MARK: 05 row
    // Деинициализация
    static func getQuestionsDeinitialization() -> [Question] { return DeinitializationSet.getQuestions() }
    // Обработка ошибок
    static func getQuestionsErrorProcessing() -> [Question] { return ErrorProcessingSet.getQuestions() }
    
    
    // MARK: 06 row
    // Опционалы
    static func getQuestionsOptionals() -> [Question] { return OptionalsSet.getQuestions() }
    // Приведение типов
    static func getQuestionsTypeCasting() -> [Question] { return TypeCastingSet.getQuestions() }
    // Расширения
    static func getQuestionsExtensions() -> [Question] { return ExtensionsSet.getQuestions() }
    
    
    // MARK: 07 row
    // Вложенные типы
    static func getQuestionsNestedTypes() -> [Question] { return NestedTypesSet.getQuestions() }
    // Протоколы
    static func getQuestionsProtocols() -> [Question] { return ProtocolsSet.getQuestions() }
    // Шаблоны
    static func getQuestionsGenerics() -> [Question] { return GenericsSet.getQuestions() }
    
    
    // MARK: 08 row
    // Паттерны
    static func getQuestionsPatterns() -> [Question] { return PatternsSet.getQuestions() }
    // Алгоритмы
    static func getQuestionsAlgorithms() -> [Question] { return AlgorithmsSet.getQuestions() }
    // ARC Автоматический подсчет ссылок
    static func getQuestionsARC() -> [Question] { return ARCSet.getQuestions() }
}
