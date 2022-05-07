
//  Created by Евгений Никитин on 12.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class AccessControlSet {
	static func getQuestions() -> [Question] {
		return [
            Question(question: [
                "Что позволяет делать контроль доступа в Swift?",
                "Вы можете делать это с помощью контроля доступа в Swift"
            ],
                     image: "",
                     optionA: "Ограничить доступ к коду",
                     optionB: "Подсчитывать ссылки",
                     optionC: "Управлять памятью",
                     optionD: "",
                     questionId: 961500502,
                     helpText: "Контроль доступа ограничивает доступ к частям вашего кода из кода других исходных файлов и модулей. Эта особенность позволяет вам прятать детали реализации вашего кода и указывать на предпочтительный интерфейс, через который можно получить доступ к вашему коду."),
            
            Question(question: [
                "Можем ли мы присваивать определенные уровни доступа классам?",
                "Можем ли мы присваивать определенные уровни доступа структурам?",
                "Можем ли мы присваивать определенные уровни доступа перечислениям?",
                "Можем ли мы присваивать определенные уровни доступа свойствам?",
                "Можем ли мы присваивать определенные уровни доступа методам?",
                "Можем ли мы присваивать определенные уровни доступа инициализаторам?",
                "Можем ли мы присваивать определенные уровни доступа сабскриптам?",
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 374038153,
                     helpText: "Вы можете присвоить определенные уровни доступа как к индивидуальным типам (классы, структуры и перечисления), так и к свойствам, методам, инициализаторам и сабскриптам, принадлежащим этим типам. Протоколы могут быть ограничены в определенном контексте, так же как могут быть ограничены глобальные переменные или функции."),
            
            Question(question: [
                "Могут ли протоколы быть ограничены в определенном контексте?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 662544892,
                     helpText: "Вы можете присвоить определенные уровни доступа как к индивидуальным типам (классы, структуры и перечисления), так и к свойствам, методам, инициализаторам и сабскриптам, принадлежащим этим типам. Протоколы могут быть ограничены в определенном контексте, так же как могут быть ограничены глобальные переменные или функции."),
            
            Question(question: [
                "Swift обеспечивает уровни доступа по умолчанию для типичных сценариев. Так ли это?",
                "Можете ли вы обойтись без явного указания контроля доступа при написании своего приложения?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 716271944,
                     helpText: "Swift уменьшает необходимость указания явного уровня контроля доступа тем, что сам обеспечивает уровни доступа по умолчанию для типичных сценариев. И на самом деле, если вы пишете простое приложение, то вам может и не понадобится указывать явно уровень контроля доступа вообще."),
            
			Question(question: [
                "Единый блок распределения кода - фреймворк или приложение",
            ],
					 image: "",
					 optionA: "Модуль",
					 optionB: "Элемент",
					 optionC: "Ядро",
					 optionD: "Фреймворк",
					 questionId: 359058512,
					 helpText: "Модуль представляет из себя единый блок распределения кода - фреймворк или приложение, которое построено и поставляется в качестве единого блока и которое может быть импортировано другим модулем с ключевым словом import. Если вы объедините вместе аспекты кода вашего приложения в качестве отдельного фреймворка, то их возможно будет инкапсулировать и использовать заново во множестве других приложений. Таким образом, все, что вы определите в рамках этого фреймворка будет считаться частью отдельного модуля, когда это будет импортировано и использовано внутри приложения, или когда это будет использовано внутри другого фреймворка."),
			
			Question(question: [
                "Ключевое слово для подключения модуля к контроллеру",
                "Каким ключевым словом можно подключить модули в контроллере?"
            ],
					 image: "",
					 optionA: "import",
					 optionB: "add",
					 optionC: "func",
					 optionD: "invite",
					 questionId: 632206721,
					 helpText: "Правильный ответ: import."),
			
			Question(question: [
                "Как называется исходный код файла в пределах одного модуля?"
            ],
					 image: "",
					 optionA: "Исходный файл",
					 optionB: "Источник",
					 optionC: "Нулевой пациент",
					 optionD: "Фреймворк",
					 questionId: 519139989,
					 helpText: "Исходный файл - исходный код файла в пределах одного модуля (в сущности это и есть один файл вашего приложения или фреймворка). Хотя в большинстве случаев определение типов происходит в отдельных исходных файлах, но фактически исходный файл может содержать определения множества различных типов, функций и т.д."),
			
			Question(question: [
                "Сколько различных уровней доступа предлагает Swift?",
                "Какое количество разных уровней доступа предлагает Swift для объектов вашего кода?"
            ],
					 image: "",
					 optionA: "5",
					 optionB: "4",
					 optionC: "3",
					 optionD: "2",
					 questionId: 627716731,
					 helpText: "Swift предлагает пять различных уровней доступа для объектов вашего кода. Эти уровни доступа относительны исходному файлу, в котором определен объект, и так же они относительны модулю, которому принадлежит исходный файл."),
            
            Question(question: [
                "Какой уровень доступа по дефолту имеют все сущности вашего кода?",
                "Этот уровень доступа имеют все сущности вашего кода по дефолту"
            ],
                     image: "",
                     optionA: "internal",
                     optionB: "open",
                     optionC: "private",
                     optionD: "fileprivate",
                     questionId: 859559922,
                     helpText: "Все сущности вашего кода (кроме двух исключений) имеют дефолтный уровень доступа - internal (internal), если вы явно не указываете другой уровень. В результате во многих случаях вам не нужно указывать явный уровень доступа в вашем коде."),
			
			Question(question: [
                "Этот уровень доступа позволяет использовать объекты внутри любого исходного файла из определяющего их модуля",
                "Какой уровень доступа позволяет использовать объекты внутри любого исходного файла из определяющего их модуля?",
                "Какой уровень доступа позволяет использовать объекты внутри любого исходного файла из определяющего их модуля и так же в любом исходном файле из другого модуля?"
            ],
					 image: "",
					 optionA: "open и public",
					 optionB: "internal",
					 optionC: "fileprivate",
					 optionD: "private",
					 questionId: 117783808,
					 helpText: "open доступ и public доступ (open access и public access). Этот уровень доступа позволяет использовать объекты внутри любого исходного файла из определяющего их модуля и так же в любом исходном файле из другого модуля, который импортирует определяющий модуль. Вы обычно используете open и public доступы, когда указываете общий интерфейс фреймворка."),
			
			Question(question: [
                "Этот уровень доступа позволяет использовать объекты внутри любого исходного файла из их определяющего модуля",
                "Какой уровень доступа позволяет использовать объекты внутри любого исходного файла из их определяющего модуля, но не исходного файла не из этого модуля?",
                "Вы обычно указываете этот вид доступа, когда определяете внутреннюю структуру приложения или фреймворка"
            ],
					 image: "",
					 optionA: "internal",
					 optionB: "open и public",
					 optionC: "fileprivate",
					 optionD: "private",
					 questionId: 171393282,
					 helpText: "internal (internal access). Этот уровень доступа позволяет использовать объекты внутри любого исходного файла из их определяющего модуля, но не исходного файла не из этого модуля. Вы обычно указываете internal доступ , когда определяете внутреннюю структуру приложения или фреймворка."),
			
			Question(question: [
                "Этот уровень доступа позволяет использовать объект в пределах его исходного файла",
                "Какой уровень доступа позволяет использовать объект в пределах его исходного файла?"
            ],
					 image: "",
					 optionA: "fileprivate",
					 optionB: "open и public",
					 optionC: "internal",
					 optionD: "private",
					 questionId: 719503999,
					 helpText: "fileprivate (file private). Этот уровень доступа позволяет использовать объект в пределах его исходного файла. Используйте fileprivate уровень доступа для того, чтобы спрятать детали реализации определенной части функциональности, когда эти части функциональности будут использоваться внутри другого файла."),
			
			Question(question: [
                "Этот уровень доступа позволяет использовать сущность только в пределах области ее реализации",
                "Какой уровень доступа позволяет использовать сущность только в пределах области ее реализации?"
            ],
					 image: "",
					 optionA: "private",
					 optionB: "open и public",
					 optionC: "internal",
					 optionD: "fileprivate",
					 questionId: 467799719,
					 helpText: "private (private). Этот уровень доступа позволяет использовать сущность только в пределах области ее реализации. Используйте private доступ для того, чтобы спрятать детали реализации конкретной части функциональности, когда они используются только внутри области объявления."),
			
			Question(question: [
                "Является ли open доступ самым высоким уровнем доступа (наименее строгим)?",
                "Является ли private доступ самым низким уровнем доступа (самым строгим)?"
            ],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 883746330,
					 helpText: "open доступ - самый высокий уровень доступа (наименее строгий), и private уровень доступа является самым низким уровнем доступа (самый строгий)."),
			
			Question(question: [
                "Классы с этим уровнем доступа, могут наследоваться только в том модуле, в котором они определены",
                "Члены класса с этим уровнем доступа или с более строгим уровнем доступа могут быть переопределены подклассами только в том модуле, в котором они определены"
            ],
					 image: "",
					 optionA: "public",
					 optionB: "open",
					 optionC: "",
					 optionD: "",
					 questionId: 213712328,
					 helpText: "open доступ применяется только к классам и членам класса и отличается от public доступа следующим: Классы, с уровнем доступа public, могут наследоваться только в том модуле, в котором они определены. Члены класса с уровнем доступа public или с более строгим уровнем доступа могут быть переопределены подклассами только в том модуле, в котором они определены. "),
			
			Question(question: [
                "Классы с этим уровнем доступа могут наследоваться внутри модуля, в котором они определены и внутри модуля, который импортирует модуль, в котором они определены",
                "Члены класса с этим уровнем доступа могут переопределяться подклассами внутри модуля, в котором они были определены или внутри модуля, который импортирует модуль, в котором они были определены"
            ],
					 image: "",
					 optionA: "open",
					 optionB: "public",
					 optionC: "private",
					 optionD: "",
					 questionId: 520883186,
					 helpText: "Открытые классы могут наследоваться внутри модуля, в котором они определены и внутри модуля, который импортирует модуль, в котором они определены. Открытые члены класса могут переопределяться подклассами внутри модуля, в котором они были определены или внутри модуля, который импортирует модуль, в котором они были определены."),
			
			Question(question: [
                "Может ли объект быть определен в пределах другого объекта, который имеет более низкий (более строгий) уровень доступа?"
            ],
					 image: "",
					 optionA: "Нет",
					 optionB: "Да",
					 optionC: "",
					 optionD: "",
					 questionId: 532979787,
					 helpText: "Уровни доступа в Swift следуют общему руководящему принципу: никакой объект не может быть определен в пределах другого объекта, который имеет более низкий (более строгий) уровень доступа."),
			
			Question(question: [
                "Может ли функция иметь уровень доступа выше, чем у ее параметров или возвращаемого типа?"
            ],
					 image: "",
					 optionA: "Нет",
					 optionB: "Да",
					 optionC: "",
					 optionD: "",
					 questionId: 482479879,
					 helpText: "Функция не может иметь уровень доступа выше чем у ее параметров или возвращаемого типа, потому что функция не может использоваться там, где ее параметры не доступны."),
            
			Question(question: [
                "На каком этапе необходимо явно указывать уровень доступа для пользовательского типа?",
                "На этом этапе создания пользовательского типа вы должны явно указать уровень его доступа"
            ],
					 image: "",
					 optionA: "На этапе определения типа",
					 optionB: "Во время использования",
					 optionC: "В момент создания экземпляра",
					 optionD: "",
					 questionId: 266861597,
					 helpText: "Если вы хотите указать явно уровень доступа для пользовательского типа, то делайте это на этапе определения типа. Новый тип может быть использован там, где позволяет его уровень доступа."),
			
			Question(question: [
                "Где может быть использован класс с уровнем доступа fileprivate?",
                "Класс с уровнем доступа fileprivate можно использовать там"
            ],
					 image: "",
					 optionA: "В исходном файле",
					 optionB: "Внутри всего модуля",
					 optionC: "Где нам необходимо",
					 optionD: "Нигде",
					 questionId: 248840747,
					 helpText: "К примеру, если вы определите класс с уровнем доступа fileprivate, то он сможет быть использован только как тип свойства или параметр функции или возвращаемый тип в исходном файле, в котором определен этот fileprivate класс."),
			
			Question(question: [
                "Если у одного типа в кортеже уровень доступа private, а у другого типа уровень доступа internal, какой уровень будет у всего кортежа?"
            ],
					 image: "",
					 optionA: "private",
					 optionB: "internal",
					 optionC: "Который идет первым",
					 optionD: "",
					 questionId: 243217192,
					 helpText: "Уровень доступа для кортежей типов имеет самый строгий уровень доступа типа из всех используемых типов в кортеже. Например, если вы скомпонуете кортеж из двух разных типов, один из которых будет иметь уровень доступа как internal, другой как private, то кортеж будет иметь уровень доступа как private."),
			
			Question(question: [
                "Можете ли вы явно указать уровень доступа для кортежа?",
                "Можем ли мы определить кортежу уровень доступа?",
                "Уровень доступа для кортежа определяется вручную, явным определением доступа. Так ли это?"
            ],
					 image: "",
					 optionA: "Нет",
					 optionB: "Да",
					 optionC: "",
					 optionD: "",
					 questionId: 103105131,
					 helpText: "Кортежи типов не имеют отдельного определения уровня доступа в отличии от классов, структур, перечислений или функций. Уровень доступа кортежей типов вычисляется автоматически, когда используется кортеж, и не может быть указан явно."),
			
			Question(question: [
                "Если вычисляемый уровень доступа функции (уровень доступа параметров или возвращаемого значения) не соответствует контекстному по умолчанию, нужно ли нам указывать уровень доступа явно при определении функции?"
            ],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 832024661,
					 helpText: "Вы должны указывать уровень доступа явно как часть определения функции, если вычисляемый уровень доступа функции не соответствует контекстному по умолчанию."),
			
			Question(question: [
                "Какой уровень доступа будет у функции, когда у параметров и возвращаемого значения он разный?",
                "Если у параметров функции и у ее возвращаемого значения разный уровень доступа, какой будет общий уровень доступа у этой функции?"
            ],
					 image: "",
					 optionA: "Самый строгий из всех",
					 optionB: "Самый не строгий из всех",
					 optionC: "Как у параметров",
					 optionD: "Как у возвращаемого значения",
					 questionId: 893086826,
					 helpText: "Уровень доступа для типов функции вычисляется как самый строгий уровень доступа из типов параметров функции и типа возвращаемого значения."),
			
			Question(question: [
                "Что мы получим после запуска этого кода?"
            ],
					 image: "AccessControl21",
					 optionA: "Ошибку доступа",
					 optionB: "Код скомпилируется",
					 optionC: "Ничего",
					 optionD: "",
					 questionId: 917314499,
					 helpText: "Пример определяет глобальную функцию someFunction, без явного указания уровня доступа самой функции. Вы может быть ожидаете, что эта функция будет иметь уровень доступа по умолчанию internal, но только не в нашем случае. На самом деле функция вообще не будет компилироваться. Возвращаемый тип функцией является кортежем, который составлен из двух пользовательских классов. Один из этих классов был определен как internal (по умолчанию), другой - как private. Таким образом, общий уровень доступа кортежа будет вычислен как private (минимальный уровень доступа из всех элементов кортежа). Из-за того, что уровень доступа функции private, то вы должны установить общий уровень доступа как private во время определения функции."),
			
			Question(question: [
                "Можем ли мы определять для каждого члена перечисления свой уровень доступа?",
                "Каждому члену перечисления мы обязаны определять уровень доступа вручную. Так ли это?"
            ],
					 image: "",
					 optionA: "Нет",
					 optionB: "Да",
					 optionC: "",
					 optionD: "",
					 questionId: 911906675,
					 helpText: "Каждый кейс в перечислении автоматически получает тот же уровень доступа, что и само перечисление. Вы не можете указать другой уровень доступа для какого-то определенного кейса перечисления."),
			
			Question(question: [
                "Какой уровень доступа будет у кейса south?"
            ],
					 image: "AccessControl23",
					 optionA: "public",
					 optionB: "open",
					 optionC: "internal",
					 optionD: "private",
					 questionId: 691726174,
					 helpText: "В примере перечисление CompassPoint имеет явный уровень доступа public. Случаи перечисления north, south, east и west так же получают такой же уровень доступа, то есть public."),
			
			Question(question: [
                "Можем ли мы использовать начальные значения с более низким уровнем доступа для членов перечисления, чем уровень доступа самого перечисления?",
                "Можете ли вы использовать тип private для типа исходного значения перечисления, которое имеет internal уровень доступа?"
            ],
					 image: "",
					 optionA: "Нет",
					 optionB: "Да",
					 optionC: "",
					 optionD: "",
					 questionId: 787125860,
					 helpText: "Типы, используемые для любых начальных значений или связанных значений в перечислении, должны иметь как минимум такой же высокий уровень доступа как и перечисление. Вы не можете использовать тип private для типа исходного значения перечисления, которое имеет internal уровень доступа."),
			
			Question(question: [
                "Если вы хотите, чтобы вложенный тип внутри public типа имел уровень доступа как public, что вам нужно сделать?"
            ],
					 image: "",
					 optionA: "Явно указать этот тип",
					 optionB: "Определится автоматически",
					 optionC: "Определить как open",
					 optionD: "",
					 questionId: 193123585,
					 helpText: "Вложенные типы, определенные внутри типа с уровнем доступа private, автоматически получают уровень доступа private. Вложенные типы внутри public типов или internal типов, автоматически получают уровень доступа как internal. Если вы хотите, чтобы вложенный тип внутри public типа имел уровень доступа как public, то вам нужно явно указать этот тип самостоятельно."),
			
			Question(question: [
                "Может ли подкласс иметь более высокий уровень доступа чем суперкласс?",
                "Вы можете написать подклассу public, даже если его суперкласс имеет internal доступ. Так ли это?",
                "Подкласс может иметь более высокий уровень доступа, чем его суперкласс. Так ли это?"
            ],
					 image: "",
					 optionA: "Нет",
					 optionB: "Да",
					 optionC: "",
					 optionD: "",
					 questionId: 836831257,
					 helpText: "Вы можете создать подкласс любого класса, который может быть доступен в текущем контексте. Подкласс не может иметь более высокого уровня доступа, чем его суперкласс. Например, вы не можете написать подклассу public, если его суперкласс имеет internal доступ."),
			
			Question(question: [
                "Можем ли мы таким образом переписать метод и сделать его более доступным?"
            ],
					 image: "AccessControl27",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 416680055,
					 helpText: "Да. Переопределение может сделать член унаследованного класса более доступным, чем его версия суперкласса. В примере класс A имеет доступ public и имеет метод someMethod с уровнем доступа fileprivate. Класс B является подклассом класса A, который имеет урезанный уровень доступа до internal. Тем не менее, класс B предоставляет переопределение метода someMethod с уровнем доступа internal, который выше, чем первоначальное определение метода someMethod."),
			
			Question(question: [
                "Могут ли свойства быть более открытыми, чем их тип?",
                "Правильно ли писать свойство public для private типа?"
            ],
					 image: "",
					 optionA: "Нет",
					 optionB: "Да",
					 optionC: "",
					 optionD: "",
					 questionId: 543450842,
					 helpText: "Константы, переменные, свойства не могут быть более открытыми, чем их тип. Это неправильно писать свойство public для private типа. Аналогично дело обстоит и с сабскриптом: сабскрипт не может быть более открытым, чем тип индекса или возвращаемый тип."),
			
			Question(question: [
                "Может ли пользовательским инициализаторам быть присвоен уровень доступа ниже или равный уровню доступа самого типа, который они инициализируют?",
                "Должен ли требуемый инициализатор иметь тот же уровень доступа как и класс, которому он принадлежит?"
            ],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 814116695,
					 helpText: "Пользовательским инициализаторам может быть присвоен уровень доступа ниже или равный уровню доступа самого типа, который они инициализируют. Единственное исключение составляют Требуемые инициализаторы. Требуемый инициализатор должен иметь тот же уровень доступа как и класс, которому он принадлежит."),
			
			Question(question: [
                "Какой уровень доступа имеет дефолтный инициализатор для типа, у которого доступ установлен как public?"
            ],
					 image: "",
					 optionA: "internal",
					 optionB: "public",
					 optionC: "open",
					 optionD: "private",
					 questionId: 275933007,
					 helpText: "Дефолтный инициализатор имеет тот же уровень доступа, что и тип, который он инициализирует, если только тип не имеет доступа public. Для типа, у которого уровень доступа установлен public, дефолтный инициализатор имеет уровень доступа internal. Если вы хотите, чтобы open (public) тип был инициализируемым при помощи инициализатора, который не имеет аргументов, когда используется в другом модуле, то вы должны явно указать такой инициализатор как часть определения типа."),
			
			Question(question: [
                "Можем ли мы присваивать уровень доступа протоколам?",
                "Можем ли мы регулировать уровень доступа для протоколов?"
            ],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 842649272,
					 helpText: "Если вы хотите присвоить явный уровень доступа протоколу, то вы должны указать его во время определения протокола. Это позволяет вам создавать протоколы, которые могут быть приняты только внутри определенного уровня доступа контекста."),
			
			Question(question: [
                "На какой уровень доступа устанавливается каждое требование протокола?",
                "Какой уровень доступа получают все требования протокола?"
            ],
					 image: "",
					 optionA: "На тот же, что у протокола",
					 optionB: "На public",
					 optionC: "На open",
					 optionD: "На internal",
					 questionId: 928975226,
					 helpText: "Уровень доступа каждого требования в процессе определения протокола устанавливается на тот же уровень, что и сам протокол. Вы не можете установить уровень доступа требований протокола другим, чем поддерживает сам протокол. Это гарантирует, что все требования протокола будут видны любому типу, который принимает протокол."),
			
			Question(question: [
                "Если мы определили протокол с публичным уровнем доступа, какой уровень доступа будет у его требований?",
                "Какой уровень доступа будет у требований публичного (public) протокола?"
            ],
					 image: "",
					 optionA: "public",
					 optionB: "internal",
					 optionC: "open",
					 optionD: "private",
					 questionId: 290963601,
					 helpText: "Если вы определяете public протокол, то требования протокола требуют public уровня доступа для тех требований, которые они реализуют. Это поведение отличается от поведений других типов, где определение открытого типа предполагает наличие уровня internal у элементов этого типа."),
			
			Question(question: [
                "Можем ли мы наследовать public протокол от internal протокола?"
            ],
					 image: "",
					 optionA: "Нет",
					 optionB: "Да",
					 optionC: "",
					 optionD: "",
					 questionId: 577633015,
					 helpText: "Если вы определяете новый протокол, который наследует из другого существующего протокола, то новый протокол может иметь не более высокий уровень доступа, чем протокол, от которого он наследует. Вы не можете писать public протокол, который наследует из internal протокола, к примеру."),
			
			Question(question: [
                "Может ли пользовательский тип соответствовать протоколу с более низким уровнем доступа?"
            ],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 333687004,
					 helpText: "Тип может соответствовать протоколу с более низким уровнем доступа, чем сам тип. Например, вы можете определить public тип, который может быть использован в других модулях, но чье соответствие внутреннему протоколу может быть использовано только внутри модуля, где определен сам internal протокол."),
			
			Question(question: [
                "Может ли тип соответствовать протоколу двумя разными способами в пределах одной программы?",
                "Является ли соответствие протоколу в Swift внутренним, а не глобальным?"
            ],
					 image: "",
					 optionA: "Нет",
					 optionB: "Да",
					 optionC: "",
					 optionD: "",
					 questionId: 626150662,
					 helpText: "В Swift как и в Objective-C соответствие протоколу является глобальным. И тип не может соответствовать протоколу двумя разными способами в пределах одной программы."),
            
            Question(question: [
                "Какой уровень доступа нужно присвоить объекту вашего фреймворка, чтобы к нему был доступ из приложения?",
                "Вам нужно отметить объект как ___, если вы хотите сделать его частью интерфейса своего фреймворка"
            ],
                     image: "",
                     optionA: "open / public",
                     optionB: "internal",
                     optionC: "private / fileprivate",
                     optionD: "",
                     questionId: 123806038,
                     helpText: "Любые внутренние детали реализации вашего фреймворка могут использоваться с дефолтным уровнем доступа internal, или они могут быть отмечены как fileprivate или private, если вы хотите их спрятать от остального внутреннего кода фреймворка. Вам нужно отметить объект как open или public, если вы хотите сделать его частью интерфейса фреймворка."),
            
            Question(question: [
                "Какая маркировка должна быть у модуля unit тестирования, чтобы он имел доступ к коду вашего приложения?"
            ],
                     image: "",
                     optionA: "@testable",
                     optionB: "@test",
                     optionC: "@open",
                     optionD: "",
                     questionId: 281841171,
                     helpText: "Когда вы пишете приложение с модулем поэлементного тестирования, то код вашего приложения должен быть доступным для модуля, чтобы он мог его проверить. По умолчанию только сущности с маркировкой public могут быть доступны для других модулей, однако этот модуль может получить доступ ко всем внутренним сущностям, если вы поставили входную маркировку объявления модуля продукта как @testable и компилируете со включенным режимом тестирования."),
            
            Question(question: [
                "Какой уровень доступы автоматически получают геттеры и сеттеры для констант?",
                "Какой уровень доступы автоматически получают геттеры и сеттеры для переменных?",
                "Какой уровень доступы автоматически получают геттеры и сеттеры для сабскриптов?"
            ],
                     image: "",
                     optionA: "Такой же",
                     optionB: "Более строгий",
                     optionC: "Более открытый",
                     optionD: "",
                     questionId: 555056493,
                     helpText: "Геттеры и сеттеры для констант, переменных и сабскриптов автоматически получают тот же уровень доступа как и константа, переменная, свойство или сабскрипт, которому они принадлежат."),
            
            Question(question: [
                "Можете ли вы задать сеттер более низкого уровня доступа чем его соответствующий геттер?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 425468492,
                     helpText: "Вы можете задать сеттер более низкого уровня доступа чем его соответствующий геттер, для ограничения области read-write этой переменной, свойства или сабскрипта. Вы присваиваете более низкий уровень доступа написав fileprivate(set), private(set) или internal(set) до вступительного var или subscript. Это правило применяется как к свойствам хранения так и к вычисляемым свойствам. Даже если вы не пишете явного геттера и сеттера для хранимого свойства, Swift все еще создает для вас неявный геттер и сеттер, чтобы вы могли получить доступ к хранимым свойствам. Используйте fileprivate(set), private(set) и internal(set) для изменения уровня доступа этого созданного сеттера в точно такой же форме как и в случае явного сеттера вычисляемого свойства."),
		]
	}
}
