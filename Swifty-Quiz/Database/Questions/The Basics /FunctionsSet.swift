
//  Created by Евгений Никитин on 11.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class FunctionsSet {
	static func getQuestions() -> [Question] {
		return [
			Question(question: ["Какие имена должны быть у функций?"],
					 image: "",
					 optionA: "Уникальные",
					 optionB: "Написанные на Русском",
					 optionC: "С заглавной буквы",
					 optionD: "Состоящие из 1 слова",
					 questionId: 451838698,
					 helpText: "Функции – это самостоятельные фрагменты кода, решающие определенную задачу. Каждой функции присваивается уникальное имя, по которому ее можно идентифицировать и вызвать в нужный момент."),
            
            Question(question: ["Как называется процесс обращения к функции?"],
                     image: "",
                     optionA: "Вызов функции",
                     optionB: "Идентификация функции",
                     optionC: "Создание функции",
                     optionD: "Функционирование",
                     questionId: 449009986,
                     helpText: "В общем случае функция — это именованный фрагмент программного кода, к которому можно многократно обращаться. Процесс обращения к функции называется вызовом функции. Для вызова функции необходимо написать ее имя и конструкцию из скобок."),
            
            Question(question: ["Функции позволяют избегать ..."],
                     image: "",
                     optionA: "Дублирования кода",
                     optionB: "Ошибок",
                     optionC: "Многократного вызова",
                     optionD: "",
                     questionId: 477101096,
                     helpText: "Функции позволяют избежать дублирования кода: они группируют часто используемый код с целью многократного обращения к нему по имени."),
            
            Question(question: ["Имеет ли Swift встроенные стандартные функции, которые вы можете использовать \"из коробки\"?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 729097813,
                     helpText: "Swift имеет большое количество стандартных функций, благодаря которым можно упростить и ускорить процесс разработки. Но так же вы можете создавать свои кастомные функции самостоятельно (под любую вашу задачу или проблему)."),
            
            Question(question: ["Какой аргумент при вызове принимает стандартная Swift функция print(_:)?"],
                     image: "",
                     optionA: "Безымянный",
                     optionB: "Никакой",
                     optionC: "print",
                     optionD: "",
                     questionId: 863338106,
                     helpText: "Если функция принимает входные аргументы, то это отражается в сигнатуре. print(_:) описывает функцию с именем print, которая принимает один входной безымянный аргумент. Если аргумент не имеет имени - вместо него ставится символ нижнего подчеркивания."),
            
            Question(question: ["Как называется краткое описание функции, которое содержит информацию об имени функции, ее аргументах и возвращаемом функцией значении?"],
                     image: "",
                     optionA: "Сигнатура",
                     optionB: "Мета-данные",
                     optionC: "Подпись",
                     optionD: "",
                     questionId: 439537098,
                     helpText: "Каждая функция имеет сигнатуру, то есть краткое описание. Сигнатура содержит информацию об имени функции, ее аргументах и возвращаемом функцией значении. Она может быть в одной из трех форм: 1. Полная, с указанием типов данных: someFunction(a:String, b: String) -> String, 2. Стандартная, без указания типов данных: someFunction(a: b:), 3. Краткая, с указанием только имени функции: someFunction"),
            
            Question(question: ["Судя по сигнатуре этой функции, сколько аргументов она принимает?"],
                     image: "Functions01",
                     optionA: "2",
                     optionB: "1",
                     optionC: "0",
                     optionD: "",
                     questionId: 731364078,
                     helpText: "Cигнатура someFunction(_:number:) указывает на функцию с именем someFunction, которой нужны два аргумента: первый не имеет имени, а второй должен быть передан с именем number. Пример вызова этой функции: someFunction(\"Hello, world!\", number: 42)"),
            
            Question(question: ["Могут ли функции изменять внешние переменные после выполнения?",
								"После своего выполнения функции могут изменять внешние переменные, так ли это?",
								"Возможно ли в языке Swift изменение внешних переменных после выполнения функции?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 792753993,
					 helpText: "Да, могут. Язык Swift предлагает достаточно гибкий единый синтаксис функций – от простых C-подобных функций без параметров до сложных методов в стиле Objective-C с локальными и внешними параметрами. Параметры могут служить как для простой инициализации значений внутри функции, так и для изменения внешних переменных после выполнения функции."),
			
			Question(question: ["Может ли функция быть результирующим значением другой функции?",
								"Функция может быть результирующим значением другой функции?",
								"Может ли функция быть результатом другой функции?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 753002784,
					 helpText: "Каждая функция в Swift имеет тип, описывающий тип параметров функции и тип возвращаемого значения. Тип функции можно использовать аналогично любым другим типам в Swift, т. е. одна функция может быть параметром другой функции либо ее результирующим значением. Функции также могут вкладываться друг в друга, что позволяет инкапсулировать определенный алгоритм внутри локального контекста."),
			
			Question(question: ["Может ли функция быть входным параметром другой функции?",
								"Функция может быть входным параметром другой функции?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 676657835,
					 helpText: "Каждая функция в Swift имеет тип, описывающий тип параметров функции и тип возвращаемого значения. Тип функции можно использовать аналогично любым другим типам в Swift, т. е. одна функция может быть параметром другой функции либо ее результирующим значением. Функции также могут вкладываться друг в друга, что позволяет инкапсулировать определенный алгоритм внутри локального контекста."),
			
			Question(question: ["Является ли обязательным добавление входных параметров и возвращаемого значения у функции?",
								"Нужно ли указывать входные данные и возвращаемое значение для каждой функции?",
								"Обязательно ли указывать каждой функции входные параметры и возвращаемое значение?"],
					 image: "",
					 optionA: "Нет",
					 optionB: "Да",
					 optionC: "Только входные параметры",
					 optionD: "Только возвращаемое значение",
					 questionId: 916453013,
					 helpText: "При объявлении функции можно задать одно или несколько именованных типизированных значений, которые будут ее входными данными (или параметрами), а также тип значения, которое функция будет возвращать в качестве результата (или возвращаемый тип). В некоторых случаях функции могут не иметь входных параметров. Вот пример функции без входных параметров, которая при вызове всегда возвращает одно и то же значение типа String: func sayHelloWorld() -> String { return \"hello, world\"}"),
			
			Question(question: ["Обязаны ли мы указывать имя функции?",
								"Каждой функции мы обязаны присвоить уникальное имя, так ли это?",
								"Каждая функция в Swift должна иметь имя, это так?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 791613962,
					 helpText: "У каждой функции должно быть имя, которое отражает решаемую задачу. Чтобы воспользоваться функцией, ее нужно \"вызвать\", указав имя и входные значения (аргументы), соответствующие типам параметров этой функции. Аргументы функции всегда должны идти в том же порядке, в каком они были указаны при объявлении функции."),
			
			Question(question: ["При объявлении функции мы указываем тип возвращаемого значения после этого знака",
								"После какого знака мы должны указывать тип возвращаемого значения функции?",
								"После этого знака мы можем указать тип возвращаемого функцией значения"],
					 image: "",
					 optionA: "->",
					 optionB: "-",
					 optionC: "=>",
					 optionD: ":",
					 questionId: 429649214,
					 helpText: "Тип возвращаемого значения функции ставится после результирующей стрелки -> (это дефис и правая угловая скобка)."),
			
			Question(question: ["Можем ли мы поместить вызов функции в print(_:separator:terminator:)?",
								"Можно ли поместить в print(_:separator:terminator:) вызов функции?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 111334718,
					 helpText: "Вызов функции может быть завернут в print(_:separator:terminator:), чтобы напечатать полученную строку и увидеть возвращаемое значение (будет полезно использовать, когда функция возвращает какое-либо значение)."),
			
			Question(question: ["Функция завершает свою работу после выполнения оператора return?",
								"После выполнения оператора return функция завершает свою работу?",
								"Если в теле функции срабатывает оператор управления return, функция завершает свою работу?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 622323441,
					 helpText: "После выполнения оператора return функция завершает свою работу и возвращает необходимое текущее значение."),
			
			Question(question: ["Можем ли мы вызывать одну функцию многократно?",
								"Поддерживается ли в Swift многократный вызов одной функции?",
								"Можем ли мы вызывать одну и ту же функцию с разными входными параметрами?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 184350507,
					 helpText: "Функцию можно вызывать многократно и с разными входными значениями."),
			
			Question(question: ["Каким ключевым словом функция обозначается в коде?"],
					 image: "",
					 optionA: "func",
					 optionB: "struct",
					 optionC: "var",
					 optionD: "switch",
					 questionId: 814760482,
					 helpText: "Ключевое слово для обозначения функции: func"),
			
			Question(question: ["Можно ли использовать составные имена для входных параметров функции?",
								"Для входных параметров функции мы можем использовать составные имена, так ли это?",
								"Можем ли мы использовать для входных параметров функции составные имена?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 895451906,
					 helpText: "В языке Swift параметры функций и возвращаемые значения реализованы очень гибко. Разработчик может объявлять любые функции – от простейших, с одним безымянным параметром, до сложных, со множеством параметров и составными именами."),
			
			Question(question: ["Должны ли мы писать пустые круглые скобки при объявлении и вызове функции, если у нее нет входных параметров?",
								"Если у функции нет входных параметров, должны ли мы писать пустые круглые скобки при ее объявлении и вызове?",
								"При объявлении и вызове функции без входные параметров мы должны ставить пустые круглые скобки, так ли это?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 388775978,
					 helpText: "Несмотря на отсутствие параметров, в объявлении функции все равно нужно ставить скобки после имени. При вызове после имени функции также указываются пустые скобки."),
			
			Question(question: ["Функция, которой не указали тип возвращаемого значения, возвращает значение? Если да, то какого типа?",
								"Если мы не указали значение возвращаемого типа, функция все же возвращает его, так ли это? Если да, то какого типа значение возвращается?"],
					 image: "",
					 optionA: "Да, Void",
					 optionB: "Да, Тип входного параметра",
					 optionC: "Да, String",
					 optionD: "Нет",
					 questionId: 946508186,
					 helpText: "Функция, даже если ей не указали тип возвращаемого значения, все же возвращает значение, хотя оно нигде и не указано. Функции, для которых не задан возвращаемый тип, получают специальный тип Void. По сути, это просто пустой кортеж, т. е. кортеж с нулем элементов, который записывается как ()."),
			
			Question(question: ["Если функция, для которой указан возвращаемый тип, заканчивается оператором, который ничего не возвращает, что получится?",
								"Если мы указали для функции тип возвращаемого значения, а на деле используем пустой return, что получится?"],
					 image: "",
					 optionA: "Ошибка компиляции",
					 optionB: "Ничего",
					 optionC: "Получим значение",
					 optionD: "nil",
					 questionId: 651100455,
					 helpText: "Хотя возвращаемые значения можно игнорировать, функция все же должна возвратить то, что задано в ее объявлении. Функция, для которой указан возвращаемый тип, не может заканчиваться оператором, который ничего не возвращает, иначе произойдет ошибка во время компиляции."),
			
			Question(question: ["Если нам нужно вернуть несколько значений из функции, какой тип мы должны указывать?",
								"Какой возвращаемый тип указать, чтобы мы могли вернуть несколько значений в виде составного параметра?",
								"Вернуть составной параметр, состоящий из нескольких значений из функции можно, указав этот тип"],
					 image: "",
					 optionA: "Кортеж",
					 optionB: "Массив",
					 optionC: "Множество",
					 optionD: "Void",
					 questionId: 888366477,
					 helpText: "Вы можете использовать кортежный тип в качестве возвращаемого типа для функции для возврата нескольких значений в виде составного параметра."),
			
			Question(question: ["Как мы можем объявить возвращаемый из функции тип как опциональный кортеж?",
								"Именно так вы можете объявить возвращаемый тип функции как опциональный кортеж"],
					 image: "",
					 optionA: "(Int, Int)?",
					 optionB: "(Int?, Int?)",
					 optionC: "(Int, Int)",
					 optionD: "",
					 questionId: 202628584,
					 helpText: "Если возвращаемый из функции кортеж может иметь \"пустое значение\", то его следует объявить как опциональный кортеж, т. е. кортеж, который может равняться nil. Чтобы сделать возвращаемый кортеж опциональным, нужно поставить вопросительный знак после закрывающей скобки:(Int, Int)? или (String, Int, Bool)?. Кортеж-опционал вида (Int, Int)? это не то же самое, что кортеж, содержащий опционалы: (Int?, Int?). Кортеж-опционал сам является опционалом, но не обязан состоять из опциональных значений."),
			
			Question(question: ["Где пишется ярлык аргумента у параметра функции?",
								"Где вы можете записать ярлык аргумента у входного параметра вашей функции?"],
					 image: "",
					 optionA: "Перед именем параметра",
					 optionB: "После имени параметра",
					 optionC: "Можно и так и так",
					 optionD: "",
					 questionId: 649508590,
					 helpText: "Вы пишите ярлык аргумента перед именем параметра через пробел"),
			
			Question(question: ["Как вы можете обратиться ко второму входному параметру в теле функции?"],
					 image: "Functions19",
					 optionA: "second",
					 optionB: "and",
					 optionC: "and second",
					 optionD: "",
					 questionId: 452256315,
					 helpText: "Правильный ответ: second. Каждый параметр функции имеет ярлык аргумента (указывается первым) и имя параметра (указывается вторым). Ярлык аргумента используется при вызове функции. Имя параметра используется при реализации функции (то есть в теле вашей функции). По умолчанию, если ярлыки входящих параметров не указаны, при вызове функции используются имена параметров."),
			
			Question(question: ["При вызове функции, как мы обратимся ко второму входному параметру?",
								"Как вы сможете обратиться ко второму входному параметру при вызове функции?"],
					 image: "Functions19",
					 optionA: "and",
					 optionB: "second",
					 optionC: "and second",
					 optionD: "",
					 questionId: 454169907,
					 helpText: "Правильный ответ: and. Каждый параметр функции имеет ярлык аргумента (указывается первым) и имя параметра (указывается вторым). При вызове функции используется именно ярлык аргумента. Использование ярлыков аргументов позволяет функции вызываться в более выразительной манере, в виде предложения, при этом все же предоставляя тело функции в более читаемом виде и с более понятными намерениями."),
			
			Question(question: ["Как мы можем упразднить ярлык аргумента для входящего параметра функции?",
								"Этим знаком вы можете сделать ярлык аргумента параметра вашей функции не обязательным при вызове"],
					 image: "",
					 optionA: "Нижнее подчеркивание (_)",
					 optionB: "Пробел ( )",
					 optionC: "Двойные кавычки",
					 optionD: "Ярлык всегда обязателен",
					 questionId: 657027416,
					 helpText: "Если вы не хотите использовать ярлык аргумента в качестве параметра, используйте подчеркивание (_) вместо явного ярлыка аргумента для этого параметра. Если у параметра есть ярлык аргумента, то аргумент должен иметь ярлык при вызове функции."),
			
			Question(question: ["Можно ли присвоить значение по умолчанию для входящего параметра вашей функции?",
								"Для входящих параметров функции мы можем присваивать значения по умолчанию, так ли это?",
								"Мы можем присваивать значения по умолчанию для входящих параметров нашей функции, это так?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 291974566,
					 helpText: "При объявлении функции любому из ее параметров можно присвоить значение по умолчанию. Если у параметра есть значение по умолчанию, то при вызове функции этот параметр можно опустить."),
			
			Question(question: ["Можем ли мы опустить один или несколько параметров при вызове функции, если у них есть значение по умолчанию?",
								"Если у параметров функции есть значения по умолчанию, можем ли мы их опустить при вызове функции?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 974042495,
					 helpText: "Если у параметра есть значение по умолчанию, то при вызове функции этот параметр можно опустить. Расположите параметры, у которых нет дефолтных значений в начале списка параметров функции до параметров с дефолтными значениями. Параметры, не имеющие значения по умолчанию, как правило, более важны для значения функции - их запись в первую очередь облегчает распознавание функции уже вызванной ранее, независимо от того, опущены ли какие-то параметры по умолчанию."),
			
			Question(question: ["В каком варианте корректно написан вариативный входящий параметр функции?",
								"Каким образом мы можем сделать входящий параметр функции вариативным?",
								"Где указан правильно используемый вариативный параметр функции?"],
					 image: "",
					 optionA: "func list(names: String...) { }",
					 optionB: "func list(names: ...String) { }",
					 optionC: "func list(names: String!) { }",
					 optionD: "",
					 questionId: 196087114,
					 helpText: "Вариативным называют параметр, который может иметь сразу несколько значений или не иметь ни одного. С помощью вариативного параметра можно передать в функцию произвольное число входных значений. Чтобы объявить параметр как вариативный, нужно поставить три точки (...) после его типа."),
			
			Question(question: ["В каком виде внутри функции доступны вариативные параметры?",
								"Внутри функции вариативные параметры доступны именно в таком виде",
								"В каком виде вы можете использовать вариативный входящий параметр внутри функции?"],
					 image: "",
					 optionA: "Массив соответствующего типа",
					 optionB: "Набор",
					 optionC: "Кортеж значений",
					 optionD: "Множество значений",
					 questionId: 701827455,
					 helpText: "Значения, переданные через вариативный параметр, доступны внутри функции в виде массива соответствующего типа. Например, вариативный параметр numbers типа Double... доступен внутри функции в виде массива-константы numbers типа [Double]."),
			
			Question(question: ["Может ли ваша функция иметь несколько вариативных параметров?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 314284635,
					 helpText: "До Swift 5.4 - У функции мог быть только один вариативный параметр, с обновлением версии до 5.4 - их может быть несколько. С этим улучшением мы могли бы написать функцию, которая принимает переменный параметр, хранящий время, когда голы были забиты во время футбольного матча, плюс второй вариативный параметр, хранящий имена игроков отличившихся голом: func summarizeGoals(times: Int..., players: String...) { }"),
			
			Question(question: ["Если вы попытаетесь в теле функции изменить ее входящий параметр, что произойдет?",
								"Что получится, если попытаться изменить входящий параметр функции в ее теле?",
								"При попытке изменить входящий параметр функции в ее теле, что произойдет?"],
					 image: "",
					 optionA: "Ошибка компиляции",
					 optionB: "Значение изменится",
					 optionC: "Значение не изменится",
					 optionD: "",
					 questionId: 410134076,
					 helpText: "Параметры функции по умолчанию являются константами. Попытка изменить значение параметра функции из тела этой функции приводит к ошибке компиляции. Это означает, что вы не сможете изменить значение параметра по ошибке."),
			
			Question(question: ["Что нужно сделать, чтобы функция изменила значение параметра, и чтобы эти изменения сохранились после того, как закончился вызов функции?",
								"Чтобы функция изменила значение параметра или параметров, и чтобы эти изменения сохранились после того, как закончится выполнение функции, что нужно сделать?"],
					 image: "",
					 optionA: "Объявить параметры сквозными",
					 optionB: "Опустить ярлыки аргументов (_)",
					 optionC: "Объявить параметры опциональными",
					 optionD: "Так сделать нельзя",
					 questionId: 771330511,
					 helpText: "Если вы хотите, чтобы функция изменила значение параметра, и вы хотите, чтобы эти изменения сохранились после того, как закончился вызов функции, определите этот параметр в качестве сквозного параметра. Для создания сквозного параметра нужно поставить ключевое слово inout перед объявлением параметра. Сквозной параметр передает значение в функцию, которое затем изменяется в ней и возвращается из функции, заменяя исходное значение."),
			
			Question(question: ["Что вы можете передать в качестве аргумента для сквозного параметра?",
								"В качестве аргумента для сквозного параметра мы можем передать это"],
					 image: "",
					 optionA: "Переменную",
					 optionB: "Константу",
					 optionC: "Литерал",
					 optionD: "",
					 questionId: 621356966,
					 helpText: "Вы можете передать только переменную в качестве аргумента для сквозного параметра. Вы не можете передать константу или значения литерала в качестве аргумента, так как константы и литералы не могут быть изменены. Вы ставите амперсанд (&) непосредственно перед именем переменной, когда передаете ее в качестве аргумента сквозного параметра, чтобы указать, что он может быть изменен с помощью функции."),
			
			Question(question: ["Могут ли сквозные входящие параметры функции иметь значения по умолчанию?",
								"Могут ли вариативные параметры функции быть сквозными?",
								"Могут ли сквозные параметры иметь значения по умолчанию, а вариативные параметры быть сквозными?"],
					 image: "",
					 optionA: "Нет",
					 optionB: "Да",
					 optionC: "",
					 optionD: "",
					 questionId: 151115720,
					 helpText: "Сквозные параметры не могут иметь значения по умолчанию, а вариативные параметры не могут быть сквозными."),
			
			Question(question: ["Можем ли мы создать переменную с функциональным типом, например (Int, Int) -> Int?",
								"Мы можем создавать переменные с функциональным типом, например (Double, Double) -> String, так ли это?",
								"Возможно создать переменную, у которой будет функциональный тип (Bool, Int) -> Bool?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 620017730,
					 helpText: "В Swift с функциональными типами можно работать так же, как и с другими типами. Например, можно объявить константу или переменную функционального типа и присвоить ей функцию соответствующего типа. После присвоения переменной функции - вы можете вызывать функцию через вызов этой переменной (с передачей входящих параметров в круглых скобках)."),
			
			Question(question: ["Можем ли мы использовать функциональные типы как типы входящих параметров другой функции?",
								"Можете ли вы использовать функциональный тип как тип входного параметра функции?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 322723479,
					 helpText: "Функциональные типы наподобие (Int, Int) -> Int могут быть типами параметров другой функции. Это позволяет определять некоторые аспекты реализации функции непосредственно во время ее вызова."),
			
			Question(question: ["Можем ли мы объявлять вложенные функции?",
								"Можем ли мы создавать не глобальные, а вложенные функции?",
								"Можете ли вы создать вложенную функцию, которая будет доступна только внутри родительской?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 641227091,
					 helpText: "Помимо глобальных можно объявлять и функции, находящиеся внутри других функций, или же вложенные. Вложенные функции по умолчанию недоступны извне, а вызываются и используются только заключающей функцией."),
			
			Question(question: ["Каким образом мы можем получить доступ к вложенной функции?",
								"Как мы можем получить доступ к не глобальной, вложенной функции?",
								"Мы можем получить доступ к вложенной функции таким путем"],
					 image: "",
					 optionA: "Через возвращаемое значение",
					 optionB: "Обратиться напрямую",
					 optionC: "Через сквозные параметры",
					 optionD: "Не можем",
					 questionId: 384371509,
					 helpText: "Заключающая функция может возвращать одну из вложенных, чтобы вложенную функцию можно было использовать за ее пределами."),
			
			Question(question: ["Если код скомпилируется, что выводится в консоль?",
								"Если эта функция сработает, что выведет в консоль?",
								"Что мы получим в консоль, если код сработает?"],
					 image: "Functions35",
					 optionA: "Hello, Alexey!",
					 optionB: "Hello + Alexey + !",
					 optionC: "Alexey",
					 optionD: "Столкнемся с ошибкой",
					 questionId: 342627424,
					 helpText: "Правильный ответ: \"Hello, Alexey!\"."),
			
			Question(question: ["Если код скомпилируется, что выводится в консоль?",
								"Если эта функция сработает, что выведет в консоль?",
								"Что мы получим в консоль, если код сработает?"],
					 image: "Functions36",
					 optionA: "Hello, Maria!",
					 optionB: "Hello + Maria + !",
					 optionC: "Maria!",
					 optionD: "Столкнемся с ошибкой",
					 questionId: 175292522,
					 helpText: "Правильный ответ: \"Hello, Maria!\"."),
			
			Question(question: ["Если код скомпилируется, что выводится в консоль?",
								"Если эта функция сработает, что выведет в консоль?",
								"Что мы получим в консоль, если код скомпилируется?"],
					 image: "Functions37",
					 optionA: "Hello again, Maria!",
					 optionB: "Hello, Maria!",
					 optionC: "Hello again + Maria + !",
					 optionD: "Ошибка компиляции",
					 questionId: 729016258,
					 helpText: "Правильный ответ: \"Hello again, Maria!\"."),
			
			Question(question: ["Что выводится в консоль?"],
					 image: "Functions38",
					 optionA: "hello, world!",
					 optionB: "Ничего",
					 optionC: "12",
					 optionD: "13",
					 questionId: 580344628,
					 helpText: "Правильный ответ: \"hello, world!\". В консоль выведется именно это, возвращаемое значение функции мы не выводим в консоль. Оно просто есть, но не используется при вызове."),
			
			Question(question: ["Что выводится в консоль?"],
					 image: "Functions39",
					 optionA: "hello, world и 12",
					 optionB: "hello, world",
					 optionC: "hello, world! и 13",
					 optionD: "Ничего",
					 questionId: 427457343,
					 helpText: "Правильный ответ: \"hello, world и 12\". Мы выводим и фразу внутри функции, через print(), и возвращаемое значение 12 (количество отдельных символов в нашей фразе)."),
			
			Question(question: ["Если данный код сработает, что выводится в консоль?"],
					 image: "Functions40",
					 optionA: "Столкнемся с ошибкой",
					 optionB: "Ничего",
					 optionC: "10",
					 optionD: "",
					 questionId: 859367756,
					 helpText: "Ничего не выводится в консоль, поскольку мы получим ошибку. Мы игнорируем ярлык аргумента у входящей функции first, если мы укажем название входящего параметра - код не запустится. Ошибка: Extraneous argument label 'first:' in call."),
			
			Question(question: ["Какое значение будет в консоли?",
								"В консоль выведется это значение"],
					 image: "Functions41",
					 optionA: "5",
					 optionB: "12",
					 optionC: "5, 5",
					 optionD: "Никакое",
					 questionId: 890214445,
					 helpText: "Правильный ответ: 5. Когда при вызове функции мы передаем новое значение входному параметру, у которого есть значение по умолчанию, оно изменяется на новое."),
			
			Question(question: ["Какое значение будет в консоли?",
								"В консоль выведется это значение"],
					 image: "Functions42",
					 optionA: "12",
					 optionB: "5",
					 optionC: "5, 5",
					 optionD: "Столкнемся с ошибкой",
					 questionId: 921774154,
					 helpText: "Правильный ответ: 12. При объявлении функции любому из ее параметров можно присвоить значение по умолчанию. Если у параметра есть значение по умолчанию, то при вызове функции этот параметр можно опустить."),
			
			Question(question: ["В каком порядке значения будут в консоли?",
								"В консоль выводятся значения в таком порядке"],
					 image: "Functions43",
					 optionA: "107 и 3",
					 optionB: "3 и 107",
					 optionC: "107 и 107",
					 optionD: "Столкнемся с ошибкой",
					 questionId: 922878985,
					 helpText: "Правильный ответ: 107 и 3. Внутри функции значения переменных first и second поменяются, а так как они являются сквозными - то исходные переменные так же получат новые значения.")
		]
	}
}
