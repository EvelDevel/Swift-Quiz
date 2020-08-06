
//  Created by Евгений Никитин on 11.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

// MARK:  Вопросы (id) с 401 по 500

class ControlFlowSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: ["Сколько разных циклов поддерживает Swift?",
                                "Swift поддерживает столько разных циклов"],
                     image: "",
                     optionA: "три",
                     optionB: "два",
                     optionC: "четыре",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 401,
                     helpText: "Циклы for-in, while, repeat-while"),
            
            Question(question: ["Для чего используется цикл for-in?",
                                "Цикл for-in используется именно для этого"],
                     image: "",
                     optionA: "Итерация элементов коллекции",
                     optionB: "Выполнение набора инструкций",
                     optionC: "Вычисление условий",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 402,
                     helpText: "Цикл for-in используется для итерации по коллекциям элементов, таких как диапазоны чисел, элементы массива или символы в строке."),
            
            Question(question: ["При итерации какой коллекции, мы можем разложить вернувшееся значение на отдельные константы?",
                                "При итерации этой коллекции, вернувшееся значение можно разложить на отдельные константы",
                                "При итерации какой коллекции нам возвращается кортеж значений, который можно разложить на отдельные константы?"],
                     image: "",
                     optionA: "Словарь",
                     optionB: "Множество",
                     optionC: "Массив",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 403,
                     helpText: "Вы можете производить итерацию по словарю, чтобы получить доступ к его паре ключ-значение. Когда происходит итерация по словарю, каждый его элемент возвращается как кортеж (ключ, значение). Вы можете разложить члены кортежа на отдельные константы для того, чтобы использовать их в теле цикла for-in. "),
            
            Question(question: ["В этом цикле index является переменной или константой?"],
                     image: "ControlFlow4",
                     optionA: "Константа",
                     optionB: "Переменная",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 404,
                     helpText: "В примере index является константой, значение которой автоматически устанавливается в начале каждой итерации цикла. Как таковую, ее не нужно объявлять перед использованием. Ее объявление неявно происходит в объявлении цикла, без необходимости использования зарезервированного слова let."),
            
            Question(question: ["Последняя строка, которая будет выведена в консоль?"],
                     image: "ControlFlow4",
                     optionA: "5 + 5 = 10",
                     optionB: "3 + 5 = 8",
                     optionC: "4 + 5 = 9",
                     optionD: "2 + 5 = 7",
                     correctAnswer: 1,
                     questionId: 405,
                     helpText: "Правильный ответ: 5 + 5 = 10. Коллекция элементов, по которой происходит итерация, является закрытым диапазоном чисел от 1 до 5 включительно, так как используется оператор закрытого диапазона(...). Значение index устанавливается в первое число из диапазона (1), и выражение внутри цикла выполняются. После того как выражение выполнено, значение index обновляется до следующего значения диапазона (2), и функция print(_:separator:terminator:) снова вызывается. Этот процесс будет продолжаться до тех пор, пока не будет достигнут конец диапазона."),
            
            Question(question: ["example не задействована, на что ее можно заменить?"],
                     image: "ControlFlow6",
                     optionA: "Подчеркивание \"_\"",
                     optionB: "Пробел \" \"",
                     optionC: "Двоеточие \":\"",
                     optionD: "Заменить или убрать нельзя",
                     correctAnswer: 1,
                     questionId: 406,
                     helpText: "В данном случае нет необходимости знать значения счётчика (example) во время каждой итерации цикла - он просто должен выполниться необходимое количество раз. Символ подчеркивания \"_\" (который используется вместо переменной цикла) игнорирует ее отдельные значения и не предоставляет доступ к текущему значению во время каждой итерации цикла."),
            
            Question(question: ["Какой оператор диапазона мы должны использовать при итерации, чтобы включить нижнюю границу, но не включать верхнюю?",
                                "При итерации через цикл, этот оператор поможет выключить верхнюю границу диапазона",
                                "Как мы можем исключить верхнюю границу диапазона при итерации через  for-in?"],
                     image: "",
                     optionA: "..<",
                     optionB: "...",
                     optionC: "..>",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 407,
                     helpText: "Используйте полузамкнутый диапазон (..<), чтобы включить нижнюю границу, но не верхнюю."),
            
            Question(question: ["Какие значения мы получим в консоль?",
                                "Какая очередность цифр выводится в консоль после запуска?"],
                     image: "ControlFlow8",
                     optionA: "2, 4, 6",
                     optionB: "0, 2, 4, 6",
                     optionC: "2, 4, 6, 8",
                     optionD: "4, 6",
                     correctAnswer: 1,
                     questionId: 408,
                     helpText: "Чтобы у нас была возможность пропустить ненужные интервалы диапазона, используйте функцию stride(from:to:by:). Правильный ответ в примере: 2, 4, 6. Данная функция не захватывает последнее значение диапазона (8)."),
            
            Question(question: ["Какие значения данный метод выведет в консоль?",
                                "Какие цифры выведет данный метод в консоль после запуска?"],
                     image: "ControlFlow9",
                     optionA: "2, 4, 6, 8",
                     optionB: "0, 2, 4, 6",
                     optionC: "2, 4, 6",
                     optionD: "4, 6, 8",
                     correctAnswer: 1,
                     questionId: 409,
                     helpText: "Вы можете работать и с закрытыми диапазонами, но уже при помощи метода stride(from:through:by:). Правильный ответ: 2, 4, 6, 8, \"through\" внутри данного метода говорит нам о том, что последнее значение диапазона будет захвачено и выведено в консоль."),
            
            Question(question: ["Как данная тема \"Управление потоком\" называется на английском языке?",
                                "Как будет \"Управление потоком\" на английском языке?",
                                "Как будет \"Управление потоком\" в официальном документации (английский)?"],
                     image: "",
                     optionA: "Control Flow",
                     optionB: "Collection Types",
                     optionC: "Closures",
                     optionD: "Optional Chaining",
                     correctAnswer: 1,
                     questionId: 410,
                     helpText: "Знание английского языка в программировании играет важную роль. Правильный ответ: Control Flow."),
            
            Question(question: ["До какого момента цикл while выполняет набор инструкций?",
                                "Цикл while выполняет набор инструкций до тех пор, пока не случится это",
                                "Что должно произойти, чтобы цикл while прекратил выполнение своего набора инструкций?"],
                     image: "",
                     optionA: "Условие стало false",
                     optionB: "Достигли верха диапазона",
                     optionC: "Закончилась коллекция элементов",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 411,
                     helpText: "Цикл while выполняет набор инструкций до тех пор, пока его условие не станет false. Этот вид циклов лучше всего использовать в тех случаях, когда количество итераций до первого входа в цикл неизвестно. Swift предлагает два вида циклов while: while - вычисляет условие выполнения в начале каждой итерации цикла. repeat-while - вычисляет условие выполнения в конце каждой итерации цикла."),
            
            Question(question: ["Первая итерация цикла while будут выполняться только в этом случае",
                                "Первая итерация цикла while будет выполняться, если ...?",
                                "В каком случае первая итерация цикла while приступит к исполнению?"],
                     image: "",
                     optionA: "Условие цикла истинно",
                     optionB: "Условие цикла ложно",
                     optionC: "В любом случае",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 412,
                     helpText: "Цикл while начинается с вычисления условия. Если условие истинно, то инструкции в теле цикла будут выполняться до тех пор, пока оно не станет ложным."),
            
            Question(question: ["Первая итерация цикла repeat-while будут выполняться только в этом случае",
                                "Первая итерация цикла repeat-while будет выполняться, если ...?",
                                "В каком случае первая итерация цикла repeat-while приступит к исполнению?"],
                     image: "",
                     optionA: "В любом случае",
                     optionB: "Условие цикла ложно",
                     optionC: "Условие цикла истинно",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 413,
                     helpText: "repeat-while всегда выполняет одну итерацию до того, как происходит проверка условия. Затем цикл продолжает повторяться до тех пор, пока условие не станет false."),
            
            Question(question: ["Swift предоставляет нам два варианта добавить условные ответвления кода, при помощи инструкции if и инструкции switch, какую логично использовать, когда условие простое?",
                                "Если у нас есть достаточно простое условие, какую инструкцию условного ответвления логичнее всего использовать, switch или if?"],
                     image: "",
                     optionA: "Инструкцию if",
                     optionB: "Инструкцию switch-case",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 414,
                     helpText: "Swift предоставляет нам два варианта добавить условные ответвления кода - это при помощи инструкции if и при помощи инструкции switch. Обычно мы используем инструкцию if, если наше условие достаточно простое и предусматривает всего несколько вариантов. А вот инструкция switch подходит для более сложных условий, с многими вариантами выбора, и очень полезна в ситуациях, где по найденному совпадению с условием и выбирается соответствующая ветка кода для исполнения."),
            
            Question(question: ["В каком случае инструкция if выполнит установленные инструкции?",
                                "Инструкция if выполнит набор инструкций только в этом случае",
                                "В каком случае будет выполняться тело инструкции if?"],
                     image: "",
                     optionA: "Условие true",
                     optionB: "Условие false",
                     optionC: "В любом случае",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 415,
                     helpText: "В самой простой своей форме инструкция if имеет всего одно условие if. Эта инструкция выполняет установленные инструкции только в случае, когда условие true."),
            
            Question(question: ["Если в инструкции if условие будет равно false, можно использовать это ключевое слово",
                                "Дополнительная ветка инструкции if",
                                "Дополнительные инструкции if указываются через это ключевое слово"],
                     image: "",
                     optionA: "else",
                     optionB: "also",
                     optionC: "another",
                     optionD: "but",
                     correctAnswer: 1,
                     questionId: 416,
                     helpText: "Инструкция if может предусматривать еще один дополнительный набор инструкций в ветке известной как оговорка else, которая нужна в случае, если условие false. Эти инструкции указываются через ключевое слово else."),
            
            Question(question: ["Если внутри инструкции switch, при сравнении по шаблонам, мы нашли совпадение - пройдет ли сравнение дальше, по остальным шаблонам?",
                                "Будут ли проверяться все оставшиеся шаблоны внутри инструкции switch, если мы уже нашли совпадение?",
                                "Если мы нашли совпадение внутри switch, будут ли проверяться все оставшиеся шаблоны на совпадение?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "Будет проверяться default",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 417,
                     helpText: "Инструкция switch подразумевает наличие какого-то значения, которое сравнивается с несколькими возможными шаблонами. После того как значение совпало с каким-либо шаблоном, выполняется код, соответствующий ответвлению этого шаблона, и больше сравнений уже не происходит. Switch представляет собой альтернативу инструкции if, отвечающей нескольким потенциальным значениям."),
            
            Question(question: ["Случай default, внутри инструкции switch, является обязательным?",
                                "Является ли случай default внутри switch обязательным для использования?",
                                "Обязаны ли мы каждый раз, используя switch-case, писать внутри default-случай?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 418,
                     helpText: "Каждая инструкция switch должна быть исчерпывающей. То есть это значит, что каждое значение обязательно должно находить совпадение с шаблоном в каком-либо случае (case). Если неудобно вписывать все возможные варианты случаев, то вы можете определить случай по умолчанию, который включает в себя все значения, которые не были включены в остальные случаи. Такой случай по умолчанию называется default, и он всегда идет после всех остальных случаев."),
            
            Question(question: ["Какое отличие есть у инструкции switch-case в Swift от switch-case в Objective-C?",
                                "У switch-case в Swift и Objective-C есть одно важное различие, какое?"],
                     image: "",
                     optionA: "Отсутствие case-провалов",
                     optionB: "Отсутствие default случая",
                     optionC: "Ограниченное кол-во условий",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 419,
                     helpText: "Большое отличие инструкции switch в языке Swift от инструкции switch в C и Objective-C составляет отсутствие провалов через условия. Вместо этого инструкция switch прекращает выполнение после нахождения первого соответствия с case и выполнения соответствующего кода в ветке, без необходимости явного вызова break. Это делает инструкцию switch более безопасным и простым для использования, чем в C, и исключает исполнение кода более чем одного случая."),
            
            Question(question: ["Можем ли мы использовать оператор break внутри switch-case?",
                                "Хоть оператор break и не является обязательным внутри switch в Swift, можем ли мы его использовать?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 420,
                     helpText: "Хотя break не требуются внутри switch в Swift, вы все равно можете его использовать для соответствия и для игнорирования конкретного случая или просто для выхода из конкретного случая, еще до того, как исполнится код."),
            
            Question(question: ["Что обязательно должно содержаться внутри каждого случая switch-case?",
                                "Внутри каждого случая switch-case обязательно должно содержаться это"],
                     image: "",
                     optionA: "Исполняемое выражение",
                     optionB: "Условие",
                     optionC: "Сравнение",
                     optionD: "print()",
                     correctAnswer: 1,
                     questionId: 421,
                     helpText: "Тело каждого случая должно включать в себя хотя бы одно исполняемое выражение, иначе код не будет исполнен и выдаст ошибку компиляции."),
            
            Question(question: ["Чем разделяются значения внутри составного case в инструкции switch?",
                                "Внутри инструкции switch можно использовать составные кейсы, чем разделять их значения?"],
                     image: "",
                     optionA: "Запятая",
                     optionB: "Обратный слеш",
                     optionC: "Нижнее подчеркивание",
                     optionD: "Точка с запятой",
                     correctAnswer: 1,
                     questionId: 422,
                     helpText: "Для того, чтобы switch с одним кейсом подходил под \"a\" и \"A\",объедините два значения в один составной кейс, разделив значения запятыми."),
            
            Question(question: ["Что выводится в консоль?",
                                "Какая цифра печатается в консоль?"],
                     image: "ControlFlow23",
                     optionA: "2",
                     optionB: "1",
                     optionC: "3",
                     optionD: "4",
                     correctAnswer: 1,
                     questionId: 423,
                     helpText: "Правильный ответ: 2. Вы можете использовать кортежи для тестирования нескольких значений в одной и той же инструкции switch. Каждый элемент кортежа может быть протестирован с любой величиной или с диапазоном величин. Так же вы можете использовать идентификатор подчеркивания (_) для соответствия любой возможной величине. Пример на изображении берет точку с координатами (x, y), выраженную в виде кортежа (Int, Int) и относит к соответствующей категории."),
            
            Question(question: ["Если при проверке по switch-case ваше значение совпадает с несколькими проверяемыми шаблонными, как поведет себя инструкция в таком случае?",
                                "Если ваше значение частично совпадает с несколькими случаями вашего switch-case, что произойдет?",
                                "При множественном совпадении вашего значения со случаями инструкции switch-case что будет происходить?"],
                     image: "",
                     optionA: "Исполнит первое совпадение",
                     optionB: "Исполнит любое совпадение",
                     optionC: "Исполнит последнее совпадение",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 424,
                     helpText: "В отличии от C, инструкция switch в Swift позволяет множественное совпадение или пересечение значений нескольких случаев. Если возможно совпадение сразу с несколькими шаблонами, то в расчет принимается только первое из них, а остальные случаи будут проигнорированы."),
            
            Question(question: ["Используем связывание значений, какой будет результат в консоли?",
                                "Что выводится в консоль при использовании связывания значений?",
                                "Связываем значения кортежа при использовании switch, что покажет консоль?"],
                     image: "ControlFlow25",
                     optionA: "Значение 2",
                     optionB: "Значение 0",
                     optionC: "Значения 2, 0",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 425,
                     helpText: "Кейс в инструкции switch может связывать значение или значения, с которыми сравнивается, с временными константами или переменными. Три случая в инструкции switch объявляют константы x, y, которым временно присваиваются значения одного или обоих элементов из кортежа point. В первом кейсе (let x, 0): подойдет любая точка со значением y равным 0, а в константу x запишется значение координаты x нашей точки. Аналогично и во втором случае, когда case (0, let y), этот кейс включает все точки при значении их координаты x равной 0, и происходит присваивание значения координаты y в временную константу y. Объявленная константа может быть использована внутри блока кейса. Здесь мы их используем как сокращенный вариант для вывода сообщения с помощью функции print."),
            
            Question(question: ["Почему на данном примере мы не используем случай default?",
                                "Случай default не используется, почему?",
                                "Именно поэтому мы не используем здесь случай default"],
                     image: "ControlFlow25",
                     optionA: "Инструкция исчерпывающая",
                     optionB: "Потому что она необязательная",
                     optionC: "Мы используем связывание значений",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 426,
                     helpText: "Инструкция switch не имеет случая default. Последний кейс let (x, y) объявляет кортеж двух констант плейсхолдеров, которые могут соответствовать абсолютно любому значению. Так как anotherPoint это кортеж с двумя значениями, этот кейс подходит под все возможные оставшиеся значения, и кейс default уже не нужен, так как инструкция switch исчерпывающая."),
            
            Question(question: ["Можем ли мы писать составные кейсы на несколько строк?"],
                     image: "ControlFlow28",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 428,
                     helpText: "Шаблоны в кейсе могут быть записаны на несколько строк, если их очень много."),
            
            Question(question: ["Могут ли составные кейсы включать в себя привязку значения?",
                                "Составные кейсы могут содержать привязку значения, так ли это?",
                                "Можем ли мы употреблять привязку значения внутри составного кейса в switch?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 429,
                     helpText: "Составные кейсы так же могут включать в себя привязку значения. Все шаблоны составных кейсов должны включать в себя тот же самый набор значений и каждая связка должна быть одного и того же типа из всех шаблонов составного кейса. Это гарантирует тот факт, что независимо от того, какая часть составного кейса совпала со сравниваемым значением, код в теле всегда получит доступ к значению  привязки и это значение всегда будет одного типа."),
            
            Question(question: ["Что выводится в консоль?"],
                     image: "ControlFlow30",
                     optionA: "9",
                     optionB: "0",
                     optionC: "default",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 430,
                     helpText: "Кейс выше имеет два шаблона: (let x, 0) и (0, let x). И тот и другой шаблон включают в себя привязку для x и x является целочисленным значением для двух этих шаблонов, что значит, что код внутри тела кейса всегда будет иметь доступ к значению x."),
            
            Question(question: ["Сколько операторов передачи управления есть в Swift?",
                                "В Swift есть именно столько операторов передачи управления",
                                "Какое количество операторов передачи управления поддерживает Swift?"],
                     image: "",
                     optionA: "Пять",
                     optionB: "Четыре",
                     optionC: "Три",
                     optionD: "Два",
                     correctAnswer: 1,
                     questionId: 431,
                     helpText: "Операторы передачи управления меняют последовательность выполнения вашего кода, передавая управление от одного фрагмента кода другому. В Swift есть пять операторов передачи управления: continue, break, fallthrough, return, throw."),
            
            Question(question: ["Какой оператор передачи управления говорит циклу прекратить текущую итерацию и начать новую?",
                                "Этот оператор передачи управления говорит циклу: \"Я закончил с текущей итерацией, можем переходить к следующей\"",
                                "Завершает текущую итерацию цикла, но полностью не выходит, а начинает новую. Про какой оператор передачи управления идет речь?"],
                     image: "",
                     optionA: "continue",
                     optionB: "break",
                     optionC: "fallthrough",
                     optionD: "return",
                     correctAnswer: 1,
                     questionId: 432,
                     helpText: "Оператор continue говорит циклу прекратить текущую итерацию и начать новую. Он как бы говорит: \"Я закончил с текущей итерацией\", но полностью из цикла не выходит."),
            
            Question(question: ["Этот оператор управления останавливает выполнение всей инструкции управления потоком",
                                "Какой оператор управления может быть использован внутри switch или внутри цикла, когда вы хотите остановить дальнейшее выполнение?",
                                "Если вы хотите остановить дальнейшее выполнение инструкции или цикла, какой оператор передачи управления можем вам помочь?"],
                     image: "",
                     optionA: "break",
                     optionB: "continue",
                     optionC: "fallthrough",
                     optionD: "return",
                     correctAnswer: 1,
                     questionId: 433,
                     helpText: "Оператор break останавливает выполнение всей инструкции управления потоком. Оператор break может быть использован внутри инструкции switch или внутри цикла, когда вы хотите остановить дальнейшее выполнение switch или цикла раньше, чем он должен закончиться сам по себе."),
            
            Question(question: ["Когда оператор управления break выполняется внутри цикла, произойдет ли следующая итерация?",
                                "Произойдет ли следующая итерация, если оператор управления break выполняется внутри цикла?",
                                "Если оператор управления break выполняется внутри цикла, начинается новая итерация, так ли это?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 434,
                     helpText: "Когда оператор break используется внутри цикла, то он немедленно прекращает работу цикла, и выполнение кода продолжается с первой строки после закрывающей скобки цикла (}). Никакой последующий код из текущей итерации цикла выполняться не будет, и никакие дальнейшие итерации цикла не будут запускаться."),
            
            Question(question: ["Когда оператор break выполняется внутри switch-case, что произойдет?",
                                "Что произойдет, если оператор управления break выполняется внутри switch-case?",
                                "Если оператор управления break выполняется внутри switch, что произойдет дальше?"],
                     image: "",
                     optionA: "Завершается работа switch",
                     optionB: "Переходим к следующему case",
                     optionC: "Начинаем сравнение сначала",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 435,
                     helpText: "Когда оператор break используется внутри инструкции switch, то он прекращает исполнение кода конкретного случая и перекидывает исполнение на первую строку после закрывающей скобки (}) инструкции switch. Так же оператор break может использоваться для сопоставления или игнорирования кейсов в инструкции switch. Так как инструкция switch исчерпывающая и не допускает пустых кейсов, то иногда бывает необходимо умышленно соответствовать или игнорировать кейсы для того, чтобы сделать ваши намерения ясными. Вы делаете это, когда пишите слово break в теле кейса, который вы хотите пропустить. Когда этот кейс попадает под сравнение, то break сразу завершает работу всей инструкции switch."),
            
            Question(question: ["Чтобы проигнорировать какой-либо кейс в switch, мы можем написать в теле кейса комментарий, так ли это? Если нет, что произойдет?",
                                "Если в теле кейса внутри switch мы напишем комментарий, что произойдет при запуске?"],
                     image: "",
                     optionA: "Ошибка компиляции",
                     optionB: "Ничего не произойдет",
                     optionC: "Приложение успешно скомпилируется",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 436,
                     helpText: "Кейс в инструкции switch, который содержит только комментарий, при компиляции выдает ошибку компиляции. Комментарии - это не утверждения, и они не дают возможности игнорировать кейсы. Если вы хотите игнорировать кейс switch, используйте break."),
            
            Question(question: ["Какой оператор управления поможет вам сделать проваливание в следующий кейс внутри switch?",
                                "Проваливание в следующий кейс внутри switch вам поможет осуществить этот оператор управления",
                                "Именно этот оператор управления потоком поможет вам провалиться в следующий кейс switch независимо от совпадения"],
                     image: "",
                     optionA: "fallthrough",
                     optionB: "continue",
                     optionC: "throw",
                     optionD: "return",
                     correctAnswer: 1,
                     questionId: 437,
                     helpText: "Если вам по какой-то причине нужно аналогичное проваливание в следующий кейс внутри switch, как в C, то вы можете использовать оператор fallthrough в конкретном кейсе."),
            
            Question(question: ["Можем ли мы создавать вложенные циклы?",
                                "Можем ли мы создавать вложенные инструкции switch?",
                                "Можем ли мы создавать цикл в цикле и switch внутри другого switch?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 438,
                     helpText: "Вы можете размещать циклы или инструкции switch внутри других циклов или switch инструкций, создавая тем самым сложное течение исполнения кода. Однако циклы и инструкции switch могут иметь break, что может прервать выполнение кода преждевременно."),
            
            Question(question: ["Инструкция guard выполняет код внутри скобок только тогда, когда ее условие...?",
                                "guard: инструкция раннего выхода, выполняет код в зависимости от логического значения ее условия, какого?",
                                "При каком значении условия выполняется тело инструкции guard?"],
                     image: "",
                     optionA: "false",
                     optionB: "true",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 439,
                     helpText: "Инструкция guard, как и инструкция if, выполняет выражения в зависимости от логического значения условия. Используйте guard, чтобы указать на то, что условие обязательно должно быть true, чтобы код после самой инструкции guard выполнился. В отличии от инструкции if, guard всегда имеет код внутри else, который выполняется, когда условие оценивается как false."),
            
            Question(question: ["Если условие инструкции guard выполнилось, будет ли исполняться кода внутри фигурных скобок?",
                                "Если условие guard дает нам true, будет ли исполняться блок кода в else?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 440,
                     helpText: "Если условие инструкции guard выполнилось, то выполнение кода продолжается после закрывающей скобки guard. Все переменные и константы, которым мы присвоили значения с использованием опциональной привязки в качестве части условия guard, доступны нам до конца области, где был определен guard. Если условие не выполняется, то исполняется код внутри else. Эта ветка должна перебросить исполнение кода на выход из этого блока кода, в котором был определен guard. А сделать это можно при помощи инструкций return, break, continue, throw или можно вызвать метод, который ничего не возвращает, например fatalError(_file:line:)."),
            
            Question(question: ["Если требования позволяют, предпочтительнее использовать инструкцию if или инструкцию guard?",
                                "Предпочтительнее использовать инструкцию if или инструкцию guard, если позволяют требования?"],
                     image: "",
                     optionA: "guard",
                     optionB: "if",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 441,
                     helpText: "Использование инструкции guard для каких-либо требований улучшает читабельность кода по сравнению с if. Он помогает вам написать код, который вам не нужно будет помещать в блок else и позволит вам держать код, который обрабатывает нарушение требований рядом с самими требованиями."),
            
            Question(question: ["Какое значение будет у переменной result?"],
                     image: "ControlFlow42",
                     optionA: "2",
                     optionB: "0",
                     optionC: "1",
                     optionD: "3",
                     correctAnswer: 1,
                     questionId: 442,
                     helpText: "Правильный ответ: 2. Когда мы обязательно попадем в первый кейс switch-case, мы изменим значение переменной и дальше \"провалимся\" в следующий кейс с помощью оператора falltrough, и там изменим значение переменной второй раз"),
            //
            //            Question(question: ["",
            //                                "",
            //                                ""],
            //                     image: "",
            //                     optionA: "",
            //                     optionB: "",
            //                     optionC: "",
            //                     optionD: "",
            //                     correctAnswer: 1,
            //                     questionId: 443,
            //                     helpText: ""),
            //
            //            Question(question: ["",
            //                                "",
            //                                ""],
            //                     image: "",
            //                     optionA: "",
            //                     optionB: "",
            //                     optionC: "",
            //                     optionD: "",
            //                     correctAnswer: 1,
            //                     questionId: 444,
            //                     helpText: ""),
        ]
    }
}
