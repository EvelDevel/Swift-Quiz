
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.


import Foundation

class TopicOperator {
    
    // MARK: THE BASICS
    
    // MARK: 01 row
    // Основы, Операторы, Строки и символы
    static func getQuestionsTheBasics() -> [Question] { return TheBasicsSet.getQuestions() }
    static func getQuestionsBasicOperators() -> [Question] { return BasicOperatorsSet.getQuestions() }
    static func getQuestionsStringAndCharacters() -> [Question] { return StringAndCharactersSet.getQuestions() }
    
    // MARK: 02 row
    // Коллекции, Управление потоком
    static func getQuestionsCollectionTypes() -> [Question] { return CollectionTypesSet.getQuestions() }
    static func getQuestionsControlFlow() -> [Question] { return ControlFlowSet.getQuestions() }
    
    // MARK: 03 row
    // Функции, Замыкания, Перечисления
    static func getQuestionsFunctions() -> [Question] { return FunctionsSet.getQuestions() }
    static func getQuestionsClosures() -> [Question] { return ClosuresSet.getQuestions() }
    static func getQuestionsEnums() -> [Question] { return EnumerationsSet.getQuestions() }
    
    // MARK: 04 row
    // Структуры и классы, Свойства, Методы
    static func getQuestionsStructuresAndClasses() -> [Question] { return StructuresAndClassesSet.getQuestions() }
    static func getQuestionsProperties() -> [Question] { return PropertiesSet.getQuestions() }
    static func getQuestionsMethods() -> [Question] { return MethodsSet.getQuestions() }
    
    // MARK: 05 row
    // Сабскрипты, Наследование, Инициализация
    static func getQuestionsSubscripts() -> [Question] { return SubscriptsSet.getQuestions() }
    static func getQuestionsInheritance() -> [Question] { return InheritanceSet.getQuestions() }
    static func getQuestionsInitialization() -> [Question] { return InitializationSet.getQuestions() }
    
    // MARK: 06 row
    // Деинициализация, Обработка ошибок
    static func getQuestionsDeinitialization() -> [Question] { return DeinitializationSet.getQuestions() }
    static func getQuestionsErrorHandling() -> [Question] { return ErrorHandlingSet.getQuestions() }
    
    // MARK: 07 row
    // Опциональное связывание, ARC - Автоматический подсчет ссылок
    static func getQuestionsOptionalChaining() -> [Question] { return OptionalChainingSet.getQuestions() }
    static func getQuestionsARC() -> [Question] { return ARCSet.getQuestions() }
    
    // MARK: 08 row
    // Приведение типов, Вложенные типы, Расширения
    static func getQuestionsTypeCasting() -> [Question] { return TypeCastingSet.getQuestions() }
    static func getQuestionsNestedTypes() -> [Question] { return NestedTypesSet.getQuestions() }
    static func getQuestionsExtensions() -> [Question] { return ExtensionsSet.getQuestions() }
    
    // MARK: 09 row
    // Шаблоны, Протоколы
    static func getQuestionsGenerics() -> [Question] { return GenericsSet.getQuestions() }
    static func getQuestionsProtocols() -> [Question] { return ProtocolsSet.getQuestions() }
    
    // MARK: 10 row
    // Контроль доступа, Безопасность хранения
    static func getQuestionsAccessControl() -> [Question] { return AccessControlSet.getQuestions() }
    static func getQuestionsMemorySafety() -> [Question] { return MemorySafetySet.getQuestions() }
    
    // MARK: 11 row
    // Продвинутые операторы
    static func getQuestionsAdvancedOperators() -> [Question] { return AdvancedOperatorsSet.getQuestions() }
    
    
    // MARK: PATTERNS
    
    // MARK: 01 row
    // Фабричный метод, Абстрактная фабрика
    static func getQuestionsBasicPatterns() -> [Question] { return BasicPatternsSet.getQuestions() }  
    static func getQuestionsAdvancedPatterns() -> [Question] { return AdvancedPatternsSet.getQuestions() }
    
    // MARK: 02 row
    // Строитель, Прототип, Одиночка
    static func getQuestionsArchitecturalPatterns() -> [Question] { return ArchitecturalPatternsSet.getQuestions() }
    static func getQuestionsAntipatterns() -> [Question] { return AntipatternsSet.getQuestions() }
}
