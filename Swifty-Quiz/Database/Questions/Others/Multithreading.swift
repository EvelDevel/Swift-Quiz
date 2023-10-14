//
//  Multithreading.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 13.09.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation

final class Multithreading {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "Главный поток iOS приложения (main thread), является последовательным или параллельным?"
            ],
                     image: "",
                     optionA: "Последовательным",
                     optionB: "Параллельным",
                     optionC: "",
                     optionD: "",
                     id: 410585902,
                     links: [
                        "https://habr.com/ru/articles/572316/"
                     ],
                     helpText: """
                     Последовательным. Главный поток (main thread) в iOS является последовательным.

                     Это означает, что код, выполняемый на главном потоке, обрабатывается последовательно, одна операция за другой.

                     Это важно для обеспечения согласованности пользовательского интерфейса и предотвращения гонок и других проблем, связанных с параллельным доступом к данным, обновлением UI и обработкой событий.
                     """
                    ),

            Question(question: [
                "Все операции приложения, по дефолту, выполняются на этом потоке"
            ],
                     image: "",
                     optionA: "Main thread",
                     optionB: "Background Thread",
                     optionC: "Operation Queue",
                     optionD: "",
                     id: 306208261,
                     links: [
                        "https://habr.com/ru/articles/572316/"
                     ],
                     helpText: """
                     Main thread. Все операции, выполняемые в мобильном приложении, требуют некоторых ресурсов и имеют время выполнения.

                     Эти операции by default выполняются поочередно в главном потоке.

                     Потоки - это одна из технологий, которые позволяют выполнять несколько операций внутри одного приложения одновременно.

                     Хотя новые технологии, такие как Operations и Grand Central Dispatch (GCD), обеспечивают более современную и эффективную инфраструктуру для реализации параллелизма, OS X и iOS также предоставляют интерфейсы для создания потоков и управления ими.
                     """
                    ),

            Question(question: [
                "Обработка всех событий связанных со взаимодействием с UI происходит на этом потоке"
            ],
                     image: "",
                     optionA: "Главный",
                     optionB: "Фоновый",
                     optionC: "Не принципиально",
                     optionD: "",
                     id: 754341593,
                     links: [
                        "https://habr.com/ru/articles/572316/"
                     ],
                     helpText: """
                     Главный. Главным потоком называется поток, в котором стартует приложение.

                     Обработка событий связанных со взаимодействием с UI происходит на главном потоке (такой операцией может быть обработка тапа по экрану, нажатия на клавишу клавиатуры, движение мыши и тд).

                     Помимо этого, любая операция, написанная нами, будь то выполнение алгоритма, запрос в сеть или обращение к базе данных так же будет выполняться поочередно на главном потоке, что может негативно сказываться на отклике UI.

                     Здесь к нам на помощь приходит многопоточность — возможность выполнять операции параллельно (одновременно) на разных потоках.
                     """
                    ),

            Question(question: [
                "Что такое Run Loop?"
            ],
                     image: "",
                     optionA: "Бесконечный цикл исполнения",
                     optionB: "Единовременная проверка",
                     optionC: "Итератор массивов",
                     optionD: "",
                     id: 216701949,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/company/otus/blog/590319/"
                     ],
                     helpText: """
                     Бесконечный цикл исполнения. Run Loop — своего рода бесконечный цикл, предназначенный для обработки и координации всех событий, поступающих к нему на вход.

                     В первую очередь стоит отметить, что у каждого потока есть свой ассоциированный Run Loop.

                     Run Loop для главного потока приложение (UIApplication) инициализирует и стартует автоматически, в то время как для созданных потоков запускать и конфигурировать Run Loop необходимо самостоятельно.
                     """
                    ),

            Question(question: [
                "Как и когда запускается Run Loop для главного потока в приложении?"
            ],
                     image: "",
                     optionA: "Автоматически",
                     optionB: "Вручную",
                     optionC: "В AppDelegate",
                     optionD: "",
                     id: 877706375,
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
                "Какое минимальное количество Run Loop может быть в приложении?"
            ],
                     image: "",
                     optionA: "Один",
                     optionB: "Два",
                     optionC: "По количеству потоков",
                     optionD: "",
                     id: 134915181,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/company/otus/blog/590319/"
                     ],
                     helpText: """
                     Один. У каждого потока может быть не болше одного Run Loop.

                     Значит в приложении может быть минимум один Run Loop, а максимум столько, сколько потоков.
                     """
                    ),

            Question(question: [
                "Какое максимальное количество Run Loop мы можем добавить на поток?"
            ],
                     image: "",
                     optionA: "1",
                     optionB: "2",
                     optionC: "Не ограничено",
                     optionD: "",
                     id: 702931363,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/company/otus/blog/590319/"
                     ],
                     helpText: """
                     1. У каждого потока может быть не болше одного Run Loop.

                     Значит в приложении может быть минимум один Run Loop, а максимум столько, сколько потоков.
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
                     id: 354807396,
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
                     id: 697353351,
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
                "Является ли Run Loop потокобезопасным?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 362657158,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/company/otus/blog/590319/"
                     ],
                     helpText: """
                     Нет. Объект типа Run Loop не потокобезопасен, не следует обращаться к Run Loop одного потока из другого потока.
                     """
                    ),

            Question(question: [
                "Кто отлавливает все системные события и запускает их обработку (например: тап по экрану телефона)?"
            ],
                     image: "",
                     optionA: "Run Loop",
                     optionB: "Main Thread",
                     optionC: "Hit Test",
                     optionD: "",
                     id: 430138689,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/company/otus/blog/590319/"
                     ],
                     helpText: """
                     Run Loop. Ранлуп главного потока отлавливает все системные события и запускает их обработку на главном потоке, будь то нажатия на клавиши клавиатуры, если это macOS, или тап по экрану iOS устройства.

                     Также Run Loop умеет управлять своим потоком: будить для выполнения некоторой работы и переводить в спячку после ее выполнения.
                     """
                    ),

            Question(question: [
                "Может ли Run Loop вашего приложения управлять своим потоком? Например: будить для выполнения некоторой работы?",
                "Может ли Run Loop вашего приложения управлять своим потоком? Например: переводить в спящий режим после выполнения некоторой работы?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 726640131,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/company/otus/blog/590319/"
                     ],
                     helpText: """
                     Да. Run Loop умеет управлять своим потоком: будить для выполнения некоторой работы и переводить в спящий режим после ее выполнения.

                     RunLoop автоматически переключается между активным состоянием (когда есть задачи для выполнения) и состоянием ожидания (когда нет задач).

                     RunLoop имеет множество возможностей для управления потоком выполнения, таких как добавление и удаление источников событий, установка таймеров, изменение режимов выполнения и другие.
                     """
                    ),


































            Question(question: [
                "Какие типы очередей бывают в Grand Central Dispatch?"
            ],
                     image: "",
                     optionA: "serial, concurrent",
                     optionB: "main, global",
                     optionC: "serial, main",
                     optionD: "",
                     id: 170561292,
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
                     id: 641683535,
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
                     id: 518203061,
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
                "Какой вывод мы получим в консоль (чаще всего)?"
            ],
                     image: "Multithreading01",
                     optionA: "1 -> 3 -> 2",
                     optionB: "1 -> 2 -> 3",
                     optionC: "Получим ошибку",
                     optionD: "",
                     id: 419276781,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     1 -> 3 -> 2. Здесь мы видим выполнение асинхронной задачи на глобальной очереди. Вот как это происходит:

                     Сначала будет выведено "1", так как это первая инструкция в коде.

                     Затем вызывается DispatchQueue.global().async. Код внутри замыкания представляет собой асинхронную задачу, которая будет выполнена в фоновом потоке, то есть выполнение кода продолжится дальше без ожидания окончания ее выполнения, поэтому дальше будет выведено "3".

                     "2" выводится в конце, после "3".
                     """
                    ),

            Question(question: [
                "Будет ли очередность вывода цифр в консоль постоянной?"
            ],
                     image: "Multithreading02",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 963670768,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     Нет. Асинхронная задача выполняется в фоновом потоке параллельно с основным потоком выполнения кода, и порядок выполнения может быть разным каждый раз при запуске программы.

                     Цифры 3 чаще всего будут "перемешаны" с цифрами "2", и предсказать порядок их вывода невозможно, он всегда будет случайным.
                     """
                    ),

            Question(question: [
                "Каким будет порядок вывода результата в консоль?"
            ],
                     image: "Multithreading03",
                     optionA: "Всегда разным",
                     optionB: "Постоянным, сначала 1",
                     optionC: "Постоянным, сначала 2",
                     optionD: "",
                     id: 327886983,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     Всегда разным. Две асинхронные задачи выполняются в фоновом потоке параллельно друг другу, и порядок выполнения может быть разным каждый раз при запуске программы.
                     """
                    ),

            Question(question: [
                "Какой порядок вывода мы получим в консоль?"
            ],
                     image: "Multithreading04",
                     optionA: "1 -> 3 -> 2",
                     optionB: "1 -> 2 -> 3",
                     optionC: "Получим ошибку",
                     optionD: "",
                     id: 123966627,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     1 -> 3 -> 2. Когда мы используем DispatchQueue.main.async, мы добавляем асинхронную задачу в главную очередь.

                     Это означает, что данная задача будет выполнена в главном потоке, но не сразу же после добавления, вместо этого она будет выполнена, когда главный поток освободится от выполнения других задач.

                     Это может быть после того, как текущий print("3") завершит свою работу.

                     Второй print выполняется сразу после добавления задачи в очередь, и так как он не связан с асинхронностью, он будет завершен быстрее.
                     """
                    ),

            Question(question: [
                "Выберите корректную последовательность чисел в консоли"
            ],
                     image: "Multithreading05",
                     optionA: "2 -> 1",
                     optionB: "1 -> 2",
                     optionC: "",
                     optionD: "",
                     id: 182964893,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     2 -> 1. Когда мы используем DispatchQueue.main.async, мы добавляем асинхронную задачу в главную очередь.

                     Это означает, что данная задача будет выполнена в главном потоке, но не сразу же после добавления, вместо этого она будет выполнена, когда главный поток освободится от выполнения других задач.

                     Это может быть после того, как текущий print("2") завершит свою работу.

                     Второй print выполняется сразу после добавления задачи в очередь, и так как он не связан с асинхронностью, он будет завершен быстрее.
                     """
                    ),

            Question(question: [
                "Какую последовательность мы получим в консоль?"
            ],
                     image: "Multithreading06",
                     optionA: "Всегда разную",
                     optionB: "2 -> 1",
                     optionC: "1 -> 2",
                     optionD: "",
                     id: 983391725,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     Всегда разную. Здесь мы создаем кастомную параллельную очередь.

                     Обе асинхронные задачи выполняются параллельно, и мы не можем прогнозировать скорость их выполнения и очередность.
                     """
                    ),

            Question(question: [
                "Выберите корректную последовательность вывода"
            ],
                     image: "Multithreading07",
                     optionA: "1 -> 2 -> 3",
                     optionB: "1 -> 3 -> 2",
                     optionC: "3 -> 2 -> 1",
                     optionD: "",
                     id: 333208580,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     1 -> 2 -> 3. В этом примере мы создаем последовательную очередь, и все задачи выполняются по очереди, одна за другой.
                     """
                    ),

            Question(question: [
                "Выберите корректную последовательность вывода в консоль"
            ],
                     image: "Multithreading08",
                     optionA: "1 -> 2",
                     optionB: "2 -> 1",
                     optionC: "Будет разная",
                     optionD: "",
                     id: 573336025,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     1 -> 2. Задача, добавленная в глобальную очередь с использованием sync, будет выполнена синхронно, ожидая завершения перед продолжением выполнения следующей инструкции.
                     """
                    ),

            Question(question: [
                "Что мы получим в консоль?"
            ],
                     image: "Multithreading09",
                     optionA: "1 -> 2 -> 3",
                     optionB: "1 -> 3 -> 2",
                     optionC: "Получим ошибку",
                     optionD: "",
                     id: 297669734,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     1 -> 2 -> 3. Задача, добавленная в глобальную очередь с использованием sync, будет выполнена синхронно, ожидая завершения перед продолжением выполнения следующей инструкции.
                     """
                    ),

            Question(question: [
                "Что мы получим в консоль?"
            ],
                     image: "Multithreading10",
                     optionA: "Столкнемся с ошибкой",
                     optionB: "1 -> 2 -> 3",
                     optionC: "1 -> 3 -> 2",
                     optionD: "",
                     id: 149232816,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     Столкнемся с ошибкой. В данном случае у нас получается deadlock.

                     print(1) выполняется на главном потоке, и "1" будет выведено в консоль.

                     DispatchQueue.main.sync { print(2) } это синхронное выполнение на главной очереди. Это означает, что выполнение этого замыкания будет заблокировано до тех пор, пока замыкание не завершится.

                     print(3) никогда не будет выполнен из-за блокировки в предыдущем шаге. Чтобы избежать блокировки, стоит избегать вызовов sync на том потоке, на котором они уже выполняются.
                     """
                    ),

            Question(question: [
                "Какая последовательность символов будет в консоли?"
            ],
                     image: "Multithreading11",
                     optionA: "a -> d -> c -> b",
                     optionB: "a -> b -> c -> d",
                     optionC: "a -> c -> b -> d",
                     optionD: "",
                     id: 897743589,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     a -> d -> c -> b. Сначала выполняются самые первые поставленные в главную очередь задачи (a / d).

                     После этого выполняется первая асинхронно добавленная задача (c).

                     И в последнюю очередь выполнится вторая асинхронно добавленная задача (d).
                     """
                    ),

            Question(question: [
                "Что выведется в консоль?"
            ],
                     image: "Multithreading12",
                     optionA: "a -> d",
                     optionB: "a -> d -> c",
                     optionC: "Ничего",
                     optionD: "",
                     id: 207601445,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     a -> d. Сначала выведется "a", следом - "d". Так как это самые первые задачи главной очереди, и на них ничего не влияет.

                     После чего мы перейдем к выполнению асинхронно добавленной задачи, внутри которой случится взаимная блокировка, так как мы пытаемся на этот же поток добавить синхронную задачу.

                     Синхронная задача будет ждать завершения асинхронной, а поток будет ждать выполнения синхронной задачи.

                     То есть поток заблокируется, и попытка вывести на нем хоть что-нибудь - не даст никакого результата.
                     """
                    ),

            Question(question: [
                "Можем ли мы отменять задачи у DispatchWorkItem в GCD с помощью метода cancel?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 868309886,
                     links: [
                        "https://habr.com/ru/post/578752/#Dispatch%20group",
                        "https://habr.com/ru/articles/320152/"
                     ],
                     helpText: """
                     Да. DispatchWorkItem дает нам возможность отменять задачу с помощью метода cancel. Важно понимать, что задачу можно отменить только в том случае, если она на момент отмены ожидает в очереди. Если поток уже начал выполнять задачу, она не будет отменена.

                     Операции Operations можно отменять с помощью их собственного метода cancel() или все операции сразу на определенной OperationQueue. Также можно отменять замыкания в BlockOperation.
                     """
                    ),

            Question(question: [
                "Можем ли мы отменить задачу DispatchWorkItem в GCD, если поток уже начал ее выполнение?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 485515326,
                     links: [
                        "https://habr.com/ru/post/578752/#Dispatch%20group",
                        "https://habr.com/ru/articles/320152/"
                     ],
                     helpText: """
                     Нет. DispatchWorkItem дает нам возможность отменять задачу с помощью метода cancel. Важно понимать, что задачу можно отменить только в том случае, если она на момент отмены ожидает в очереди. Если поток уже начал выполнять задачу, она не будет отменена.

                     Операции Operations можно отменять с помощью их собственного метода cancel() или все операции сразу на определенной OperationQueue. Также можно отменять замыкания в BlockOperation.
                     """
                    ),

            Question(question: [
                "Мы можем отменять задачи в Operations как по отдельности, так и все операции на определенной OperationQueue сразу. Так ли это?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "Только по отдельности",
                     optionD: "",
                     id: 732624797,
                     links: [
                        "https://habr.com/ru/post/578752/#Dispatch%20group",
                        "https://habr.com/ru/articles/320152/"
                     ],
                     helpText: """
                     Да. Операции Operations можно отменять с помощью их собственного метода cancel() или все операции сразу на определенной OperationQueue. Также можно отменять замыкания в BlockOperation.
                     """
                    ),

            Question(question: [
                "Как называется проблема многопоточности, когда несколько потоков одновременно пытаются записывать или читать один участок памяти?"
            ],
                     image: "",
                     optionA: "Race conditions",
                     optionB: "Deadlock",
                     optionC: "Resource contention",
                     optionD: "",
                     id: 438084199,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     Race conditions. Несколько потоков работают с одними и теми же данными (с одним адресом в памяти), например, одновременно читают и записывают в одну переменную (или записывают с нескольких потоков одновременно), результат выполнения серии операций может стать непредсказуемым и зависеть от порядка выполнения потоков.
                     """),

            Question(question: [
                "Несколько потоков, выполняющие разные задачи, пытаясь получить доступ к одним и тем же ресурсам, увеличивают количество времени, необходимое для безопасного получения требуемых ресурсов. Это?"
            ],
                     image: "",
                     optionA: "Resource contention",
                     optionB: "Deadlock",
                     optionC: "Starvation",
                     optionD: "",
                     id: 471891603,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     Resource contention. Конфликт за ресурсы (Resources contention): несколько потоков, которые могут выполнять разные задачи, пытаясь получить доступ к одним и тем же ресурсам, увеличивают количество времени, необходимое для безопасного получения требуемых ресурсов.

                     Эти задержки, необходимые для получения необходимых ресурсов, могут привести к неожиданному поведению или могут потребовать структурирования вашей программы для регулирования доступа к этим ресурсам.
                     """),

            Question(question: [
                "Проблема многопоточности, когда возникает ситуация, что поток блокирует критическую часть кода и может полностью остановить цикл выполнения приложения (Run loop)"
            ],
                     image: "",
                     optionA: "Deadlock",
                     optionB: "Starvation",
                     optionC: "Resource contention",
                     optionD: "",
                     id: 979231211,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     Deadlock. Ситуация, когда поток блокирует критическую часть кода и может полностью остановить цикл выполнения приложения (Run loop).

                     В контексте GCD вы должны быть очень осторожны при использовании вызовов dispatchQueue.sync {}, так как вы легко можете попасть в ситуации, когда две синхронные операции могут застрять в ожидании друг друга.
                     """),

            Question(question: [
                "Проблема многопоточности, при которой поток никогда не сможет получить доступ к ресурсу или набору ресурсов в определенном порядке, и будет пытаться снова и снова"
            ],
                     image: "",
                     optionA: "Starvation",
                     optionB: "Deadlock",
                     optionC: "Non-deterministic and Fairness",
                     optionD: "",
                     id: 810946621,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     Starvation. Поток никогда не сможет получить доступ к ресурсу или набору ресурсов в определенном порядке, в котором он нуждается по разным причинам, и пытается получить этот доступ снова и снова.
                     """),

            Question(question: [
                "Как называется проблема многопоточности, при которой поток с низким приоритетом удерживает ресурс, который требуется другому потоку с более высоким приоритетом?"
            ],
                     image: "",
                     optionA: "Priority Inversion",
                     optionB: "Starvation",
                     optionC: "Race conditions",
                     optionD: "",
                     id: 336150198,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://developer.apple.com/documentation/DISPATCH"
                     ],
                     helpText: """
                     Priority Inversion. Поток с низким приоритетом удерживает ресурс, который требуется другому потоку с более высоким приоритетом.
                     """),
            
            Question(question: [
                "Какой вывод мы получим в консоль?"
            ],
                     image: "Multithreading15",
                     optionA: "1, 1",
                     optionB: "1, 2",
                     optionC: "2, 2",
                     optionD: "",
                     id: 556419427,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://ios-interview.ru/multithreading-problems/"
                     ],
                     helpText: """
                     1, 1. C помощью первого print() мы выводим первую единицу, а потом, так как вызов функции изменения значения происходит асинхронно - поток практически моментально выполняет вторую команду print() (не ожидая), и мы получаем вторую 1, до ее изменения.
                     
                     Данная проблема в многопоточности называется Race condition. Состояние гонки — ситуация, возникающая, когда время или порядок событий влияют на корректность результата.
                     """),
            
            Question(question: [
                "Какой вывод мы получим в консоль?"
            ],
                     image: "Multithreading16",
                     optionA: "1, 2",
                     optionB: "1, 1",
                     optionC: "2, 2",
                     optionD: "",
                     id: 139940466,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://ios-interview.ru/multithreading-problems/"
                     ],
                     helpText: """
                     1, 2. C помощью первого print() мы выводим первую единицу, а потом, так как вызов функции изменения значения происходит синхронно, и поток блокируется до выполнения функции изменения значения, мы получаем 2.
                     
                     Данный подход, с синхронным вызовом, позволяет решать проблему многопоточности,  называемую Race condition.
                     
                     С помощью метода sync мы избавились от состояния гонки. Но это не значит, что его нужно использовать всегда, ведь он блокирует главный поток и ожидание может быть больше 1 секунды, как в нашем примере.
                     """),
            
            Question(question: [
                "Какой результат будет выведен в консоль?"
            ],
                     image: "Multithreading17",
                     optionA: "Всегда разный, < 2000",
                     optionB: "2000",
                     optionC: "Получим ошибку",
                     optionD: "",
                     id: 179442245,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://ios-interview.ru/multithreading-problems/"
                     ],
                     helpText: """
                     Всегда разный, < 2000. Мы ожидаем результат count = 2000. Но, к сожалению, результат будет всегда меньше этого числа, эта проблема называется Data Race (Гонка за данными).
                     
                     Это происходит потому, что операция увеличения счетчика не атомарна — она состоит из нескольких шагов:
                     - Чтение уже хранящегося значения;
                     - Сложение результата с единицей;
                     - Запись конечного результата обратно в переменную.
                     
                     Так как в нашем примере отсутствует какая-либо синхронизация, то наши потоки могут оказаться в одной точке, например, в которой считывается текущее значение переменной (оба потока одновременно прочитали текущее значение 0, и присвоив единицу записали в результат 1).
                     """
                    ),
            
            Question(question: [
                "Какой порядок цифр чаще всего будет выведен в консоль?"
            ],
                     image: "Multithreading18",
                     optionA: "1, 2, 6, 7, 3, 4, 5",
                     optionB: "1, 2, 6, 3, 5, 4, 7",
                     optionC: "1, 2, 6, 3, 4, 5, 7",
                     optionD: "",
                     id: 742126341,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://ios-interview.ru/top-20-middle-ios-interview-questions"
                     ],
                     helpText: """
                     1, 2, 6, 7, 3, 4, 5. В первую очередь вызываем print («1») и печатаем результат. Далее вызываем функцию в главном потоке, печатаем print(«2»). Далее отправлям все вложенные вызовы асинхронно в глобальную очередь.
                     
                     Следующая команда print («6»). После - выходим из функции и продолжаем выполнять код на главном потоке — print («7»). После главного потока, наступает очередь глобальной очереди — print («3»). Далее выполняется print («4»), поскольку он вызывается синхронно. Потом, в последнюю очередь - print («5»).
                     
                     Обратите внимание на следующий момент: если запустить код несколько раз, то результат может отличаться друг от друга — вывод 7 и 3 может меняться местами, если у системы есть свободные ресурсы, то асинхронный поток может начать выполняться быстрее, чем мы дойдем до семерки.
                     """
                    ),
            
            Question(question: [
                "Какой QoS в DispatchQueue выше по приоритету?"
            ],
                     image: "",
                     optionA: "User Interactive",
                     optionB: "User Initiated",
                     optionC: "",
                     optionD: "",
                     id: 775526194,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/articles/578752/",
                        "https://ios-interview.ru/top-20-middle-ios-interview-questions"
                     ],
                     helpText: """
                     User Interactive. QualityofService или QoS — качество обслуживания, которое появилось с приходом iOS 8. QoS помогает выставить приоритет, с которым будет выполняться наша задача DispatchQueue, QoS используется с функцией .async().
                     
                     User Interactive — используется для взаимодействия с пользователем. Это может быть любая работа, которая проходит в главном потоке, например, анимация или обновление интерфейса.
                     
                     User Initiated — используется при инициации работы пользователем. Это может быть такая задача как загрузка данных по API. Работа должна быть завершена, чтобы пользователь мог продолжить пользоваться приложением.
                     
                     User Interactive имеет самый высокий приоритет и будет выполняться в первую очередь, Background — самый низкий приоритет.
                     """
                    ),
        ]
    }
}
