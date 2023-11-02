//
//  Interview.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 20.01.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import Foundation

final class InterviewSenior {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "deinit() вызывается на потоке, на котором счетчик ссылок стал равен нулю. Так ли это?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 865006077,
                     helpText: """
                     Да. deinit вызывается на том потоке, на котором счетчик ссылок стал равен нулю (была удалена последняя ссылка).
                     """
                    ),
            
            Question(question: [
                "Сколько типов очередей с разными приоритетами существует в GCD?"
            ],
                     image: "",
                     optionA: "Шесть",
                     optionB: "Одна",
                     optionC: "Три",
                     optionD: "",
                     id: 357472566,
                     links: [
                        "https://habr.com/ru/post/578752/",
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     Шесть. По-умолчанию существует 6 очередей:

                     DispatchQueue.main - Главная очередь (последовательная), в которой происходят все операции с пользовательским интерфейсом

                     DispatchQueue.global(qos: .userInteractive) - фоновая (паралельная), самый высокий приоритет

                     DispatchQueue.global(qos: .userInitiated) - фоновая (паралельная), приоритет чуть ниже

                     DispatchQueue.global(qos: .utility) - фоновая (паралельная), приоритет еще ниже

                     DispatchQueue.global(qos: .background) - фоновая (паралельная), самый низкий приоритет

                     DispatchQueue.global() - фоновая (паралельная), приоритет по-умолчанию, говорят, что где-то между .userInitiated и .utility.
                     """
                    ),
            
            Question(question: [
                "Что мы получим в консоль?"
            ],
                     image: "Closures05",
                     optionA: "5, 10",
                     optionB: "5, 5",
                     optionC: "Получим ошибку",
                     optionD: "",
                     id: 876333566,
                     links: [
                        "https://swiftbook.ru/content/languageguide/closures/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/"
                     ],
                     helpText: """
                     5, 10. Мы создаем параметр типа Int и выводим его значение на консоль с помощью замыкания.
                     
                     Int — это структура (value type), значение которого должно передаваться копированием. Но при этом замыкание всегда выводит актуальное значение параметра.
                     
                     Это говорит о том, что внутри замыкания используется не копия параметра a, а ссылка на него.
                     
                     Это пример того, как значимый тип данных может быть передан по ссылке, замыкания всегда захватывают значения по ссылке, а не копированием, даже value type.
                     """
                    ),
            
            Question(question: [
                "Выберите, что из перечисленного инициализируется атомарно?"
            ],
                     image: "",
                     optionA: "Глобальные переменные",
                     optionB: "Ленивые свойства",
                     optionC: "",
                     optionD: "",
                     id: 469419995,
                     helpText: """
                     Глобальные переменные. Они инициализируются атомарно (Атомарная операция — операция, которая либо выполняется целиком, либо не выполняется вовсе), нам никогда не потребуется обрабатывать вручную случай, когда несколько потоков пытаются инициализировать одну и ту же глобальную переменную одновременно или беспокоиться о том, что кто-то может увидеть частично инициализированную переменную, пока инициализация все еще продолжается.
                     
                     Но важно помнить, что ленивая инициализация свойств не выполняется атомарно, и Swift на данный момент не предоставляет аннотаций или модификаторов для изменения этого поведения.
                     """),
            
            Question(question: [
                "Можем ли мы явно объявлять свойство типа (static var) как lazy?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 425140046,
                     links: [
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/",
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://www.youtube.com/watch?v=Pe_rqOg1IwY"
                     ],
                     helpText: """
                     Нет. Свойства типа отложено инициализируются при первом обращении к ним (уже является lazy).
                     
                     Они гарантировано инициализируются только один раз, даже если они доступны сразу для нескольких потоков.
                     
                     Если вы явно укажете lazy static var, получите ошибку:
                     - "'lazy' cannot be used on a computed property" (при попытке присвоить вычисляемому свойству)
                     - "'lazy' cannot be used on an already-lazy global" (при попытке присвоить хранимому свойству).
                     """
                    ),
            
            Question(question: [
                "Какое ключевое слово используется для вычисляемых свойств класса, вместо static, когда мы хотим разрешать подклассам переопределение?"
            ],
                     image: "",
                     optionA: "class",
                     optionB: "struct",
                     optionC: "public",
                     optionD: "",
                     id: 843572179,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/#Type-Property-Syntax"
                     ],
                     helpText: """
                     class. Для вычисляемых свойств самого класса, вы должны использовать ключевое слово class, чтобы разрешать подклассам переопределение.
                     
                     class SomeClass {
                         class var someProperty: Int {
                             return 107
                         }
                     }
                     """),
            
            Question(question: [
                "Что мы получим в консоль после запуска кода?"
            ],
                     image: "Interview03",
                     optionA: "[0, 1] [0, 1]",
                     optionB: "[0] [0, 1]",
                     optionC: "[0, 1] [0]",
                     optionD: "",
                     id: 329364278,
                     links: [
                        "https://developer.apple.com/documentation/foundation/nsmutablearray",
                        "https://stackoverflow.com/questions/25169389/normal-array-in-swift-vs-nsmutablearray"
                     ],
                     helpText: """
                     [0, 1] [0, 1]. В нашем коде используется NSMutableArray, который принадлежит Objective-C, а не нативные Swift-массивы.
                     
                     Swift и Objective-C имеют разные подходы к управлению памятью и копированию данных (массив в Objective-C это класс, массив в Swift это структура).
                     
                     В этом случае, массив b будет иметь ссылку на тот же объект NSMutableArray, что и массив a. Когда вы добавляете элемент в массив b с помощью метода add(), он будет отображаться в массиве a, и так как оба массива ссылаются на один и тот же объект - мы получим одинаковый результат. 
                     """
                    ),
            
            Question(question: [
                "Что мы получим в консоль?"
            ],
                     image: "Interview15",
                     optionA: "1, 1",
                     optionB: "1, 2",
                     optionC: "2, 2",
                     optionD: "",
                     id: 499105436,
                     links: [
                        "https://swiftbook.org/docs/1494/",
                        "https://swiftbook.org/docs/1512/"
                     ],
                     helpText: """
                     1, 1. В данном случае view была захвачена как константа в замыкании при использовании списка захвата ([view] in).
                     
                     Это означает, что view в замыкании становится неизменяемой копией переменной view, которая существовала на момент определения замыкания.
                     
                     Поэтому изменения, внесенные в исходную переменную view позже в коде, не отразятся на захваченном значении в замыкании showTag.
                     """
                    ),
        ]
    }
}
