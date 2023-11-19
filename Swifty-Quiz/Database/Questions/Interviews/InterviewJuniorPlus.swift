//
//  InterviewJuniorPlus.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 03.10.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import Foundation

final class InterviewJuniorPlus {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "Можно ли обновлять и управлять интерфейсом приложения вне главного потока?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "Иногда",
                     optionD: "",
                     id: 429020030,
                     links: [
                        "https://habr.com/ru/articles/320152/"
                     ],
                     helpText: """
                     Нет. В большинстве случаев работа с пользовательским интерфейсом (UI) в iOS приложениях должна выполняться в главном потоке, он отвечает за отрисовку интерфейса, обработку пользовательских взаимодействий и другие аспекты UI.

                     UIKit не является потокобезопасным, что означает, что изменения UI должны происходить в главном потоке. Если попытаться обновить UI в другом потоке, это может привести к непредсказуемому поведению и даже к ошибке в рантайме.

                     Если вам необходимо выполнять долгие вычисления или операции, которые могут заблокировать главный поток, вы можете использовать многопоточность, чтобы выполнить эти операции в фоновом потоке. Однако обновление UI всегда должно происходить в главном потоке.
                     """
                    ),
            
            Question(question: [
                "Ситуация, при которой два объекта ссылаются друг на друга сильными ссылками"
            ],
                     image: "",
                     optionA: "Retain cycle",
                     optionB: "Reference type",
                     optionC: "Deadlock",
                     optionD: "",
                     id: 713615594,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     Retain cycle. Цикл сильных ссылок - это когда объем выделенного пространства в памяти не может быть освобожден из-за циклов сохранения. Поскольку Swift использует автоматический подсчет ссылок (ARC), цикл сохранения происходит, когда два или более объекта содержат сильные ссылки друг на друга.

                     В результате эти объекты сохраняют друг друга в памяти, потому что их счетчик никогда не уменьшится до 0, что предотвратит вызов функции deinit и освобождение памяти.

                     Например, у нас есть класс, которому нужен делегат - weak var delegate: SomeDelegateProtocol?. Если мы укажем его сильной ссылкой, то образуется Retain Cycle. Наш класс не должен препятствовать объекту-делегату очиститься из памяти, когда его жизненный цикл закончился.
                     """
                    ),
            
            Question(question: [
                "При попытке прочитать несуществующий объект по этому типу ссылки, мы получим runtime error"
            ],
                     image: "",
                     optionA: "unowned",
                     optionB: "weak",
                     optionC: "",
                     optionD: "",
                     id: 272844365,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     unowned. При попытке прочитать несуществующий объект по unowned ссылке программа выйдет из строя с ошибкой (runtime error).

                     Четкой причины их использовать до сих пор не знают и много спорят, но все выводы уходят в легкость дебагинга.
                     """
                    ),
            
            Question(question: [
                "Что из перечисленного относится к Reference Type?"
            ],
                     image: "",
                     optionA: "Closure",
                     optionB: "Double",
                     optionC: "Struct",
                     optionD: "",
                     id: 949644911,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     Closure. К ссылочным типам относятся: Классы, функции и замыкания (closures).
                     """
                    ),
            
            Question(question: [
                "Что из перечисленного относится к Value Type?"
            ],
                     image: "",
                     optionA: "Enum",
                     optionB: "Class",
                     optionC: "Function",
                     optionD: "",
                     id: 243404298,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     Enum. К типам значения относятся базовые типы (Int, Double, String), структуры, перечисления (enum), массивы, словари и кортежи.
                     """
                    ),

            Question(question: [
                "Что из перечисленного относится к Reference Type?"
            ],
                     image: "",
                     optionA: "Function",
                     optionB: "String",
                     optionC: "Dictionary",
                     optionD: "",
                     id: 243404298,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     Function. К ссылочным типам относятся: Классы, функции и замыкания (closures).
                     """
                    ),
            
            Question(question: [
                "Что из перечисленного относится к Value Type?"
            ],
                     image: "",
                     optionA: "Tuples (Кортежи)",
                     optionB: "Functions (Функции)",
                     optionC: "",
                     optionD: "",
                     id: 957667891,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     Tuples (Кортежи). К типам значения относятся базовые типы (Int, Double, String), структуры, перечисления (enum), массивы, словари и кортежи.
                     """
                    ),
            
            Question(question: [
                "На какие типы делятся очереди (queues) в Swift?"
            ],
                     image: "",
                     optionA: "serial, concurrent",
                     optionB: "concurrent, sync",
                     optionC: "async, serial",
                     optionD: "",
                     id: 621237965,
                     links: [
                        "https://habr.com/ru/post/320152/",
                        "https://habr.com/ru/post/578752/"
                     ],
                     helpText: """
                     serial, concurrent. Serial - последовательная очередь – выполняет задачи последовательно (поочередно). До тех пор, пока задача не будет выполнена, поток не приступит к выполнения следующей задачи в очереди.

                     Concurrent - параллельная очередь – выполняет задачи параллельно. Задачи, поступающие в concurrent очередь, могут выполняться одновременно на разных потоках.
                     """
                    ),
            
            Question(question: [
                "Какой тип очереди (queue) в Swift не гарантирует, что задачи будут выполнены в строгом порядке этой очереди?"
            ],
                     image: "",
                     optionA: "Concurrent",
                     optionB: "Serial",
                     optionC: "",
                     optionD: "",
                     id: 125382274,
                     links: [
                        "https://habr.com/ru/post/320152/",
                        "https://habr.com/ru/post/578752/"
                     ],
                     helpText: """
                     Concurrent. Serial очередь обрабатывает задачи строго в порядке поступления, при этом задача всегда будет ожидать выполнения в очереди до тех пор, пока поток не освободится от выполнения предыдущей задачи.

                     Concurrent очередь не гарантирует, что задачи будут выполнены в строгом порядке очереди.
                     """
                    ),
            
            Question(question: [
                "У OperationQueue есть метод waitUntilAllOperationsAreFinished, какой аналогичный инструмент с ожиданием завершения задач есть в GSD?"
            ],
                     image: "",
                     optionA: "DispatchGroup",
                     optionB: "DispatchQueue",
                     optionC: "",
                     optionD: "",
                     id: 871980272,
                     links: [
                        "https://habr.com/ru/post/578752/#Dispatch%20group"
                     ],
                     helpText: """
                     DispatchGroup. В GCD есть DispatchGroup, который позволяет обрабатывать событие, связанное с полным завершение всех заданий.

                     У OperationQueue есть похожий механизм, это метод waitUntilAllOperationsAreFinished, но с ним нужно быть очень аккуратным потому, что он блокирует поток, на котором вызывается, до окончания выполнения всех задач.
                     """
                    ),

            Question(question: [
                "Какой из инструментов работы с многопоточностью в Swift позволяет реализовать более сложные цепочки зависимостей на разных очередях?"
            ],
                     image: "",
                     optionA: "Operations",
                     optionB: "Grand Central Dispatch",
                     optionC: "",
                     optionD: "",
                     id: 703367702,
                     links: [
                        "https://habr.com/ru/post/578752/#Dispatch%20group"
                     ],
                     helpText: """
                     Operations. Это самая сильная сторона OperationQueue. Зависимости ( dependecies) на OperationQueue могут быть более сложными, чем просто цепочки, и операции могут выполняться на разных очередях OperationQueue.

                     Все, что вы можете сделать на Grand Central Dispatch (GCD), это реализовать цепочку заданий на последовательной (serial) DispatchQueue.
                     """
                    ),
            
            Question(question: [
                "Как запускается Run Loop для главного потока в приложении?"
            ],
                     image: "",
                     optionA: "Автоматически",
                     optionB: "Вручную",
                     optionC: "",
                     optionD: "",
                     id: 992682217,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/company/otus/blog/590319/"
                     ],
                     helpText: """
                     Автоматически. Run Loop для главного потока запускается автоматически, после запуска функция main().

                     Для других потоков цикл исполнения по умолчанию не запускается.

                     Если вам нужно больше интерактивности с потоками, вы можете вручную настроить и запустить его.
                     """
                    ),
            
            Question(question: [
                "Запускаются ли отдельные Run Loop автоматически для других потоков, кроме главного?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "Только 4",
                     optionD: "",
                     id: 958458634,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/company/otus/blog/590319/"
                     ],
                     helpText: """
                     Нет. Run Loop для главного потока запускается автоматически, после запуска функция main().

                     Для других потоков цикл исполнения по умолчанию не запускается. Если вам нужно больше интерактивности с потоками, вы можете вручную настроить и запустить его.
                     """
                    ),

            Question(question: [
                "Можем ли мы вручную настраивать и запускать Run Loop не для других потоков, кроме main?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 722080406,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/company/otus/blog/590319/"
                     ],
                     helpText: """
                     Да. Run Loop для главного потока запускается автоматически, после запуска функция main().

                     Для других потоков цикл исполнения по умолчанию не запускается. Если вам нужно больше интерактивности с потоками, вы можете вручную настроить и запустить его.
                     """
                    ),
            
            Question(question: [
                "Выберите самый высокий приоритет выполнения задачи у .concurrent очереди (DispatchQueue) в GCD"
            ],
                     image: "",
                     optionA: "userInteractive",
                     optionB: "userInitiated",
                     optionC: "default",
                     optionD: "utility",
                     id: 148089657,
                     links: [
                        "https://habr.com/ru/post/578752"
                     ],
                     helpText: """
                     userInteractive. Он имеет самый высокий приоритет, и задача будет отправлена на выполнение при первой возможности.

                     А задача с background имеет самый низкий приоритет и она будет выполнена последней (не всегда, другие могут успеть встать в очередь до нее).

                     При большом количестве асинхронных задач с разными приоритетами в concurrent очереди - их очередность всегда будет непрогнозируемой.
                     """
                    ),
            
            Question(question: [
                "Объект GCD, позволяющий объединить задачи в группу и синхронизировать их поведение"
            ],
                     image: "",
                     optionA: "DispatchGroup",
                     optionB: "DispatchQueue",
                     optionC: "Operation",
                     optionD: "",
                     id: 978135201,
                     links: [
                        "https://habr.com/ru/post/578752/"
                     ],
                     helpText: """
                     DispatchGroup. Это объект, позволяющий объединить задачи в группу и синхронизировать их поведение. Группа позволяет присоединить к ней несколько задачь или DispatchWorkItem и запланировать их асинхронное выполнение на одной или нескольких очередях.

                     Когда все задачи в группе будут выполнены, группа уведомит об этом какую-либо очередь и выполнит на ней completion handler. Так же группа позволяет нам дождаться выполнения задач в группе синхронно, без использования уведомления.
                     """
                    ),
            
            Question(question: [
                "Какой метод не входит в жизненный цикл вью контроллера, но фактически вызывается после инициализации контроллера через storyboard?"
            ],
                     image: "",
                     optionA: "awakeFromNib()",
                     optionB: "loadView()",
                     optionC: "updateViewConstraints()",
                     optionD: "",
                     id: 501142371,
                     links: [
                        "https://habr.com/ru/post/654517/",
                        "https://medium.com/good-morning-swift/ios-view-controller-life-cycle-2a0f02e74ff5"
                     ],
                     helpText: "awakeFromNib(). awakeFromNib не является частью ViewController Lifecycle, ну нужно понимать что он вызывается сразу после инициализации, перед подготовкой перехода у контроллера, который задан с помощью storyboard."),
            
            Question(question: [
                "С помощью какого рекурсивного метода происходит обработка нажатия пользователя на экран??"
            ],
                     image: "",
                     optionA: "hitTest",
                     optionB: "tap",
                     optionC: "sendEvent",
                     optionD: "",
                     id: 216246348,
                     links: [
                        "https://medium.com/yandex-maps-mobile/%D0%B4%D0%B5%D1%80%D0%B6%D0%B8%D0%BC-%D1%83%D0%B4%D0%B0%D1%80-%D1%81-hittest-542653d51a8c"
                     ],
                     helpText: """
                     hitTest. Что же происходит, когда пользователь касается экрана? Для каждого нажатия система создаёт событие и передаёт его в приложение. Там оно поступает в обработку к UIApplication, который с помощью метода sendEvent: пробрасывает его дальше — в window. Задача объекта класса UIWindow — запустить процесс прохода по дереву вьюх и найти ту, которой адресован этот touch.
                     
                     Проход реализован через рекурсивный метод hitTest который для заданной view возвращает самого отдалённого наследника в иерархии её subviews (включая себя), который попадает под координаты нажатия.
                     """
                    ),
            
            Question(question: ["layoutIfNeeded() выполняется сразу же, не ожидая следующего цикла обновления. Правда ли это?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 220245804,
                     links: [
                        "https://abhimuralidharan.medium.com/ios-swift-setneedslayout-vs-layoutifneeded-vs-layoutsubviews-5a2b486da31c"
                     ],
                     helpText: "Да. Метод layoutIfNeeded сообщает системе, что вы хотите, чтобы перерисовка вью и его сабвью выполнялись немедленно, не дожидаясь следующего цикла обновления. Когда вызов этого метода завершен, макет уже настроен и отрисован на основе всех изменений, которые были отмечены вами до вызова метода."),
            
            Question(question: ["Этот метод сообщает системе, что вы хотите, чтобы перерисовка вью и его сабвью выполнялись немедленно, не дожидаясь следующего цикла обновления"],
                     image: "",
                     optionA: "layoutIfNeeded()",
                     optionB: "setNeedsLayout()",
                     optionC: "",
                     optionD: "",
                     id: 905010494,
                     links: [
                        "https://abhimuralidharan.medium.com/ios-swift-setneedslayout-vs-layoutifneeded-vs-layoutsubviews-5a2b486da31c"
                     ],
                     helpText: "layoutIfNeeded(). Метод layoutIfNeeded сообщает системе, что вы хотите, чтобы перерисовка вью и его сабвью выполнялись немедленно, не дожидаясь следующего цикла обновления."),
            
            Question(question: ["Этот метод записывает запрос на обновление вью и сразу же возвращается, не вызывая немедленное обновление"],
                     image: "",
                     optionA: "setNeedsLayout()",
                     optionB: "layoutIfNeeded()",
                     optionC: "",
                     optionD: "",
                     id: 209542147,
                     links: [
                        "https://abhimuralidharan.medium.com/ios-swift-setneedslayout-vs-layoutifneeded-vs-layoutsubviews-5a2b486da31c"
                     ],
                     helpText: "setNeedsLayout(). Метод setNeedsLayout записывает запрос на обновление вью и сразу же возвращается, не вызывая немедленное обновление."),
            
            Question(question: [
                "Какие типы очередей бывают в Grand Central Dispatch?"
            ],
                     image: "",
                     optionA: "serial, concurrent",
                     optionB: "main, global",
                     optionC: "serial, main",
                     optionD: "",
                     id: 933783838,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     serial, concurrent. serial (последовательная) – выполняет задачи последовательно (поочередно). До тех пор, пока задача не будет выполнена, поток не приступит к выполнения следующей задачи в очереди.
                     
                     concurrent (параллельная) – выполняет задачи параллельно. Задачи, поступающие в concurrent очередь, могут выполняться одновременно на разных потоках.
                     """
                    ),
            
            Question(question: [
                "Какая очередь GСD на изображении?"
            ],
                     image: "Multithreading13",
                     optionA: "concurrent",
                     optionB: "serial",
                     optionC: "",
                     optionD: "",
                     id: 909387318,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     concurrent. Параллельная очередь не гарантирует, что задачи будут выполнены в строгом порядке очереди. Таким образом, к примеру, Task 6 начнет свое выполнение не дождавшись выполнения Task 4.
                     """
                    ),
            
            Question(question: [
                "Какая очередь GСD на изображении?"
            ],
                     image: "Multithreading14",
                     optionA: "serial",
                     optionB: "concurrent",
                     optionC: "",
                     optionD: "",
                     id: 306757233,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     serial. Serial очередь обрабатывает задачи строго в порядке поступления, при этом задача всегда будет ожидать выполнения в очереди до тех пор, пока поток не освободится от выполнения предыдущей задачи.
                     """
                    ),
            
            Question(question: [
                "Поддерживает ли Swift множественное наследование классов?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "Иногда",
                     optionD: "",
                     id: 830246114,
                     links: [
                        "https://swiftbook.ru/content/languageguide/inheritance/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/inheritance/"
                     ],
                     helpText: """
                     Нет. Swift не позволяет множественное наследование классов, то есть класс не может наследовать сразу от нескольких других классов.
                     
                     Это было сделано в целях уменьшения сложности кода, устранения путаницы и разрешения конфликтов, которые могут возникнуть при множественном наследовании.

                     Вместо множественного наследования Swift предоставляет протоколы, которые могут быть реализованы классами, структурами или перечислениями. Класс может наследовать только один базовый класс, но при этом он может реализовать несколько протоколов.
                     
                     Протоколы позволяют создавать гибкую иерархию функциональности, не ограничивая себя ограничениями множественного наследования.
                     """
                    ),
            
            Question(question: [
                "У какого типа замыканий более долгое время жизни?"
            ],
                     image: "",
                     optionA: "Escaping",
                     optionB: "Non-escaping",
                     optionC: "",
                     optionD: "",
                     id: 341634589,
                     links: [
                        "https://swiftbook.ru/post/tutorials/escaping-in-closures-in-swift/",
                        "https://www.geeksforgeeks.org/escaping-and-non-escaping-closures-in-swift/",
                        "https://medium.com/swiftcommmunity/what-do-mean-escaping-and-nonescaping-closures-in-swift-d404d721f39d"
                     ],
                     helpText: """
                     Escaping. Escaping замыкания имеют долгое время жизни. Они могут сохраняться и использоваться после завершения выполнения функции, в которую они были переданы.

                     Non-escaping замыкания имеют короткое время жизни. Они могут использоваться только внутри функции и не сохраняются после ее завершения.
                     """
                    ),
            
            Question(question: [
                "Если замыкание должно быть выполнено асинхронно, после завершения функции (при работе с сетевыми запросами или анимациями), какой тип мы будем использовать?"
            ],
                     image: "",
                     optionA: "Escaping",
                     optionB: "Non-escaping",
                     optionC: "",
                     optionD: "",
                     id: 867454757,
                     links: [
                        "https://swiftbook.ru/post/tutorials/escaping-in-closures-in-swift/",
                        "https://www.geeksforgeeks.org/escaping-and-non-escaping-closures-in-swift/",
                        "https://medium.com/swiftcommmunity/what-do-mean-escaping-and-nonescaping-closures-in-swift-d404d721f39d"
                     ],
                     helpText: """
                     Escaping. Escaping замыкания часто используются, когда замыкание должно быть выполнено асинхронно, после завершения функции, например, при работе с сетевыми запросами или анимациями.
                     
                     Non-escaping замыкание используется, когда оно выполняется синхронно внутри функции и не нужно сохранять его для будущего использования.
                     """
                    ),
            
            Question(question: [
                "Может ли протокол наследовать множество других протоколов?",
                "Может ли протокол наследовать один или более других протоколов?",
                "Может ли протокол добавлять требования сверх тех требований протоколов, которые он наследует?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 742403311,
                     links: [
                        "https://swiftbook.ru/content/languageguide/protocols/",
                        "https://habr.com/ru/articles/593797/"
                     ],
                     helpText: """
                     Да. Протокол может наследовать один или более других протоколов и может добавлять требования поверх тех требований протоколов, которые он наследует.
                     
                     Синтаксис наследования протокола аналогичен синтаксису наследования класса, но с возможностью наследовать сразу несколько протоколов, которые разделяются между собой запятыми.
                     """),
            
            Question(question: [
                "Может ли структура в Swift наследоваться от другой структуры?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 216145813,
                     links: [
                        "https://swiftbook.ru/content/languageguide/inheritance/"
                     ],
                     helpText: """
                     Нет. Структуры в Swift не могут наследоваться.
                     
                     Это означает, что структура не может быть подклассом другой структуры, класса или протокола.
                     """),
            
            Question(question: [
                "Может ли структура в Swift наследоваться от класса?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 871644447,
                     links: [
                        "https://swiftbook.ru/content/languageguide/inheritance/"
                     ],
                     helpText: """
                     Нет. Структуры в Swift не могут наследоваться.
                     
                     Это означает, что структура не может быть подклассом другой структуры, класса или протокола.
                     """),
            
            Question(question: [
                "Может ли структура в Swift наследоваться от протокола?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 389748537,
                     links: [
                        "https://swiftbook.ru/content/languageguide/inheritance/"
                     ],
                     helpText: """
                     Нет. Структуры в Swift не могут наследоваться.
                     
                     Это означает, что структура не может быть подклассом другой структуры, класса или протокола.
                     """),
            
            Question(question: [
                "Может ли класс в Swift наследоваться от другого класса?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 178146294,
                     links: [
                        "https://swiftbook.ru/content/languageguide/inheritance/"
                     ],
                     helpText: """
                     Да. Классы в Swift могут наследоваться от других классов.
                     
                     Это позволяет создавать иерархии классов, где подклассы наследуют свойства и методы родительских классов.
                     
                     Однако, множественное наследование классов в Swift не поддерживается, что означает, что класс может иметь только один родительский класс.
                     """),
            
            Question(question: [
                "Может ли класс в Swift наследоваться от нескольких классов?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 880786703,
                     links: [
                        "https://swiftbook.ru/content/languageguide/inheritance/"
                     ],
                     helpText: """
                     Нет. Множественное наследование классов в Swift не поддерживается, что означает, что класс может иметь только один родительский класс.
                     """),
            
            Question(question: [
                "Может ли класс в Swift наследоваться от нескольких протоколов?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 703880696,
                     links: [
                        "https://swiftbook.ru/content/languageguide/inheritance/"
                     ],
                     helpText: """
                     Да. Класс поддерживает множественное наследование от протоколов.
                     
                     Это означает, что класс может подписываться на несколько протоколов одновременно, что дает ему возможность использовать функциональность всех этих протоколов.
                     """),
            
            Question(question: [
                "Может ли let быть помечен как weak?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "Зависит от случая",
                     optionD: "",
                     id: 965266879,
                     links: [
                        "https://habr.com/ru/articles/444336/"
                     ],
                     helpText: """
                     Нет. В Swift ключевое слово weak используется только с переменными, объявленными как опциональные (Optional). Использование weak означает, что переменная должна быть объявлена как var и может быть опциональной, так как она автоматически устанавливается в nil, когда соответствующий объект уничтожается.
                     
                     Использование let означает, что переменная не может быть изменена после присвоения значения. Поэтому использование weak с let недопустимо в Swift.
                     """
                    ),
            
            Question(question: [
                "Какой метод жизненного цикла View Controller мы можем использовать для того, чтобы установить view программно, без использования Interface Builder?"
            ],
                     image: "",
                     optionA: "loadView",
                     optionB: "viewDidLoad",
                     optionC: "viewDidAppear",
                     optionD: "",
                     id: 397230803,
                     links: [
                        "https://habr.com/ru/articles/654517/",
                        "https://sparrowcode.io/ru/tutorials/uiviewcontroller-lifecycle"
                     ],
                     helpText: """
                     loadView. Вам следует переопределить loadView, если вы хотите создать свой собственный пользовательский интерфейс программно без использования Interface Builder.
                     
                     Вы должны создать и назначить view для вашего ViewController таким образом:
                     
                     override func loadView() {
                         super.loadView()
                         self.view = UIView()
                     }
                     """
                    ),
            
            Question(question: [
                "Самый ранний метод жизненного цикла View Controller, на котором уже известны корректные размеры его вью"
            ],
                     image: "",
                     optionA: "viewWillAppear",
                     optionB: "viewDidLayoutSubviews",
                     optionC: "viewDidAppear",
                     optionD: "",
                     id: 450205877,
                     links: [
                        "https://habr.com/ru/articles/654517/",
                        "https://sparrowcode.io/ru/tutorials/uiviewcontroller-lifecycle"
                     ],
                     helpText: """
                     viewWillAppear. Самый ранний метод жизненного цикла вью контроллера, в котором известны корректные размеры его вью, это viewWillAppear.
                     
                     В этом методе вы можете уверенно использовать размеры вью для размещения и настройки элементов интерфейса пользователя.
                     
                     В этот момент вью контроллер готов к отображению, и его размеры уже соответствуют окончательному размеру, который будет отображаться на экране.
                     """
                    ),
        ]
    }
}
