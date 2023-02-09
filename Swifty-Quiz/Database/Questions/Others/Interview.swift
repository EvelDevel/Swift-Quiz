//
//  Interview.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 20.01.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import Foundation

class Interview {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "С помощью чего происходит управление памятью в Swift?"
            ],
                     image: "",
                     optionA: "ARC",
                     optionB: "MRC",
                     optionC: "Вручную",
                     optionD: "",
                     questionId: 342790056,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/#:~:text=Swift%20%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D1%83%D0%B5%D1%82%20automatic%20reference%20counting,%D0%B4%D1%83%D0%BC%D0%B0%D1%82%D1%8C%20%D0%BE%20%D1%81%D0%B0%D0%BC%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D0%BC%20%D1%83%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B8%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D1%8C%D1%8E."
                     ],
                     helpText: """
                     ARC. Swift использует automatic reference counting (автоматический подсчет ссылок) для отслеживания и управления памятью вашего приложения. В большинстве случаев это означает, что управление памятью "просто работает" в Swift и вам не нужно думать о самостоятельном управлении.
                     
                     ARC автоматически освобождает память, которая использовалась экземплярами класса, когда эти экземпляры больше нам не нужны (на экземпляр нет сильных ссылок).
                     """
                    ),
            
            Question(question: [
                "Какими типами ссылок мы можем ссылаться на объект в Swift?"
            ],
                     image: "",
                     optionA: "Strong, weak, unowned",
                     optionB: "strong, unowned",
                     optionC: "direct, weak, strong",
                     optionD: "",
                     questionId: 678255779,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     Сильной или слабой. В основе механизма работы с памятью лежит система подсчёта ссылок на объекты (ARC).
                     На объект можно ссылаться сильной (strong) или слабой (weak) ссылкой.
                     
                     Сильные ссылки держат объект и препятствуют его очистке из памяти. Как только количество сильных ссылок станет равным нулю - объект будет очищен из памяти. Таким образом разработчику не требуется управлять всем вручную, но важно корректно расставлять типы ссылок.
                     """
                    ),
            
            Question(question: [
                "При каком количестве сильных ссылок в Swift, объект будет очищен из памяти?"
            ],
                     image: "",
                     optionA: "0",
                     optionB: "1",
                     optionC: "Не имеет значения",
                     optionD: "",
                     questionId: 537225677,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     0. Сильные ссылки держат объект и препятствуют его очистке из памяти. Как только количество сильных ссылок станет равным нулю - объект будет очищен из памяти. Таким образом разработчику не требуется управлять всем вручную, но важно корректно расставлять типы ссылок.
                     
                     Для корректного подсчёта этих ссылок существуют ARC (Automatic Reference Counter) и MRC (Manual Reference Counter). Как можно понять из названия, один из них считает ссылки автоматически, другой - в ручную.
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
                     questionId: 713615594,
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
                "Область памяти, для которой свойственно статическое выделение, которое происходит только во время компиляции"
            ],
                     image: "",
                     optionA: "Стек",
                     optionB: "Куча",
                     optionC: "",
                     optionD: "",
                     questionId: 486217799,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     Стек. Область памяти, для которой свойственно статическое выделение памяти, которое происходит только во время компиляции.
                     
                     Переменные, выделенные в стеке, хранятся непосредственно в памяти, и доступ к этой памяти очень быстрый, и ее выделение определяется при компиляции программы. Он организован по принципу «последним пришёл — первым вышел» (LIFO).
                     
                     Существует ограничение в том, что данные, которые предполагается хранить в стеке, обязаны быть конечными и статичными — их размер должен быть известен ещё на этапе компиляции. Каждый поток многопоточного приложения имеет доступ к своему собственному стеку.
                     """
                    ),
            
            Question(question: [
                "Область памяти, для которой свойственно динамическое выделение, которое происходит во время выполнения"
            ],
                     image: "",
                     optionA: "Куча",
                     optionB: "Стек",
                     optionC: "",
                     optionD: "",
                     questionId: 607469139,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     Куча. Используется для динамического выделения памяти, однако, в отличие от стека, данные в куче первым делом требуется найти с помощью «оглавления». Можно представить, что куча это такая большая многоуровневая библиотека, в которой, следуя определённым инструкциям, можно найти необходимую книгу.
                     
                     Операции на куче производятся несколько медленнее, чем на стеке, так как требуют дополнительного этапа для поиска данных. В куче хранятся данные динамических размеров, например, список, в который можно добавлять произвольное количество элементов. Куча общая для всех потоков приложения.
                     
                     Вследствие динамической природы, куча нетривиальна в управлении и с ней возникает большинство всех проблем и ошибок, связанных с памятью. Способы решения этих проблем предоставляются языками программирования.
                     """
                    ),
            
            Question(question: [
                "Цель этого типа ссылок - хранить объект живым"
            ],
                     image: "",
                     optionA: "strong",
                     optionB: "weak",
                     optionC: "unowned",
                     optionD: "",
                     questionId: 419647432,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     strong. Цель сильной (strong) ссылки - сохранить объект в живых.
                     
                     Сильные ссылки могут привести к нескольким нетривиальным проблемам:
                     - Retain cycles (о нем говорили выше)
                     - Не всегда возможно сделать сильные ссылки действительными сразу при создании объекта, например с делегатами.
                     """
                    ),
            
            Question(question: [
                "Если на объект указывает этот тип ссылки, он может быть обнулен"
            ],
                     image: "",
                     optionA: "weak",
                     optionB: "strong",
                     optionC: "",
                     optionD: "",
                     questionId: 803856401,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     weak. Объект может быть уничтожен, если на него указывают слабые ссылки.
                     
                     Слабая ссылка возвращает nil, когда объект, на который она указывает, больше не жив. Это называется обнулением.
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
                     questionId: 272844365,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     unowned. При попытке прочитать несуществующий объект по unowned ссылке программа выйдет из строя с ошибкой (runtime error).
                     
                     Четкой причины их использовать до сих пор не знают и много спорят, но все выводы уходят в легкость дебагинга.
                     """
                    ),
            
            Question(question: [
                "При использовании какого типа ссылок создается Side Table?"
            ],
                     image: "",
                     optionA: "weak",
                     optionB: "strong",
                     optionC: "",
                     optionD: "",
                     questionId: 997363445,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     weak. Обычно объекты не имеют слабых ссылок, поэтому резервировать место для подсчета слабых ссылок в каждом объекте нецелесообразно. Эта информация хранится извне в дополнительных таблицах, поэтому ее можно выделить только тогда, когда это действительно необходимо.
                     
                     Как только мы начинаем ссылаться на объект слабо (weak reference), то создается боковая таблица, и теперь объект вместо сильного счетчика ссылок хранит ссылку на боковую таблицу. Сама боковая таблица также имеет ссылку на объект.

                     Side Table — это просто счетчик ссылок + указатель на объект. Они объявлены в Swift Runtime, кодом C++.
                     """
                    ),
            
            Question(question: [
                "Где хранятся Value Type в Swift?"
            ],
                     image: "",
                     optionA: "В стеке",
                     optionB: "В куче",
                     optionC: "",
                     optionD: "",
                     questionId: 582577324,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     В стеке. Value Type - Хранятся в стеке. Каждая переменная имеет свою собственную копию данных, и операции с одной не влияют на другую.
                     """
                    ),
            
            Question(question: [
                "Что из перечисленного относится к Reference Type?"
            ],
                     image: "",
                     optionA: "Class",
                     optionB: "Int",
                     optionC: "Enum",
                     optionD: "",
                     questionId: 974361124,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     Class. К ссылочным типам относятся: Классы, функции и замыкания (closures).
                     """
                    ),
            
            Question(question: [
                "Что из перечисленного относится к Value Type?"
            ],
                     image: "",
                     optionA: "Struct",
                     optionB: "Closure",
                     optionC: "Function",
                     optionD: "",
                     questionId: 620493116,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     Struct. К типам значения относятся базовые типы (Int, Double, String), структуры, перечисления (enum), массивы, словари и кортежи.
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
                     questionId: 949644911,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     Closure. К ссылочным типам относятся: Классы, функции и замыкания (closures).
                     """
                    ),
            
            Question(question: [
                "Где преимущественно хранятся Reference Type в Swift?"
            ],
                     image: "",
                     optionA: "В куче",
                     optionB: "В стеке",
                     optionC: "",
                     optionD: "",
                     questionId: 444268627,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     В куче. ReferenceType - Хранятся в куче. Переменные ссылочного типа могут указывать на одни и те же данные, следовательно, операции с одной переменной могут повлиять на данные, указанные другой переменной.
                     
                     Компилятор Swift может размещать ссылочные типы в стеке, когда их размер фиксирован или время жизни может быть предсказано. Эта оптимизация происходит на этапе генерации SIL.
                     
                     Swift Intermediate Language (SIL) - это промежуточный язык высокого уровня, ориентированный на Swift, подходящий для дальнейшего анализа и оптимизации кода Swift.
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
                     questionId: 243404298,
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
                     questionId: 243404298,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     Function. К ссылочным типам относятся: Классы, функции и замыкания (closures).
                     """
                    ),
            
            Question(question: [
                "deinit() вызывается на потоке, на котором счетчик ссылок стал равен нулю. Так ли это?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 865006077,
                     helpText: """
                     Да. deinit вызывается на том потоке, на котором счетчик ссылок стал равен нулю (была удалена последняя ссылка).
                     """
                    ),
            
            Question(question: [
                "Сколько может быть областей памяти, для которой свойственно динамическое выделение (куча)?"
            ],
                     image: "",
                     optionA: "Одна",
                     optionB: "Две",
                     optionC: "Неограниченное кол-во",
                     optionD: "",
                     questionId: 321702655,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     Одна. Куча одна, общая для всех потоков.
                     Стек для каждого потока свой. Сколько потоков, столько и стеков.
                     """
                    ),
            
            Question(question: [
                "Для каждого потока выделяется свой стек в памяти, так ли это?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 198930007,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     Да. Каждый поток многопоточного приложения имеет доступ к своему собственному стеку.
                     """
                    ),
            
            Question(question: [
                "Выберите objc обертку для работы с потоками в Swift?"
            ],
                     image: "",
                     optionA: "Thread",
                     optionB: "Operation",
                     optionC: "",
                     optionD: "",
                     questionId: 624591904,
                     links: [
                        "https://habr.com/ru/post/320152/",
                        "https://habr.com/ru/post/572316/"
                     ],
                     helpText: """
                     Thread. В iOS программировании многопоточность предоставляется в виде нескольких инструментов:
                     - Thread
                     - Grand Central Dispatch (GCD)
                     - Operation.

                     Thread — это objc обертка над pthread, которая предоставляет более удобный способ взаимодействия с потоком, а Operation - объектно-ориентированное API, построенное поверх GCD.
                     """
                    ),
            
            Question(question: [
                "Выберите объектно-ориентированное API для работы с многопоточностью, построенное поверх GCD в Swift?"
            ],
                     image: "",
                     optionA: "Operation",
                     optionB: "Grand Central Dispatch",
                     optionC: "Thread",
                     optionD: "",
                     questionId: 260560281,
                     links: [
                        "https://habr.com/ru/post/320152/"
                     ],
                     helpText: """
                     Operation. В iOS программировании многопоточность предоставляется в виде нескольких инструментов:
                     - Thread
                     - Grand Central Dispatch (GCD)
                     - Operation.
                     
                     Thread это низкоуровневый механизм, а Operation - объектно-ориентированное API, построенное поверх GCD.
                     """
                    ),
            
            Question(question: [
                "Фреймворк, написанный на языке С, позволяющий комфортно и достаточно просто управлять потоками, задачами для выполнения и ресурсами в Swift"
            ],
                     image: "",
                     optionA: "GCD",
                     optionB: "Operation",
                     optionC: "Thread",
                     optionD: "UIKit",
                     questionId: 686933812,
                     links: [
                        "https://habr.com/ru/post/578752/"
                     ],
                     helpText: """
                     GCD. Dispatch, больше известный как GCD – фреймворк, содержащий в себе языковые конструкции, позволяющие нам комфортно и достаточно просто управлять потоками, задачами для выполнения и ресурсами, которые нам необходимо захватить.
                     
                     GCD работает на системном уровне, таким образом он может удовлетворить потребности всех запущенных приложений на девайсе, при этом управляя ресурсами эффективно.

                     GCD реализован на языке C, поэтому фактически является низкоуровневым фреймворком. Однако начиная со Swift 3.0 обзавелся читаемым Swift API. GCD поддерживается как в iOS, так и в macOS, watchOS и tvOS
                     """
                    ),
            
            Question(question: [
                "Какому паттерну следуют очереди (queues) в Swift?"
            ],
                     image: "",
                     optionA: "FIFO",
                     optionB: "LIFO",
                     optionC: "",
                     optionD: "",
                     questionId: 778454967,
                     links: [
                        "https://habr.com/ru/post/320152/",
                        "https://habr.com/ru/post/578752/"
                     ],
                     helpText: """
                     FIFO. Очереди (queues) следуют FIFO паттерну (First In, First Out), это означает, что тот, кто первым был поставлен в очередь, будет первым направлен на выполнение.
                     
                     У вас может быть множество очередей (queues) и система “выдергивает” замыкания по одному из каждой очереди и запускает их на выполнение в их собственных потоках.
                     
                     Таким образом, вы получаете многопоточность.
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
                     questionId: 621237965,
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
                     questionId: 125382274,
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
                "Cитуация в многопоточной системе, при которой несколько потоков находятся в состоянии бесконечного ожидания ресурсов, занятых этими потоками"
            ],
                     image: "",
                     optionA: "Deadlock",
                     optionB: "Race condition",
                     optionC: "Data race",
                     optionD: "",
                     questionId: 171028339,
                     links: [
                        "https://habr.com/ru/post/578752/"
                     ],
                     helpText: """
                     Deadlock. Взаимная блокировка (deadlock) — ситуация в многопоточной системе, при которой несколько потоков находятся в состоянии бесконечного ожидания ресурсов, занятых самими этими потоками
                     
                     Самый простой пример - вызвать DispatchQueue.main.sync { someCode() } на главном потоке.
                     
                     В этом случае главный поток будет ожидать выполнения функции someCode, в тоже время выполнение функции someCode не начнется, пока главный поток не освободиться.
                     """
                    ),
            
            Question(question: [
                "Ситуация в многопоточной системе, при которой ожидаемый порядок выполнения операций становится непредсказуемым"
            ],
                     image: "",
                     optionA: "Race condition",
                     optionB: "Deadlock",
                     optionC: "Data race",
                     optionD: "",
                     questionId: 783082496,
                     links: [
                        "https://habr.com/ru/post/578752/"
                     ],
                     helpText: """
                     Race condition. Race condition это ситуация в многопоточных системах, при которой ожидаемый порядок выполнения операций становится непредсказуемым, в результате чего страдает закладываемая логика.
                     """
                    ),
            
            Question(question: [
                "Ситуация в многопоточном приложении, когда два или более потока пытаются получить доступ к одной и той же переменной без синхронизации"
            ],
                     image: "",
                     optionA: "Data race",
                     optionB: "Race condition",
                     optionC: "Deadlock",
                     optionD: "",
                     questionId: 796024549,
                     links: [
                        "https://habr.com/ru/company/otus/blog/353414/",
                        "https://www.avanderlee.com/swift/race-condition-vs-data-race/",
                        "https://developer.apple.com/documentation/xcode/data-races"
                     ],
                     helpText: """
                     Data race. Гонка данных возникает, когда два или более потока пытаются получить доступ к одной и той же переменной без синхронизации.
                     
                     Отсутствие синхронизации может привести к внесению изменений, которые не будут видны другим потокам, из-за этого возможно чтение устаревших данных, что, в свою очередь, приводит к бесконечным циклам, поврежденным структурам данных или неточным вычислениям.
                     """
                    ),
            
            Question(question: [
                "Что мы получим в консоль?"
            ],
                     image: "Interview01",
                     optionA: "1 3 2",
                     optionB: "1 2 3",
                     optionC: "2 1 3",
                     optionD: "",
                     questionId: 108073508,
                     helpText: """
                     1 3 2. Если функция gsd() вызывается на главном потоке, то вывод всегда будет равен 1 3 2. Потому что главная очередь последовательная, и в момент добавления замыкания print(2), на главной очереди идет выполнение функции gsd().
                     
                     Последовательные очереди не могут начать выполнение задачи, пока не завершат текущую. print(2) вызовется, как только главная очередь освободится, то есть после завершения функции gsd().
                     
                     Если функцию gdcTest запустить на фоновом потоке, то в этом случае вывод тоже будет равен 1 3 2, в большинстве случаев.
                     
                     Но не всегда, поскольку тут у нас появляется race condition, главный и фоновый потоки будут выполнять print(2) и print(3) паралельно. Что приведет к непредсказуемости порядка вывода. Убедится в наличии race condition можно добавив sleep(1) перед print(3)
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
                     questionId: 871980272,
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
                     questionId: 703367702,
                     links: [
                        "https://habr.com/ru/post/578752/#Dispatch%20group"
                     ],
                     helpText: """
                     Operations. Это самая сильная сторона OperationQueue. Зависимости ( dependecies) на OperationQueue могут быть более сложными, чем просто цепочки, и операции могут выполняться на разных очередях OperationQueue.
                     
                     Все, что вы можете сделать на Grand Central Dispatch (GCD), это реализовать цепочку заданий на последовательной (serial) DispatchQueue.
                     """
                    ),
        ]
    }
}
