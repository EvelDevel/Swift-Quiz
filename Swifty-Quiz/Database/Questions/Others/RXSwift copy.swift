//
//  RXSwift.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 26.01.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import Foundation

final class RXSwift {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "На что ориентирована парадигма реактивного программирования?"
            ],
                     image: "",
                     optionA: "Потоки данных",
                     optionB: "Последовательность выполнения",
                     optionC: "",
                     optionD: "",
                     id: 434088491,
                     links: [
                        "https://habr.com/ru/post/423603/"
                     ],
                     helpText: """
                     Потоки данных. Реактивное программирование — парадигма, ориентированная на потоки данных и распространение изменений.
                     """
                    ),
            
            Question(question: [
                "Реактивное программирование подразумевает, что мы пишем набор команд, которые должны выполняться последовательно. Так ли это?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 120734534,
                     links: [
                        "https://habr.com/ru/post/423603/"
                     ],
                     helpText: """
                     Нет. В случае, когда мы программируем в императивном стиле, мы пишем в коде набор команд, которые должны выполняться последовательно.
                     
                     Реактивный стиль программирования придерживается несколько иных концепций. При реактивном стиле программирования наша программа является "слушателем" изменений состояний у наших наблюдаемых объектов.
                     """
                    ),
            
            Question(question: [
                "Каким ключевым словом помечается наблюдаемый объект в RXSwift?"
            ],
                     image: "",
                     optionA: "Observable",
                     optionB: "Subscript",
                     optionC: "Watchable",
                     optionD: "",
                     id: 443267164,
                     links: [
                        "https://habr.com/ru/post/423603/"
                     ],
                     helpText: """
                     Observable. Ключевым словом Observable помечается наблюдаемый объект, который будет отдавать нам данные, нужен он для генерации потока данных.

                     let observable = Observable<String>.just("Объект")
                     """
                    ),
            
            Question(question: [
                "Как мы можем подписаться на наблюдение за observable объектами в RXSwift?"
            ],
                     image: "",
                     optionA: ".subscribe",
                     optionB: ".observe",
                     optionC: ".just",
                     optionD: "",
                     id: 740813243,
                     links: [
                        "https://habr.com/ru/post/423603/"
                     ],
                     helpText: """
                     subscribe. Чтобы подписаться на observable объект в RXSwift, используйте .subscribe

                     _ = observable.subscribe { (event) in
                         print(event)
                     }
                     """
                    ),
            
            Question(question: [
                "Какие события (events) есть у наблюдаемого (observable) объекта в RXSwift?"
            ],
                     image: "",
                     optionA: "next, error, completed",
                     optionB: "next, completed",
                     optionC: "error, next",
                     optionD: "",
                     id: 803332785,
                     links: [
                        "https://habr.com/ru/post/423603/"
                     ],
                     helpText: """
                     next, error, completed. Observable отправляет нам информацию о своих event'ах, есть всего 3 вида: next, error, completed.

                     Вместе с next приходит элемент, который мы отправляли и все события посланные нами, error посылается как понятно из названия - в случае ошибки, а completed в случае, когда наш observable отослал все данные и завершает работу.
                     """
                    ),
            
            Question(question: [
                "С каким типом данных можно создавать наблюдаемые (observable) объекты в RXSwift?"
            ],
                     image: "",
                     optionA: "С любым",
                     optionB: "String",
                     optionC: "Int",
                     optionD: "Array",
                     id: 326196501,
                     links: [
                        "https://habr.com/ru/post/423603/"
                     ],
                     helpText: """
                     C любым. В observable можно создавать последовательность не только из одной строки, да и вообще не только из строк, мы можем положить туда любой тип данных.

                     let sequence = Observable<Int>.of(1, 2, 4)

                     _ = sequence.subscribe { (event) in
                         print(event)
                     }
                     """
                    ),
            
            Question(question: [
                "Можем ли мы создать наблюдаемый (observable) объект из массива значений?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 900582941,
                     links: [
                        "https://habr.com/ru/post/423603/"
                     ],
                     helpText: """
                     Да. Observable можно создать из массива значений.
                     
                     let array = [1, 2, 3]

                     let observable = Observable<Int>.from(array)

                     _ = observable.subscribe { (event) in
                         print(event)
                     }
                     """
                    ),
            
            Question(question: [
                "Сколько наблюдателей / подписчиков может быть у наблюдаемого (observable) объекта?"
            ],
                     image: "",
                     optionA: "Сколько угодно",
                     optionB: "Только один",
                     optionC: "До 10",
                     optionD: "",
                     id: 682091656,
                     links: [
                        "https://habr.com/ru/post/423603/"
                     ],
                     helpText: """
                     Сколько угодно. У одного observable объекта может быть сколь угодно много subscriber'ов.

                     Observable — это основа всего Rx, которая асинхронно генерирует последовательность неизменяемых данных и позволяет подписываться на нее другим (без ограничений).
                     """
                    ),
            
            Question(question: [
                "Может ли наблюдаемый (observable) объект в RXSwift создавать и отправлять события (events), если у него нет подписчиков?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "Иногда",
                     optionD: "",
                     id: 512419609,
                     links: [
                        "https://habr.com/ru/post/423603/"
                     ],
                     helpText: """
                     Нет. Важно помнить, что Observable это "холодный" тип, то есть наш observable не "испускает" никаких событий, пока на него не подпишутся.
                     
                     Observable существует до тех пор, пока он не пошлет сообщение об ошибке (error) или сообщение о завершении (completed).
                     """
                    ),
            
            Question(question: [
                "Как мы можем отменить подписку на наблюдаемый объект в RXSwift вручную?"
            ],
                     image: "",
                     optionA: ".dispose()",
                     optionB: ".cancel()",
                     optionC: ".turnOff()",
                     optionD: "",
                     id: 909488052,
                     links: [
                        "https://habr.com/ru/post/423603/",
                        "https://swiftbook.ru/post/tutorials/rxswift-in-10-minutes/"
                     ],
                     helpText: """
                     dispose(). Если вы хотите отменить подписку вручную, вы можете сделать это, вызвав её метод .dispose().
                     
                     Для чего это нужно? Если вы, используя подписку, не добавите ее в сумку или явно не вызовете dispose, ну или в крайнем случае не приведете каким-то образом observable к завершению, то скорее всего вы получите утечку памяти.
                     """
                    ),
            
            Question(question: [
                "Какой метод позволяет нам отменить подписку на наблюдаемый объект в RXSwift через специальную корзину?"
            ],
                     image: "",
                     optionA: ".disposed(by:)",
                     optionB: ".cancel(by:)",
                     optionC: ".turnOff(by:)",
                     optionD: "",
                     id: 330343763,
                     links: [
                        "https://habr.com/ru/post/423603/"
                     ],
                     helpText: """
                     disposed(by:). Если вы хотите отменить подписку вручную, вы можете сделать это, вызвав её метод .dispose().
                     
                     Вы также можете добавить подписку в Disposebag (“корзину”) через .disposed(by:), которая автоматически отменит подписку при выполнении метода deinit.
                     
                     Для чего это нужно? Если вы, используя подписку, не добавите ее в сумку или явно не вызовете dispose, ну или в крайнем случае не приведете каким-то образом observable к завершению, то скорее всего вы получите утечку памяти.
                     
                     DisposeBag вы будете использовать очень часто в своей работе с RxSwift.
                     """
                    ),
            
            Question(question: [
                "Есть ли в RXSwift свои встроенные операторы функционального программирования?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 846229679,
                     links: [
                        "https://habr.com/ru/post/423603/",
                        "https://rxmarbles.com/"
                     ],
                     helpText: """
                     Да. В функционально-реактивном программировании (ФРП) есть много встроенных операторов для трансформации элементов observable.
                     """
                    ),
            
            Question(question: [
                "Этот встроенный в RXSwift функциональный оператор берет элемент последовательности, преобразует, и создает новую последовательность"
            ],
                     image: "",
                     optionA: "Map",
                     optionB: "Filter",
                     optionC: "Distinct",
                     optionD: "",
                     id: 887699291,
                     links: [
                        "https://habr.com/ru/post/423603/",
                        "https://rxmarbles.com/"
                     ],
                     helpText: """
                     Map. С помощью этого оператора функционального программирования мы берем каждый элемент исходной последовательности, и создаем новую, результирующую последовательность.
                     
                     Принцип действия такой-же, как у нативного оператора map в Swift.
                     """
                    ),
            
            Question(question: [
                "Этот встроенный в RXSwift функциональный оператор позволяет не получать часть значений при подписке на observable объект"
            ],
                     image: "",
                     optionA: "Filter",
                     optionB: "Map",
                     optionC: "Distinct",
                     optionD: "",
                     id: 435132771,
                     links: [
                        "https://habr.com/ru/post/423603/",
                        "https://rxmarbles.com/"
                     ],
                     helpText: """
                     Filter. Оператор filter позволяет нам отфильтровать приходящие из нашего observable объекта данные, то есть при подписке мы не будем получать ненужные нам значения.
                     """
                    ),
            
            Question(question: [
                "Можем ли мы комбинировать функциональные операторы (например: map, filter) и применять их вместе для одного наблюдаемого объекта в RXSwift?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 187328371,
                     links: [
                        "https://habr.com/ru/post/423603/"
                     ],
                     helpText: """
                     Да. Операторы можно комбинировать, вот как это выглядело бы, если бы мы захотели применить сразу и filter и map:
                     
                     let filtered = observable
                         .filter { $0 > 2 }
                         .map { $0 * 2 }
                     """
                    ),
            
            Question(question: [
                "Этот функциональный оператор в RXSwift позволит взять только n элементов с конца"
            ],
                     image: "",
                     optionA: "TakeLast",
                     optionB: "Filter",
                     optionC: "Throttle",
                     optionD: "DropLast",
                     id: 697429049,
                     links: [
                        "https://habr.com/ru/post/423603/",
                        "https://rxmarbles.com/"
                     ],
                     helpText: """
                     TakeLast. Очень простой оператор takeLast, мы берем n-ое количество элементов с конца.
                     
                     let last = observable.takeLast(1)
                     """
                    ),
            
            Question(question: [
                "Какой Scheduler в RX отвечает за то, в каком потоке выполняется весь процесс наблюдаемого объекта до момента, как его события дойдут до подписчика?"
            ],
                     image: "",
                     optionA: "SubscribeOn",
                     optionB: "ObserveOn",
                     optionC: "",
                     optionD: "",
                     id: 287287792,
                     links: [
                        "https://habr.com/ru/post/423603/"
                     ],
                     helpText: """
                     SubscribeOn. SubscribeOn отвечает за то, в каком потоке будет выполняться весь процесс observable до того момента, как его event'ы дойдут до обработчика (подписчика).
                     
                     Мы можем очень легко поставить загрузку чего-либо из сети в background поток при помощи SubscribeOn.
                     """
                    ),
            
            Question(question: [
                "Какой Scheduler в RX отвечает за то, в каком потоке будут выполняться принятые подписчиком события (events)?"
            ],
                     image: "",
                     optionA: "ObserveOn",
                     optionB: "SubscribeOn",
                     optionC: "",
                     optionD: "",
                     id: 194381550,
                     links: [
                        "https://habr.com/ru/post/423603/"
                     ],
                     helpText: """
                     ObserveOn. SubscribeOn отвечает за то, в каком потоке будет выполняться весь процесс observable до того момента, как его event'ы дойдут до обработчика (подписчика).
                     
                     Как можно догадаться - observeOn отвечает за то, в каком потоке будут обрабатываться принятые подписчиком event'ы.
                     
                     Мы можем очень легко поставить загрузку чего-либо из сети в background поток при помощи SubscribeOn, а при получении результат перейти в main поток и как-то воздействовать на UI через SubscribeOn.
                     """
                    ),
            
            Question(question: [
                "Какой тип subject в RXSwift рассылает всем подписчикам то, что ему пришло, и забывает об этом?"
            ],
                     image: "",
                     optionA: "PublishSubject",
                     optionB: "ReplaySubject",
                     optionC: "BehaviorSubject",
                     optionD: "",
                     id: 324619091,
                     links: [
                        "https://habr.com/ru/post/423603/"
                     ],
                     helpText: """
                     PublishSubject. PublishSubject — самый простой subject, ему без разницы на все, он просто рассылает всем подписчикам то, что ему пришло и забывает об этом.
                     """
                    ),
            
            Question(question: [
                "Какой тип subject в RXSwift хранит в буфере последние n значений и посылает их новому подписчику?"
            ],
                     image: "",
                     optionA: "ReplaySubject",
                     optionB: "PublishSubject",
                     optionC: "BehaviorSubject",
                     optionD: "",
                     id: 164201975,
                     links: [
                        "https://habr.com/ru/post/423603/"
                     ],
                     helpText: """
                     ReplaySubject. ReplaySubject — самый ответственный subject, при создании мы указываем ему размер буфера (сколько значений будет запоминать), в результате он хранит в памяти последние n значений и посылает их сразу новому подписчику.
                     """
                    ),
            
            Question(question: [
                "Какой тип subject в RXSwift имеет стартовое значение, запоминает последнее значение, и посылает его сразу после подписки?"
            ],
                     image: "",
                     optionA: "BehaviorSubject",
                     optionB: "PublishSubject",
                     optionC: "ReplaySubject",
                     optionD: "",
                     id: 667479545,
                     links: [
                        "https://habr.com/ru/post/423603/"
                     ],
                     helpText: """
                     BehaviorSubject. BehaviorSubject — в отличии от ReplaySubject имеет стартовое значение и запоминает последнее значение, и посылает его сразу после подписки.
                     """
                    ),
        ]
    }
}
 
