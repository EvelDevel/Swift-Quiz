
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.


import Foundation

class TopicOperator {
    
    // MARK: 01 row
    
    // Основы
    static func getQuestionsTheBasics() -> [Question] { return TheBasicsSet.getQuestions() }
    // Операторы
    static func getQuestionsBasicOperators() -> [Question] { return BasicOperatorsSet.getQuestions() }
    // Строки и символы
    static func getQuestionsStringAndCharacters() -> [Question] { return StringAndCharactersSet.getQuestions() }
    
    
    // MARK: 02 row
    
    // Коллекции
    static func getQuestionsCollectionTypes() -> [Question] { return CollectionTypesSet.getQuestions() }
    // Управление потоком
    static func getQuestionsControlFlow() -> [Question] { return ControlFlowSet.getQuestions() }
    
    
    // MARK: 03 row
    
    // Функции
    static func getQuestionsFunctions() -> [Question] { return FunctionsSet.getQuestions() }
    // Замыкания
    static func getQuestionsClosures() -> [Question] { return ClosuresSet.getQuestions() }
    // Перечисления
    static func getQuestionsEnums() -> [Question] { return EnumerationsSet.getQuestions() }
    
    
    // MARK: 04 row
    
    // Структуры и классы
    static func getQuestionsStructuresAndClasses() -> [Question] { return StructuresAndClassesSet.getQuestions() }
    // Свойства
    static func getQuestionsProperties() -> [Question] { return PropertiesSet.getQuestions() }
    // Методы
    static func getQuestionsMethods() -> [Question] { return MethodsSet.getQuestions() }
    
    
    // MARK: 05 row
    
    // Сабскрипты
    static func getQuestionsSubscripts() -> [Question] { return SubscriptsSet.getQuestions() }
    // Наследование
    static func getQuestionsInheritance() -> [Question] { return InheritanceSet.getQuestions() }
    // Инициализация
    static func getQuestionsInitialization() -> [Question] { return InitializationSet.getQuestions() }
    
    
    // MARK: 06 row
    
    // Деинициализация
    static func getQuestionsDeinitialization() -> [Question] { return DeinitializationSet.getQuestions() }
    // Обработка ошибок
    static func getQuestionsErrorHandling() -> [Question] { return ErrorHandlingSet.getQuestions() }
    
    
    // MARK: 07 row
    
    // Опционалы
    static func getQuestionsOptionalChaining() -> [Question] { return OptionalChainingSet.getQuestions() }
    // ARC - Автоматический подсчет ссылок
    static func getQuestionsARC() -> [Question] { return ARCSet.getQuestions() }
    
    
    // MARK: 08 row
    
    // Приведение типов
    static func getQuestionsTypeCasting() -> [Question] { return TypeCastingSet.getQuestions() }
    // Вложенные типы
    static func getQuestionsNestedTypes() -> [Question] { return NestedTypesSet.getQuestions() }
    // Расширения
    static func getQuestionsExtensions() -> [Question] { return ExtensionsSet.getQuestions() }
    
    
     // MARK: 09 row
    
    // Шаблоны
    static func getQuestionsGenerics() -> [Question] { return GenericsSet.getQuestions() }
    // Протоколы
    static func getQuestionsProtocols() -> [Question] { return ProtocolsSet.getQuestions() }
    
    
    // MARK: 10 row
    
    // Контроль доступа
    static func getQuestionsAccessControl() -> [Question] { return AccessControlSet.getQuestions() }
    // Безопасность хранения
    static func getQuestionsMemorySafety() -> [Question] { return MemorySafetySet.getQuestions() }
    
    
    // MARK: 11 row
    
    // Продвинутые операторы
    static func getQuestionsAdvancedOperators() -> [Question] { return AdvancedOperatorsSet.getQuestions() }
}
