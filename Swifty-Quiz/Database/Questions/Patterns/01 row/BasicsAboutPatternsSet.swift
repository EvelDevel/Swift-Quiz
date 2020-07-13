
//  Created by Евгений Никитин on 13.07.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class BasicsAboutPatternsSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: ["Привязаны ли паттерны проектирования к определенному языку программирования?",
                                "Паттерны привязаны к определенному языку программирования?",
                                "Паттерны проектирования привязаны к конкретному языку программирования, так ли это?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 2501,
                     helpText: "Паттерны проектирования не привязаны к конкретному языку программирования. В некоторых областях находят более широкое применение одни паттерны и почти не используются остальные, в других направлениях картина может отличаться. Во многих современных языках программирования предусмотрены упрощенные синтаксические конструкции, позволяющие легко использовать некоторые паттерны. В Swift немало такого синтаксического сахара."),
            
            Question(question: ["Что лежит в основе порождающих паттернов?"],
                     image: "",
                     optionA: "Создание объектов",
                     optionB: "Управление поведением",
                     optionC: "Структурирование кода",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 2502,
                     helpText: "В основе порождающих паттернов всегда лежит создание объектов."),
            
            Question(question: ["Какой паттерн является одним из самых часто применяемых в iOS разработке?",
                                "Один из самых популярных паттернов в iOS разработке",
                                "Этот паттерн может по праву называться одним из самых популярных в iOS разработке?"],
                     image: "",
                     optionA: "Delegate",
                     optionB: "Flyweight",
                     optionC: "Adapter",
                     optionD: "Abstract Factory",
                     correctAnswer: 1,
                     questionId: 2507,
                     helpText: "Паттерн Delegate - один из самых часто применяемых паттернов в iOS разработке."),
            
            Question(question: ["У какого паттерна, один объект, для выполнения действий, передает управление другому объекту?",
                                "Паттерн, при котором один объект делигирует часть обязанностей другому объекту?",
                                "Какой паттерн является паттерном делегирования определенных действий или части обязанностей?"],
                     image: "",
                     optionA: "Delegate",
                     optionB: "Proxy",
                     optionC: "Adapter",
                     optionD: "Strategy",
                     correctAnswer: 1,
                     questionId: 2508,
                     helpText: "Один из самых часто применяемых паттернов в iOS разработке - Делегат (Delegate). Суть его в том, что один объект для выполнения определенных действий передает управление другому объекту - делегирует ему некоторую часть обязанностей."),
            
            Question(question: ["Что является основой поведенческих паттернов?"],
                     image: "",
                     optionA: "Управление поведением",
                     optionB: "Создание объектов",
                     optionC: "Структурирование кода",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 2504,
                     helpText: "Поведенческие паттерны являются самой большой категорией, сюда входят все паттерны, которые так или иначе определяют поведение объектов и их взаимодействие друг с другом."),
            
            Question(question: ["Что лежит в основе структурных паттернов?"],
                     image: "",
                     optionA: "Структурирование кода",
                     optionB: "Управление поведением",
                     optionC: "Создание объектов",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 2503,
                     helpText: "Структурные паттерны позволяют лучше структурировать код, чтобы его было легче понимать."),
            
            Question(question: ["Какой паттерн часто применяют для того, чтобы прокинуть данные с одного экрана на другой?",
                                "Чтобы пробросить данные с одного контроллера на другой, применяют этот паттерн",
                                "В iOS разработке этот паттерн часто применяют для того, чтобы прокинуть данные с одного экрана на другой"],
                     image: "",
                     optionA: "Делегат",
                     optionB: "Адаптер",
                     optionC: "Прототип / Клон",
                     optionD: "Снимок",
                     correctAnswer: 1,
                     questionId: 2513,
                     helpText: "В iOS-разработке паттерн delegate часто применяют, чтобы прокинуть данные с одного экрана на другой. Например, мы находимся на экране, который отображает дату рождения; затем переходим на экран, где их можно изменить, делаем это и возвращаемся — данные на первом экране должны обновиться."),
            
            Question(question: ["Используются ли паттерны в нативных библиотеках Apple?",
                                "Используют ли Apple паттерны проектирования внутри своих нативных библиотек?",
                                "Apple использует паттерны Delegate и Singleton в своих нативных библиотеках, так ли это?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 2529,
                     helpText: "Как и делегат, синглтон часто используется в нативных библиотеках Apple. UIApplication.shared предоставляет доступ к экземпляру приложения. Этот объект всегда один в приложении. У приложения есть делегат, и он всегда один. Это как раз тот класс, который всегда по дефолту добавляется под именем AppDelegate при создании нового проекта в XCode. Обратиться к нему можно с помощью UIApplication.shared.delegate. FileManager.default предоставляет доступ к объекту-синглтону, с помощью которого можно управлять файловой системой. Можно, например, сохранить данные на диск, создать файлы и папки внутри sandbox-приложения. UserDefault.standard — объект-синглтон хранилища данных, которое можно использовать для сохранения простых  данных на диск."),
            
            Question(question: ["К какому паттерну относится данный признак: большая часть ответственности разделена между Presenter и Model, а View ничего не делает?",
                                "К какому паттерну относится данный признак: отличная тестируемость, мы можем проверить большую часть бизнес-логики благодаря бездействию View?"],
                     image: "",
                     optionA: "MVP",
                     optionB: "MVC",
                     optionC: "MVVM",
                     optionD: "Viper",
                     correctAnswer: 1,
                     questionId: 2701,
                     helpText: "Давайте посмотрим на признаки хорошей архитектуры для MVP: распределение: большая часть ответственности разделена между Presenter и Model, а View ничего не делает; тестируемость: отличная, мы можем проверить большую часть бизнес-логики благодаря бездействию View; простота использования: в нашем нереально простом примере количество кода в два раза больше по сравнению с MVC, но в то же время идея MVP очень проста."),
        ]
    }
}
