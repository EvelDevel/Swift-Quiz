//
//  CategoriesNames.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 14.11.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation

enum CategoriesName: String, CaseIterable {
    case random20 = "20 случайных вопросов"
    case random50 = "50 случайных вопросов"
    case random100 = "100 случайных вопросов"
    case deathMatch = "The Death Match"
    case allInterview = "Все вопросы собеседований"
        
    case basic = "Основы"
    case integersAndBooleans = "Числовые и логические типы"
    case basicOperators = "Базовые операторы"
    case rangeOperators = "Операторы диапазона"
    case booleanOperators = "Логические операторы"
    case stringAndCharacters = "Строки и символы"
    case collections = "Коллекции, массивы"
    case sets = "Множества"
    case dictionaries = "Словари"
    case tuples = "Кортежи"
    case controlFlow = "Управление потоком"
    case optionals = "Опциональные типы"
    case functions = "Функции"
    case closures = "Замыкания"
    case enums = "Перечисления"
    case structuresAndClasses = "Структуры и классы"
    case properties = "Свойства"
    case methods = "Методы"
    case subscripts = "Сабскрипты"
    case inheritance = "Наследование"
    case initialization = "Инициализация"
    case deinitialization = "Деинициализация"
    case errorHandling = "Обработка ошибок"
    case concurrency = "Согласованность"
    case optionalChaining = "Опциональная последовательность"
    case arc = "Автоматический подсчет ссылок"
    case typeCasting = "Приведение типов"
    case nestedTypes = "Вложенные типы"
    case extensions = "Расширения"
    case opaqueType =  "Непрозрачные типы"
    case generics = "Универсальные шаблоны"
    case protocols = "Протоколы"
    case accessControl = "Контроль доступа"
    case memorySafety = "Безопасность хранения"
    case advancedOperators = "Продвинутые операторы"
    case macros = "Макросы"
        
    case patterns = "Паттерны: Общие вопросы"
    case creationalPatterns = "Порождающие паттерны"
    case structuralPatterns = "Структурные паттерны"
    case behavioralPatterns = "Поведенческие паттерны"
    case antipatterns = "Антипаттерны"
        
    case extremeProgramming = "Extreme Programming"
    case masvs = "Мобильная безопасность"
    case multithreading = "Многопоточность"
        
    case controllerLifecycle = "View Controller Lifecycle"
    case appLifecycle = "App Lifecycle"
    case boundsAndFrame = "Bounds and Frame"
    case uiview = "UIView"
    case autoLayout = "Auto Layout"
    case dependencyInjection = "DI - Внедрение зависимостей"
    case inversionOfControl = "IoC - Инверсия управления"
    case serviceLocator = "SL - Сервис локатор"
    
    case networking = "Работа с сетью"
    
    case swiftUIEssentials = "SwiftUI Essentials"
    case swiftUIDrawing = "Drawing and Animation"
    case swiftUILayout = "App Design and Layout"
    case swiftUIFrameworks = "Framework Integration"
    
    case apns = "Apple Push Notification Service"
    case fcm = "Firebase Cloud Messaging"
    case interview = "Junior cобеседование"
    case interview2 = "Middle собеседование"
    case interview3 = "Senior собеседование"
    case rxswift = "RXSwift"
    
    case interviewIntern = "Стажер"
    case interviewJuniorPlus = "Junior +"
    case interviewMiddlePlus = "Middle +"
    case interviewSeniorPlus = "Senior +"
}
