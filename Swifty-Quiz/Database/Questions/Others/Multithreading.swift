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
        ]
    }
}
