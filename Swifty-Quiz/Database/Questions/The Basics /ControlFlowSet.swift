
//  Created by Евгений Никитин on 11.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

final class ControlFlowSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "Swift поддерживает столько разновидностей циклов",
                "Сколько разновидностей цикла поддерживает Swift?"
                
            ],
                     image: "",
                     optionA: "for-in, while, repeat-while",
                     optionB: "for-in, while",
                     optionC: "for-in",
                     optionD: "",
                     id: 784476212,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     3. Свифт поддерживает циклы:
                     - for-in
                     - while
                     - repeat-while
                     """),
            
            Question(question: [
                "Для чего в Swift используется цикл for-in?",
                "Цикл for-in используется именно для этого"
            ],
                     image: "",
                     optionA: "Итерирование коллекций",
                     optionB: "Выполнение набора инструкций",
                     optionC: "Вычисление условий",
                     optionD: "",
                     id: 719442268,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "Итерирование коллекций. Цикл for-in используется для итерации по коллекциям элементов, таких как диапазоны чисел, элементы массива или символы в строке."),
            
            Question(question: [
                "При итерации какого типа коллекции мы получаем доступ к паре ключ-значение?",
                "При итерации этого типа коллекции, каждый его элемент возвращается как кортеж (ключ, значение)"
            ],
                     image: "",
                     optionA: "Словарь",
                     optionB: "Множество",
                     optionC: "Массив",
                     optionD: "",
                     id: 866581774,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Словарь. Вы можете производить итерацию по словарю, чтобы получить доступ к его паре ключ-значение.
                     
                     Когда происходит итерация по словарю, каждый его элемент возвращается как кортеж (ключ, значение).
                     
                     Вы можете разложить члены кортежа на отдельные константы для того, чтобы использовать их в теле цикла for-in.
                     """),
            
            Question(question: [
                "Можем ли мы разложить словарь на отдельные константы, итерируя его через цикл for-in?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 119138387,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Да. Когда происходит итерация по словарю, каждый его элемент возвращается как кортеж (ключ, значение).
                     
                     Вы можете разложить члены кортежа на отдельные константы для того, чтобы использовать их в теле цикла for-in.
                     """),
            
            Question(question: [
                "В этом цикле index является переменной или константой?"
            ],
                     image: "ControlFlow4",
                     optionA: "Константа",
                     optionB: "Переменная",
                     optionC: "",
                     optionD: "",
                     id: 400017104,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Константа. В примере index является константой, значение которой автоматически устанавливается в начале каждой итерации цикла.
                     
                     Как таковую, ее не нужно объявлять перед использованием. Ее объявление неявно происходит в объявлении цикла, без необходимости использования ключевого слова let.
                     """),
            
            Question(question: [
                "Последняя строка, которая будет выведена в консоль?"
            ],
                     image: "ControlFlow4",
                     optionA: "5 + 5 = 10",
                     optionB: "3 + 5 = 8",
                     optionC: "4 + 5 = 9",
                     optionD: "",
                     id: 212684585,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     5 + 5 = 10. Коллекция элементов, по которой происходит итерация, является закрытым диапазоном чисел от 1 до 5 включительно, так как используется оператор закрытого диапазона(...).
                     
                     Значение index устанавливается в первое число из диапазона (1), и выражение внутри цикла выполняются. После того как выражение выполнено, значение index обновляется до следующего значения диапазона (2), и функция print(_:separator:terminator:) снова вызывается.
                     
                     Этот процесс будет продолжаться до тех пор, пока не будет достигнут конец диапазона.
                     """),
            
            Question(question: [
                "example не задействована, на что ее можно заменить?"
            ],
                     image: "ControlFlow6",
                     optionA: "Подчеркивание \"_\"",
                     optionB: "Пробел \" \"",
                     optionC: "Заменить нельзя",
                     optionD: "",
                     id: 204996891,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Подчеркивание \"_\". В данном случае нет необходимости знать значения счётчика (example) во время каждой итерации цикла - он просто должен выполниться необходимое количество раз.
                     
                     Символ подчеркивания \"_\" (который используется вместо переменной цикла) игнорирует ее отдельные значения и не предоставляет доступ к текущему значению во время каждой итерации цикла.
                     """),
            
            Question(question: [
                "Этот оператор диапазона включает нижнюю границу, но выключает верхнюю",
                "При итерации через цикл, этот оператор поможет выключить верхнюю границу диапазона",
                "Как мы можем исключить верхнюю границу диапазона при итерации через  for-in?"
            ],
                     image: "",
                     optionA: "..<",
                     optionB: "...",
                     optionC: "..>",
                     optionD: "",
                     id: 619146969,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "Полузамкнутый диапазон. Этот диапазон используется для того, чтобы включить нижнюю границу, но не верхнюю."),
            
            Question(question: [
                "Какие значения мы получим в консоль?",
                "Какая очередность цифр выводится в консоль после запуска?"
            ],
                     image: "ControlFlow8",
                     optionA: "2, 4, 6",
                     optionB: "0, 2, 4, 6",
                     optionC: "2, 4, 6, 8",
                     optionD: "4, 6",
                     id: 370385521,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     2, 4, 6. Чтобы у нас была возможность пропустить ненужные интервалы диапазона, используйте функцию stride(from:to:by:).
                     
                     Данная функция не захватывает последнее значение диапазона (8).
                     """),
            
            Question(question: [
                "Какие значения данный метод выведет в консоль?",
                "Какие цифры выведет данный метод в консоль после запуска?"
            ],
                     image: "ControlFlow9",
                     optionA: "2, 4, 6, 8",
                     optionB: "0, 2, 4, 6",
                     optionC: "2, 4, 6",
                     optionD: "4, 6, 8",
                     id: 459631047,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     2, 4, 6, 8. Вы можете работать и с закрытыми диапазонами, но уже при помощи метода stride(from:through:by:). \"through\" внутри данного метода говорит нам о том, что последнее значение диапазона будет захвачено и выведено в консоль.
                     """),
            
            Question(question: [
                "Цикл while выполняет набор инструкций до тех пор, пока не случится это",
                "До какого момента цикл while выполняет набор инструкций?",
                "Что должно произойти, чтобы цикл while прекратил выполнение своего набора инструкций?"
            ],
                     image: "",
                     optionA: "Условие стало false",
                     optionB: "Достигли верха диапазона",
                     optionC: "Закончилась коллекция элементов",
                     optionD: "",
                     id: 993418945,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Условие стало false. Цикл while выполняет набор инструкций до тех пор, пока его условие не станет false.
                     
                     Этот вид циклов лучше всего использовать в тех случаях, когда количество итераций до первого входа в цикл неизвестно.
                     
                     Swift предлагает два вида циклов while: while - вычисляет условие выполнения в начале каждой итерации цикла. repeat-while - вычисляет условие выполнения в конце каждой итерации цикла.
                     """),
            
            Question(question: [
                "Первая итерация цикла while будут выполняться только в этом случае",
                "Первая итерация цикла while будет выполняться, если ...?",
                "В каком случае первая итерация цикла while приступит к исполнению?"
            ],
                     image: "",
                     optionA: "Условие цикла истинно",
                     optionB: "Условие цикла ложно",
                     optionC: "В любом случае",
                     optionD: "",
                     id: 390785467,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Условие цикла истинно. Цикл while начинается с вычисления условия.
                     
                     Если условие истинно, то инструкции в теле цикла будут выполняться до тех пор, пока оно не станет ложным.
                     """),
            
            Question(question: [
                "Первая итерация цикла repeat-while будут выполняться только в этом случае",
                "Первая итерация цикла repeat-while будет выполняться, если ...?",
                "В каком случае первая итерация цикла repeat-while приступит к исполнению?"
            ],
                     image: "",
                     optionA: "В любом случае",
                     optionB: "Условие цикла ложно",
                     optionC: "Условие цикла истинно",
                     optionD: "",
                     id: 774033567,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     В любом случае. repeat-while всегда выполняет одну итерацию до того, как происходит проверка условия.
                     
                     Затем цикл продолжает повторяться до тех пор, пока условие не станет false.
                     """),
            
            Question(question: [
                "Когда условие простое, лучше использовать инструкцию if или switch?",
                "Если у нас есть достаточно простое условие, какую инструкцию условного ответвления логичнее всего использовать, switch или if?"
            ],
                     image: "",
                     optionA: "if-else",
                     optionB: "switch-case",
                     optionC: "",
                     optionD: "",
                     id: 690136287,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Инструкцию if-else. Swift предоставляет нам два варианта добавить условные ответвления кода - это при помощи инструкции if-else и при помощи switch-case.
                     
                     Обычно мы используем инструкцию if, если наше условие достаточно простое и предусматривает всего несколько вариантов.
                     
                     А вот инструкция switch подходит для более сложных условий, с многими вариантами выбора, и очень полезна в ситуациях, где по найденному совпадению с условием и выбирается соответствующая ветка кода для исполнения.
                     """),
            
            Question(question: [
                "Что мы получим в консоль?"
            ],
                     image: "ControlFlow08",
                     optionA: "Yes",
                     optionB: "No",
                     optionC: "",
                     optionD: "",
                     id: 612650534,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "Yes. В консоль напечатается Yes, потому что в первой проверке у нас будет true."),
            
            Question(question: [
                "В каком случае инструкция if выполнится?",
                "В каком случае будет выполняться тело инструкции if?",
                "Инструкция if выполнится только в этом случае"
            ],
                     image: "",
                     optionA: "Условие == true",
                     optionB: "Условие == false",
                     optionC: "В любом случае",
                     optionD: "",
                     id: 399204058,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Условие == true. В самой простой своей форме инструкция if имеет всего одно условие if.
                     
                     Эта инструкция выполняет установленные инструкции только в случае, когда условие true.
                     """),
            
            Question(question: [
                "Если в инструкции if первое условие == false, можно использовать это ключевое слово",
                "Дополнительная ветка инструкции if",
                "Дополнительные инструкции if указываются через это ключевое слово"
            ],
                     image: "",
                     optionA: "else",
                     optionB: "also",
                     optionC: "but",
                     optionD: "",
                     id: 681827171,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     else. Инструкция if может предусматривать еще один дополнительный набор инструкций в ветке известной как оговорка else, которая нужна в случае, если условие false.
                     
                     Эти альтернативные инструкции указываются через ключевое слово else.
                     """),
            
            Question(question: [
                "Если внутри инструкции switch мы нашли совпадение - пройдет ли сравнение дальше?",
                "Будут ли проверяться все оставшиеся кейсы внутри инструкции switch, если мы уже нашли совпадение?",
                "Если мы нашли совпадение внутри switch, будут ли проверяться все оставшиеся кейсы на совпадение?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "Только default",
                     optionD: "",
                     id: 807800181,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Нет. Инструкция switch подразумевает наличие какого-то значения, которое сравнивается с несколькими возможными кейсами (case).
                     
                     После того как значение совпало с каким-либо кейсом (case), выполняется соответствующий код из него, и больше сравнений не происходит.
                     
                     Switch представляет собой альтернативу инструкции if, отвечающей нескольким потенциальным значениям.
                     """),
            
            Question(question: [
                "Случай default внутри инструкции switch является обязательным. Так ли это?",
                "Является ли случай default внутри switch обязательным для использования?",
                "Обязаны ли мы каждый раз, используя switch-case, писать внутри default-случай?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 261699799,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Нет. Каждая инструкция switch должна быть исчерпывающей. То есть это значит, что каждое значение обязательно должно находить совпадение с шаблоном в каком-либо кейсе (case).
                     
                     Если неудобно вписывать все возможные кейсы, то вы можете определить случай по умолчанию, который включает в себя все значения, которые не были включены в остальные. Такой кейс по умолчанию называется default, и он всегда идет после всех остальных.
                     """),
            
            Question(question: [
                "Получим ли мы Success в консоль?"
            ],
                     image: "ControlFlow09",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 876251113,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Нет. Мы столкнемся с ошибкой компиляции: Binary operator '>=' cannot be applied to operands of type 'Int' and 'Double', поскольку мы пытаемся сравнить два числа разных типов.
                     
                     Нижнее подчеркивание может ставится в любом месте вашего числа, оно используется исключительно для читаемости кода.
                     """),
            
            Question(question: [
                "Отличие switch-case в Swift от Objective-C?",
                "У switch-case в Swift и Objective-C есть одно важное различие, какое?"
            ],
                     image: "",
                     optionA: "Отсутствие case-провалов",
                     optionB: "Отсутствие default случая",
                     optionC: "Ограниченное кол-во условий",
                     optionD: "",
                     id: 308304969,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Отсутствие case-провалов. Большое отличие инструкции switch в языке Swift от инструкции switch в C и Objective-C составляет отсутствие провалов через условия.
                     
                     Вместо этого инструкция switch прекращает выполнение после нахождения первого соответствия с case и выполнения соответствующего кода в ветке, без необходимости явного вызова break.
                     
                     Это делает инструкцию switch более безопасным и простым для использования, чем в C, и исключает исполнение кода более чем одного случая.
                     """),
            
            Question(question: [
                "Можем ли мы использовать оператор break внутри switch-case?",
                "Хоть оператор break и не является обязательным внутри switch в Swift, можем ли мы его использовать?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 932867055,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "Да. Хотя break не требуются внутри switch в Swift, вы все равно можете его использовать для соответствия и для игнорирования конкретного случая или просто для выхода из конкретного случая, еще до того, как исполнится код."),
            
            Question(question: [
                "Обязаны ли вы использовать оператор break внутри switch-case?",
                "Является ли оператор break обязательным внутри switch в Swift?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 431721510,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Нет. break не требуются внутри switch в Swift в обязательном порядке.
                     
                     Конечно вы все равно можете его использовать для соответствия и для игнорирования конкретного случая или просто для выхода из конкретного случая, еще до того, как исполнится код, но это делается по желанию.
                     """),
            
            Question(question: [
                "Напечатается ли наша строка в консоль хотя бы раз?"
            ],
                     image: "ControlFlow20",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 176637884,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Да. Когда наша переменная counter будет равна 6, мы зайдем внутрь цикла while, прибавим 2, и получим проходное значение для условия if counter == 8.
                     
                     Затем мы распечаем строку \"Удачи в изучении!\" и в следующей итерации уже не попадем на новый круг, потому что с 8 не пройдем проверку while counter < 8.
                     """),
            
            Question(question: [
                "Что обязательно должно содержаться внутри каждого кейса switch-case?",
                "Внутри каждого кейса switch-case обязательно должно содержаться это"
            ],
                     image: "",
                     optionA: "Исполняемое выражение",
                     optionB: "Условие",
                     optionC: "print()",
                     optionD: "",
                     id: 713558055,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "Исполняемое выражение. Тело каждого случая должно включать в себя хотя бы одно исполняемое выражение, иначе код не будет исполнен и выдаст ошибку компиляции."),
            
            Question(question: [
                "Получим ли мы строки в консоль? Если да, то сколько?"
            ],
                     image: "ControlFlow19",
                     optionA: "4",
                     optionB: "5",
                     optionC: "Столкнемся с ошибкой",
                     optionD: "Цикл будет бесконечным",
                     id: 652050274,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     4. Мы выполним данный цикл repeat всего один обязательный раз, который заложен в реализацию цикла repeat - while.
                     
                     Внутри него мы один раз запустим цикл for-in, состоящий из 4 итераций, которые напечатают нам 4 строчки Hello!
                     """),
            
            Question(question: [
                "Чем разделяются значения внутри составного case в инструкции switch?",
                "Внутри инструкции switch можно использовать составные кейсы, чем разделить их значения?"
            ],
                     image: "",
                     optionA: "Запятой",
                     optionB: "Обратным слешем",
                     optionC: "Точкой с запятой",
                     optionD: "",
                     id: 731956651,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "Запятой. Составные кейсы можно разделить запятой."),
            
            Question(question: [
                "Что выводится в консоль?",
                "Какая цифра печатается в консоль?"
            ],
                     image: "ControlFlow23",
                     optionA: "2",
                     optionB: "1",
                     optionC: "3",
                     optionD: "4",
                     id: 600125706,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     2. Вы можете использовать кортежи для тестирования нескольких значений в одной и той же инструкции switch.
                     
                     Каждый элемент кортежа может быть протестирован с любой величиной или с диапазоном величин. Так же вы можете использовать идентификатор подчеркивания (_) для соответствия любой возможной величине.
                     
                     Пример на изображении берет точку с координатами (x, y), выраженную в виде кортежа (Int, Int) и относит к соответствующей категории.
                     """),
            
            Question(question: [
                "Получим ли мы Success в консоль?"
            ],
                     image: "ControlFlow10",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 255187770,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "Да. Мы получим в консоль Success, поскольку 100 больше 1."),
            
            
            Question(question: [
                "При проверке через switch значение совпало с несколькими кейсами, как поведет себя инструкция в таком случае?",
                "Если ваше значение частично совпадает с несколькими случаями вашего switch, что произойдет?"
            ],
                     image: "",
                     optionA: "Исполнит первое",
                     optionB: "Исполнит любое",
                     optionC: "Исполнит последнее",
                     optionD: "",
                     id: 971188272,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Исполнит первое. В отличии от C, инструкция switch в Swift позволяет множественное совпадение или пересечение значений нескольких случаев.
                     
                     Если возможно совпадение сразу с несколькими шаблонами, то в расчет принимается только первое из них, а остальные случаи будут проигнорированы.
                     """),
            
            Question(question: [
                "Сколько строчек кода мы увидим в консоли после запуска?"
            ],
                     image: "ControlFlow01",
                     optionA: "4",
                     optionB: "3",
                     optionC: "0",
                     optionD: "",
                     id: 370849577,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "4. Данный цикл выполнит ровно четыре итерации, 0 - 1 - 2 - 3, то есть в консоль мы получим четыре строки \"Line of code\"."),
            
            Question(question: [
                "Используем связывание значений, какой будет результат в консоли?",
                "Что выводится в консоль при использовании связывания значений?",
                "Связываем значения кортежа при использовании switch, что покажет консоль?"
            ],
                     image: "ControlFlow25",
                     optionA: "Значение 2",
                     optionB: "Значение 0",
                     optionC: "Значения 2, 0",
                     optionD: "",
                     id: 518212931,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Значение 2. Кейс в инструкции switch может связывать значение или значения, с которыми сравнивается, с временными константами или переменными.
                     
                     Три случая в инструкции switch объявляют константы x, y, которым временно присваиваются значения одного или обоих элементов из кортежа point. В первом кейсе (let x, 0): подойдет любая точка со значением y равным 0, а в константу x запишется значение координаты x нашей точки.
                     
                     Аналогично и во втором случае, когда case (0, let y), этот кейс включает все точки при значении их координаты x равной 0, и происходит присваивание значения координаты y в временную константу y. Объявленная константа может быть использована внутри блока кейса. Здесь мы их используем как сокращенный вариант для вывода сообщения с помощью функции print.
                     """),
            
            Question(question: [
                "Почему на данном примере мы не используем случай default?",
                "Случай default не используется, почему?",
                "Именно поэтому мы не используем здесь случай default"
            ],
                     image: "ControlFlow25",
                     optionA: "Инструкция исчерпывающая",
                     optionB: "Потому что она необязательная",
                     optionC: "Используем связывание значений",
                     optionD: "",
                     id: 504565198,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Инструкция исчерпывающая. Инструкция switch не имеет случая default. Последний кейс let (x, y) объявляет кортеж двух констант плейсхолдеров, которые могут соответствовать абсолютно любому значению.
                     
                     Так как anotherPoint это кортеж с двумя значениями, этот кейс подходит под все возможные оставшиеся значения, и кейс default уже не нужен, так как инструкция switch исчерпывающая.
                     """),
            
            Question(question: [
                "Что мы получим, запустив данный код?"
            ],
                     image: "ControlFlow11",
                     optionA: "Ошибку компиляции",
                     optionB: "Success",
                     optionC: "Failure",
                     optionD: "",
                     id: 613478671,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "Ошибку компиляции. Мы получим ошибку компиляции (Binary operator '>=' cannot be applied to operands of type 'String' and 'Int'), поскольку мы не можем корректно сравнивать значения типа String и Int между собой."),
            
            
            Question(question: [
                "Можем ли мы писать составные кейсы на несколько строк?"
            ],
                     image: "ControlFlow28",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 823908606,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "Да. Шаблоны в кейсе могут быть записаны на несколько строк, если их очень много."),
            
            Question(question: [
                "Могут ли составные кейсы в инструкции switch включать в себя привязку значения?",
                "Составные кейсы в инструкции switch могут содержать привязку значения, так ли это?",
                "Можем ли мы употреблять привязку значения внутри составного кейса в switch?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 739915021,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Да. Составные кейсы в инструкции switch так же могут включать в себя привязку значения. Все шаблоны составных кейсов должны включать в себя тот же самый набор значений и каждая связка должна быть одного и того же типа из всех шаблонов составного кейса.
                     
                     Это гарантирует тот факт, что независимо от того, какая часть составного кейса switch совпала со сравниваемым значением, код в теле всегда получит доступ к значению  привязки и это значение всегда будет одного типа.
                     """),
            
            Question(question: [
                "Что выводится в консоль?"
            ],
                     image: "ControlFlow30",
                     optionA: "9",
                     optionB: "0",
                     optionC: "default",
                     optionD: "",
                     id: 968046514,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "9. Кейс имеет два шаблона: (let x, 0) и (0, let x). И тот и другой шаблон включают в себя привязку для x и x является целочисленным значением для двух этих шаблонов, что значит, что код внутри тела кейса всегда будет иметь доступ к значению x."),
            
            Question(question: [
                "Сколько строк кода мы получим в консоль?"
            ],
                     image: "ControlFlow02",
                     optionA: "3",
                     optionB: "4",
                     optionC: "1",
                     optionD: "",
                     id: 222172463,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "3. Данный цикл выполнит ровно три итерации, 1 - 2 - 3, то есть в консоль мы получим три строки \"Line of code\"."),
            
            Question(question: ["Что мы получим в консоль?"],
                     image: "ControlFlow12",
                     optionA: "Off",
                     optionB: "On",
                     optionC: "Столкнемся с ошибкой",
                     optionD: "",
                     id: 734599044,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "Off. Так как наша переменная = false, мы не пройдем первую проверку и попадем в блок else, после чего в консоль выведется Off."),
            
            Question(question: [
                "Какой оператор передачи управления говорит циклу прекратить текущую итерацию и начать новую?",
                "Этот оператор передачи управления говорит циклу: \"Я закончил с текущей итерацией, можем переходить к следующей\"",
                "Завершает текущую итерацию цикла, но полностью не выходит, а начинает новую. Про какой оператор передачи управления идет речь?"
            ],
                     image: "",
                     optionA: "continue",
                     optionB: "break",
                     optionC: "fallthrough",
                     optionD: "return",
                     id: 257002463,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Fallthrough"
                     ],
                     helpText: "continue. Оператор continue говорит циклу прекратить текущую итерацию и начать новую. Он как бы говорит: \"Я закончил с текущей итерацией\", но полностью из цикла не выходит."),
            
            Question(question: [
                "Получим ли мы фразу \"Мы нашли его!\" в консоль?"
            ],
                     image: "ControlFlow21",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 440246012,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "Да. Поскольку мы дойдем до числа 15 (последнего в представленном диапазоне), которое одновременно делится и на 3 и на 5, поэтому мы пройдем обе проверки и получим надпись в консоль."),
            
            Question(question: [
                "Этот оператор управления останавливает выполнение всей инструкции управления потоком",
                "Какой оператор управления может быть использован внутри switch или внутри цикла, когда вы хотите остановить дальнейшее выполнение?",
                "Если вы хотите остановить дальнейшее выполнение инструкции или цикла, какой оператор передачи управления можем вам помочь?"
            ],
                     image: "",
                     optionA: "break",
                     optionB: "continue",
                     optionC: "fallthrough",
                     optionD: "return",
                     id: 343910356,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Break"
                     ],
                     helpText: """
                     break. Оператор break останавливает выполнение всей инструкции управления потоком.
                     
                     Оператор break может быть использован внутри инструкции switch или внутри цикла, когда вы хотите остановить дальнейшее выполнение switch или цикла раньше, чем он должен закончиться сам по себе.
                     """),
            
            Question(question: [
                "Какой из циклов мы остановим через выполнение break generalLoop?"
            ],
                     image: "ControlFlow15",
                     optionA: "Оба цикла",
                     optionB: "Только родительский",
                     optionC: "Вложенный",
                     optionD: "",
                     id: 376464372,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Оба цикла. Swift имеет встроенное ключевое слово break, которое позволяет выходить из цикла, в котором вы находитесь, но что произойдет, если вы находитесь в двух или более циклах и хотите прервать их все?
                     
                     Для этого вы можете проименовать родительский цикл, и обратиться по этому имени, чтобы остановить его (что повлечет за собой остановку всех вложенных).
                     """),
            
            Question(question: [
                "Когда оператор управления break выполняется внутри цикла, произойдет ли следующая итерация?",
                "Произойдет ли следующая итерация, если оператор управления break выполняется внутри цикла?",
                "Если оператор управления break выполняется внутри цикла, начинается новая итерация, так ли это?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 938529151,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Нет. Когда оператор break используется внутри цикла, то он немедленно прекращает работу цикла, и выполнение кода продолжается с первой строки после закрывающей скобки цикла (}).
                     
                     Никакой последующий код из текущей итерации цикла выполняться не будет, и никакие дальнейшие итерации цикла не будут запускаться.
                     """),
            
            Question(question: [
                "Позволит ли Swift таким образом использовать цикл for-in?"
            ],
                     image: "ControlFlow03",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 504035071,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Нет. Мы не сможем перечислять значения через запятую.
                     
                     Xcode будет ругаться на первую запятую, и выдаст ошибку компиляции \"Expected '{' to start the body of for-each loop\".
                     """),
            
            Question(question: [
                "Когда оператор break выполняется внутри switch-case, что произойдет?",
                "Что произойдет, если оператор управления break выполняется внутри switch-case?",
                "Если оператор управления break выполняется внутри switch, что произойдет дальше?"
            ],
                     image: "",
                     optionA: "Завершается работа switch",
                     optionB: "Переходим к следующему case",
                     optionC: "Начинаем сравнение сначала",
                     optionD: "",
                     id: 319863660,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Завершается работа switch. Когда оператор break используется внутри инструкции switch, то он прекращает исполнение кода конкретного случая и перекидывает исполнение на первую строку после закрывающей скобки (}) инструкции switch.
                     
                     Так же оператор break может использоваться для сопоставления или игнорирования кейсов в инструкции switch. Так как инструкция switch исчерпывающая и не допускает пустых кейсов, то иногда бывает необходимо умышленно соответствовать или игнорировать кейсы для того, чтобы сделать ваши намерения ясными.
                     
                     Вы делаете это, когда пишите слово break в теле кейса, который вы хотите пропустить. Когда этот кейс попадает под сравнение, то break сразу завершает работу всей инструкции switch.
                     """),
            
            Question(question: [
                "Что мы получим в консоль?"
            ],
                     image: "ControlFlow07",
                     optionA: "Other city",
                     optionB: "We are in Krasnoyarsk",
                     optionC: "Столкнемся с ошибкой",
                     optionD: "",
                     id: 257119172,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Other city. Мы получим Other city в консоль.
                     
                     Поскольку мы не прошли первую проверку (получили false) и попали в блок else.
                     """),
            
            Question(question: [
                "Чтобы проигнорировать какой-либо кейс в switch, мы можем написать в теле кейса комментарий, так ли это?",
                "Если в теле кейса внутри switch мы напишем комментарий, что произойдет при запуске?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 331088721,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Ошибка компиляции. Кейс в инструкции switch, который содержит только комментарий, при компиляции выдает ошибку компиляции.
                     
                     Комментарии - это не утверждения, и они не дают возможности игнорировать кейсы.
                     
                     Если вы хотите игнорировать кейс switch, используйте break.
                     """),
            
            Question(question: [
                "Сколько строк кода мы получим в консоль?"
            ],
                     image: "ControlFlow04",
                     optionA: "2",
                     optionB: "8",
                     optionC: "4",
                     optionD: "",
                     id: 450549247,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "2. После проверки if i < 4 мы сможем распечатать в консоль только две строки, когда i будет равна 2 и 3."),
            
            Question(question: [
                "Какой оператор управления поможет вам сделать проваливание в следующий кейс внутри switch?",
                "Проваливание в следующий кейс внутри switch вам поможет осуществить этот оператор управления",
                "Именно этот оператор управления потоком поможет вам провалиться в следующий кейс switch независимо от совпадения"
            ],
                     image: "",
                     optionA: "fallthrough",
                     optionB: "continue",
                     optionC: "throw",
                     optionD: "return",
                     id: 107229493,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Fallthrough"
                     ],
                     helpText: "fallthrough. Если вам по какой-то причине нужно аналогичное проваливание в следующий кейс внутри switch, как в C, то вы можете использовать оператор fallthrough в конкретном кейсе."),
            
            Question(question: [
                "Можем ли мы создавать вложенные циклы?",
                "Можем ли мы создавать вложенные инструкции switch?",
                "Можем ли мы создавать цикл в цикле и switch внутри другого switch?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 941402221,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Да. Вы можете размещать циклы или инструкции switch внутри других циклов или switch инструкций, создавая тем самым сложное течение исполнения кода.
                     
                     Однако циклы и инструкции switch могут иметь break, что может прервать выполнение кода преждевременно.
                     """),
            
            Question(question: [
                "Этот цикл выведет нам 10 строк кода. Так ли это?"
            ],
                     image: "ControlFlow16",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 544411768,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "Нет. Поскольку у нас нет никакого условия выхода из этого цикла, мы будем повторять его бесконечное количество раз."),
            
            Question(question: [
                "Инструкция guard выполняет код внутри скобок только тогда, когда ее условие...?",
                "guard: инструкция раннего выхода, выполняет код в зависимости от логического значения ее условия, какого?",
                "При каком значении условия выполняется тело инструкции guard?"
            ],
                     image: "",
                     optionA: "false",
                     optionB: "true",
                     optionC: "",
                     optionD: "",
                     id: 884692904,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     false. Инструкция guard, как и инструкция if, выполняет выражения в зависимости от логического значения условия.
                     
                     Используйте guard, чтобы указать на то, что условие обязательно должно быть true, чтобы код после самой инструкции guard выполнился.
                     
                     В отличии от инструкции if, guard всегда имеет код внутри else, который выполняется, когда условие оценивается как false.
                     """),
            
            Question(question: [
                "Получим ли мы сообщение в консоль?"
            ],
                     image: "ControlFlow13",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 182332417,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "Да. Оба обязательных условия дают нам true, поэтому мы получим имя разработчика этого приложения в консоль."),
            
            Question(question: [
                "Сколько строк кода мы получим в консоль?"
            ],
                     image: "ControlFlow05",
                     optionA: "3",
                     optionB: "2",
                     optionC: "8",
                     optionD: "",
                     id: 324123682,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     3. Этот вопрос на внимательность, мы получим 3 строки.
                     
                     Внутри самого цикла мы получим 2 строчки \"We got our number\", но перед циклом мы выполним print(\"We start looping\"), в которой распечатаем еще одну строку.
                     """),
            
            Question(question: [
                "Если условие инструкции guard выполнилось, будет ли исполняться кода внутри фигурных скобок?",
                "Если условие guard дает нам true, будет ли исполняться блок кода в else?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 559872344,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Нет. Если условие инструкции guard выполнилось, то выполнение кода продолжается после закрывающей скобки guard.
                     
                     Все переменные и константы, которым мы присвоили значения с использованием опциональной привязки в качестве части условия guard, доступны нам до конца области, где был определен guard. Если условие не выполняется, то исполняется код внутри else.
                     
                     Эта ветка должна перебросить исполнение кода на выход из этого блока кода, в котором был определен guard.
                     
                     А сделать это можно при помощи инструкций return, break, continue, throw или можно вызвать метод, который ничего не возвращает, например fatalError(_file:line:).
                     """),
            
            Question(question: [
                "Сколько строк кода напечатает данный цикл?"
            ],
                     image: "ControlFlow17",
                     optionA: "5",
                     optionB: "4",
                     optionC: "0",
                     optionD: "",
                     id: 465780990,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     5. Данный цикл напечатает 5 строк кода, с числами 8 - 6 - 4 - 2 - 0.
                     
                     Ноль делится не только на 2, он делится на все степени двойки.
                     
                     В этом смысле, 0 является «наиболее чётным» числом из всех чисел.
                     """),
            
            Question(question: [
                "Если требования позволяют, предпочтительнее использовать инструкцию if или инструкцию guard?",
                "Предпочтительнее использовать инструкцию if или инструкцию guard, если позволяют требования?"
            ],
                     image: "",
                     optionA: "guard",
                     optionB: "if",
                     optionC: "",
                     optionD: "",
                     id: 994020333,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     guard. Использование инструкции guard для каких-либо требований улучшает читабельность кода по сравнению с if.
                     
                     Он помогает вам написать код, который вам не нужно будет помещать в блок else и позволит вам держать код, который обрабатывает нарушение требований рядом с самими требованиями.
                     """),
            
            Question(question: [
                "Какое значение будет у переменной result?"
            ],
                     image: "ControlFlow42",
                     optionA: "2",
                     optionB: "0",
                     optionC: "1",
                     optionD: "3",
                     id: 522732979,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "2. Когда мы обязательно попадем в первый кейс switch-case, мы изменим значение переменной и дальше \"провалимся\" в следующий кейс с помощью оператора falltrough, и там изменим значение переменной второй раз."),
            
            Question(question: [
                "Функция, проверяющая некоторое условие на предмет истинности, принимающая два входных параметра, только один из которых - обязательный"
            ],
                     image: "",
                     optionA: "assert(_:_:file:line:)",
                     optionB: "if",
                     optionC: ".filter(_:)",
                     optionD: "",
                     id: 636425005,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     assert(_:_:file:line:). Swift позволяет прервать выполнение программы в случае, когда некоторое условие не выполняется.
                     
                     Для этого служит специальный механизм утверждений (assertions). Утверждение представляет собой специальную функцию, проверяющую некоторое условие на предмет истинности. Первый и второй параметры определяют проверяемое условие и отладочное сообщение. Обязательным параметром является лишь условие.
                     
                     Если функция возвращает true, то выполнение программы продолжается, если же false, то выпонление программы завершается, а в консоль выводится ваше отладочное сообщение.
                     """),
            
            Question(question: [
                "Можем ли мы выполнить подобную итерацию по кортежу целых чисел?"
            ],
                     image: "ControlFlow06",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 887946434,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "Нет. Мы не сможем выполнить итерацию по кортежу, кортеж не поддерживает протокол Sequence, и мы получим следующую ошибку компиляции: For-in loop requires '(Int, Int, Int)' to conform to 'Sequence'."),
            
            Question(question: [
                "Получим ли мы сообщение в консоль?"
            ],
                     image: "ControlFlow14",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 125193675,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: """
                     Нет. Оба условия спрашивают именно про первую переменную age1, и так как она = 18, то оба условия не выполняются, и внутрь мы не попадаем.
                     
                     Кстати, перевод фразы внутри print звучит так: \"Был ли ты внимателен?\".
                     """),
            
            Question(question: [
                "Сколько строк кода мы получим в консоль?"
            ],
                     image: "ControlFlow18",
                     optionA: "Мы столкнемся с ошибкой",
                     optionB: "5",
                     optionC: "4",
                     optionD: "",
                     id: 450584946,
                     links: [
                        "https://swiftbook.ru/content/languageguide/control-flow/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/"
                     ],
                     helpText: "Мы столкнемся с ошибкой. В данном случае мы столкнемся с ошибкой компиляции, поскольку num является константой, и ее нельзя модифицировать (Left side of mutating operator isn't mutable: 'num' is a 'let' constant)."),
            
            Question(question: [
                "Какой блок кода выполнится при версии iOS = 15.0?",
                "Deployment version установлена как 15.0, какой блок кода выполнится?"
            ],
                     image: "ControlFlow43",
                     optionA: "Second",
                     optionB: "First",
                     optionC: "Никакой",
                     optionD: "",
                     id: 306408360,
                     links: [
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Checking-API-Availability",
                        "https://swiftbook.ru/content/languageguide/control-flow/"
                     ],
                     helpText: """
                     Second. Условие доступности в вопросе указывает, что тело if выполняется только на iOS 16.4 и более поздних версиях.
                     
                     Последний аргумент, * указывает, что на любой другой платформе, тело if выполнится на минимальной указанной deployment target.
                     """
                    ),
            
            Question(question: [
                "Какой блок кода выполнится при версии iOS = 16.5?",
                "Deployment version установлена как 16.5, какой блок кода выполнится?"
            ],
                     image: "ControlFlow43",
                     optionA: "First",
                     optionB: "Second",
                     optionC: "Никакой",
                     optionD: "",
                     id: 897729119,
                     links: [
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Checking-API-Availability",
                        "https://swiftbook.ru/content/languageguide/control-flow/"
                     ],
                     helpText: """
                     First. Условие доступности в вопросе указывает, что тело if выполняется только на iOS 16.4 и более поздних версиях.
                     
                     Последний аргумент, * указывает, что на любой другой платформе, тело if выполнится на минимальной указанной deployment target.
                     """
                    ),
            
            Question(question: [
                "Можно ли использовать условие доступности #available() через оператор guard?",
                "Вы можете использовать #available() с оператором guard, чтобы определить доступ к API для всего последующего кода в блоке. Так ли это?",
                "Можете ли вы использовать такую конструкцию в Swift: guard #available(iOS 16.0, *) else { return }?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 136809908,
                     links: [
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Checking-API-Availability",
                        "https://swiftbook.ru/content/languageguide/control-flow/"
                     ],
                     helpText: """
                     Да. Когда вы используете условие доступности #available() с оператором guard, это определяет доступность, которая применяется для всего остального кода в этом блоке (например внутри метода).
                     """
                    ),
            
            Question(question: [
                "Существует ли в Swift условие проверки на недоступность - #unavailable()?",
                "Поддерживает ли Свифт проверку на недоступность?"
            ],
                     image: "ControlFlow44",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 144042667,
                     links: [
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Checking-API-Availability",
                        "https://swiftbook.ru/content/languageguide/control-flow/"
                     ],
                     helpText: """
                     Да. Swift поддерживает проверку на недоступность с помощью условия недоступности (unavailability condition).
                     """
                    ),
            
            Question(question: [
                "Равнозначны ли эти условия?",
                "Данный условия идентичны. Так ли это?"
            ],
                     image: "ControlFlow44",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 417561395,
                     links: [
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Checking-API-Availability",
                        "https://swiftbook.ru/content/languageguide/control-flow/"
                     ],
                     helpText: """
                     Да. В дополнение к #available, Swift также поддерживает проверку на недоступность с помощью условия недоступности (unavailability condition). Наши две проверки, по сути, делают одно и то же.
                     
                     Использование формы #unavailable помогает сделать ваш код более читаемым, когда проверка содержит только запасной код.
                     """
                    ),
            
            Question(question: [
                "Код внутри defer выполняется, когда программа достигает конца текущей области видимости. Так ли это?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 206820228,
                     links: [
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Deferred-Actions"
                     ],
                     helpText: """
                     Да. В отличие от управляющих структур данных, таких как if и while, defer контролирует, когда выполняется определенный кусок кода.
                     
                     Вы используете defer для написания кода, который будет выполнен позже, когда программа достигнет конца текущей области видимости.
                     """
                    ),
            
            Question(question: [
                "Какое значение мы получим в консоль?"
            ],
                     image: "ControlFlow45",
                     optionA: "6",
                     optionB: "5",
                     optionC: "10",
                     optionD: "",
                     id: 360982958,
                     links: [
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Deferred-Actions"
                     ],
                     helpText: """
                     6. В приведенном примере код внутри блока defer выполняется перед выходом из тела оператора if.
                     
                     Сначала выполняется код в операторе if, который увеличивает значение переменной score на пять.
                     
                     Затем, перед выходом из области видимости оператора if, выполняется отложенный код, который выводит значение score.
                     """
                    ),
            
            Question(question: [
                "Score распечатается... ?"
            ],
                     image: "ControlFlow46",
                     optionA: "Последним",
                     optionB: "Первым",
                     optionC: "Не распечатается",
                     optionD: "",
                     id: 314547909,
                     links: [
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Deferred-Actions"
                     ],
                     helpText: """
                     Последним. Если вы напишете более одного блока defer в одной области видимости, то первый указанный будет выполнен последним.
                     """
                    ),
            
            Question(question: [
                "Как называется эта концепция циклов с маркером?"
            ],
                     image: "ControlFlow47",
                     optionA: "Маркированная инструкция",
                     optionB: "Именованная инструкция",
                     optionC: "Маркер",
                     optionD: "",
                     id: 213340121,
                     links: [
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Labeled-Statements",
                        "https://swiftbook.ru/content/languageguide/control-flow/"
                     ],
                     helpText: """
                     Маркированная инструкция. Labeled Statements.
                     
                     Иногда полезно явно указывать какой цикл или какую инструкцию switch вы хотите прервать оператором break.
                     
                     Так же, если у вас есть несколько вложенных циклов, то может быть полезным явное указание того, на какой цикл именно будет действовать оператор continue.

                     Для всех этих целей мы можем маркировать цикл или инструкцию switch маркером инструкций и использовать его вместе с оператором break или оператором continue.
                     """
                    ),
        ]
    }
}
