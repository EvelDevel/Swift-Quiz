
//  Created by Евгений Никитин on 12.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

final class PropertiesSet {
	static func getQuestions() -> [Question] {
		return [
			Question(question: [
                "Эти свойства содержат значения константы или переменной как часть экземпляра",
                "Эти свойства обеспечиваются только структурами или классами, и содержат значения константы или переменной как часть экземпляра"
            ],
					 image: "",
					 optionA: "Свойства хранения",
					 optionB: "Вычисляемые свойства",
					 optionC: "",
					 optionD: "",
					 id: 369566531,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
                     helpText: """
                     Свойства хранения. Свойства связывают значения с определённым классом, структурой или перечислением. Свойства хранения содержат значения константы или переменной как часть экземпляра, в то время как вычисляемые свойства вычисляют значения, а не хранят их.
                     
                     Вычисляемые свойства обеспечиваются классами, структурами или перечислениями. Свойства хранения обеспечиваются только классами или структурами.
                     """),
			
			Question(question: ["Свойства, связанные не с экземплярами конкретного типа, а с типом самим по себе",
								"Какие свойства связаны с типом самим по себе?"],
					 image: "",
					 optionA: "Свойства типа",
					 optionB: "Вычисляемые свойства",
					 optionC: "Приватные свойства",
					 optionD: "Свойства хранения",
					 id: 245637039,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "Свойства типа. Свойства хранения и вычисляемые свойства обычно связаны с экземплярами конкретного типа. Однако свойства так же могут быть связаны и с типом самим по себе. Такие свойства известны как свойства типа."),
			
			Question(question: ["Можем ли мы добавить наблюдателей свойства хранения, для отслеживания изменений по его значению?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 id: 392855070,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
                     helpText: """
                     Да. Вы можете объявить наблюдателя свойства для отслеживания изменений по значению свойства, которые может вызывать пользовательское действие.
                     
                     Наблюдатели свойства могут быть добавлены к свойствам хранения, которые вы объявили сами, и так же могут быть добавлены к свойствам, которые подкласс наследует у суперкласса.
                     """),
			
			Question(question: ["С какого ключевого слова начинаются постоянные свойства хранения определенного экземпляра класса?",
								"С этого ключевого слова начинаются постоянные свойства хранения у экземпляра структуры",
								"Постоянное свойство хранения начинается с этого ключевого слова"],
					 image: "",
					 optionA: "let",
					 optionB: "var",
					 optionC: "func",
					 optionD: "struct",
					 id: 286848639,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
                     helpText: """
                     let. В самой простой форме свойство хранения - константа или переменная, которая хранится как часть экземпляра определенного класса или структуры.
                     
                     Свойства хранения могут быть или переменными свойствами хранения (начинаются с ключевого слова var), или постоянными свойствами хранения (начинается с ключевого слова let).
                     """),
			
			Question(question: ["Можем ли мы присвоить значение по умолчанию для свойства хранения, как часть его определения?",
								"Возможно ли присвоить начальное значения для свойства хранения во время его инициализации?",
								"Возможно ли присвоить начальное значения для постоянных свойств хранения во время инициализации?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 id: 272208599,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "Да. Вы можете присвоить значение по умолчанию для свойства хранения как часть его определения. Вы так же можете присвоить начальное значение для свойства хранения во время его инициализации. Это даже возможно для постоянных свойств."),
			
			Question(question: ["Что произойдет после запуска этого кода?",
								"Что мы получим, когда запустим данный код?",
								"После запуска данного кода, мы получим такой результат"],
					 image: "Properties7",
					 optionA: "Столкнемся с ошибкой",
					 optionB: "Изменим значение length",
					 optionC: "Ничего не случится",
					 optionD: "",
					 id: 997980903,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
                     helpText: """
                     Столкнемся с ошибкой. Экземпляры FixedRange имеют переменное свойство хранения firstValue и свойство хранения в виде константы length.
                     
                     В примере выше свойство length инициализировано, когда мы создали новый диапазон, который не может быть изменен в дальнейшем, так как это свойство константа.
                     """),
			
			Question(question: ["Что мы получим, когда запустим данный код?",
								"Что произойдет после запуска этого кода?",
								"После запуска данного кода, мы получим такой результат"],
					 image: "Properties9",
					 optionA: "Изменим значение firstValue",
					 optionB: "Столкнемся с ошибкой",
					 optionC: "Ничего не случится",
					 optionD: "",
					 id: 112161233,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "Изменим значение firstValue. Если вы присваиваете экземпляр ссылочного типа константе (экземпляр класса), то он все еще может менять переменные свойства (var)."),
			
			Question(question: ["После запуска данного кода, мы получим такой результат",
								"Что произойдет после запуска этого кода?",
								"Что мы получим, когда запустим данный код?"],
					 image: "Properties8",
					 optionA: "Столкнемся с ошибкой",
					 optionB: "Изменим значение firstValue",
					 optionC: "Ничего не случится",
					 optionD: "",
					 id: 679933244,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
                     helpText: """
                     Столкнемся с ошибкой. Если вы создаете экземпляр структуры и присваиваете его константе, то вы не можете изменять его свойства, даже если они объявлены как переменные.
                     
                     Из-за того, что rangeOfThreeItems объявлена в качестве константы (ключевое слово let), то невозможно изменить свойство firstValue, даже несмотря на то, что это свойство переменная.
                     
                     Такое поведение объясняется тем, что структура является типом значений. Когда экземпляр типа значений отмечен как константа, то все его свойства так же считаются константами.
                     """),
			
			Question(question: ["Как характеризуется свойство хранения, начальное значение которого не вычисляется до первого использования?",
								"У этого свойства хранения начальное значение не вычисляется до первого использования"],
					 image: "",
					 optionA: "Ленивое свойство хранения",
					 optionB: "Свойство хранения",
					 optionC: "Пассивное свойство",
					 optionD: "Латентное свойство хранения",
					 id: 738725659,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "Ленивое свойство хранения. Это свойство, начальное значение которого не вычисляется до первого использования."),
			
			Question(question: ["Каким ключевым словом обозначаются ленивые свойства хранения?",
								"Этим ключевым словом можно обозначить ленивое свойство хранения",
								"Ключевое слово, которым можно обозначить ленивое свойство хранения"],
					 image: "",
					 optionA: "lazy",
					 optionB: "laziest",
					 optionC: "passive",
					 optionD: "slow",
					 id: 191742520,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "lazy. Индикатор ленивого свойства - ключевое слово lazy."),
			
			Question(question: ["Как мы должны объявлять свойства ленивого хранения?",
								"Мы всегда должны объявлять свойства ленивого хранения именно так"],
					 image: "",
					 optionA: "Как переменную",
					 optionB: "Как константу",
					 optionC: "Не имеет значения",
					 optionD: "",
					 id: 438126592,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
                     helpText: """
                     Как переменную. Всегда объявляйте свойства ленивого хранения как переменные (с помощью ключевого слова var), потому что ее значение может быть не получено до окончания инициализации.
                     
                     Свойства-константы всегда должны иметь значение до того, как закончится инициализация, следовательно они не могут быть объявлены как свойства ленивого хранения.
                     """),
			
			Question(question: ["Чем полезны ленивые свойства?",
								"Ленивые свойства полезны этим"],
					 image: "",
					 optionA: "Отсрочка инициализации",
					 optionB: "Моментальная инициализация",
					 optionC: "Частичная инициализация",
					 optionD: "",
					 id: 685280758,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
                     helpText: """
                     Отсрочка инициализации. Ленивые свойства полезны, когда исходное значение свойства зависит от внешних факторов, значения которых неизвестны до окончания инициализации.
                     
                     Так же ленивые свойства полезны, когда начальное значение требует комплексных настроек или сложных вычислений, которые не должны быть проведены до того момента, пока они не понадобятся.
                     """),
			
			Question(question: ["Дает ли Swift гарантию того, что ленивое свойство, которое еще не было инициализировано, будет инициализировано всего один раз, если к нему одновременно обращаются с нескольких потоков?"],
					 image: "",
					 optionA: "Нет",
					 optionB: "Да",
					 optionC: "",
					 optionD: "",
					 id: 313228621,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "Нет. Если к свойству обозначенному через модификатор lazy обращаются сразу с нескольких потоков единовременно, и если оно еще не было инициализировано, то нет никакой гарантии того, что оно будет инициализировано всего один раз."),
			
			Question(question: ["Эти свойства фактически не хранят значения",
								"Какие свойства предоставляют геттер и опциональный сеттер для получения и установки других свойств косвенно?"],
					 image: "",
					 optionA: "Вычисляемые свойства",
					 optionB: "Свойства типа",
					 optionC: "Приватные свойства",
					 optionD: "Свойства хранения",
					 id: 778404866,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "Вычисляемые свойства. В дополнение к свойствам хранения, классам, структурам и перечислениям можно добавить вычисляемые свойства, которые фактически не хранят значения. Вместо этого они предоставляют геттер и опциональный сеттер для получения и установки других свойств косвенно."),
			
			Question(question: ["Если сеттер вычисляемого свойства не определяет имени для нового значения, какое имя используется по умолчанию?",
								"Если мы не указываем новое имя нового значения сеттера свойства, какое имя будет использоваться по умолчанию?"],
					 image: "",
					 optionA: "newValue",
					 optionB: "new",
					 optionC: "newCenter",
					 optionD: "value",
					 id: 988350480,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "newValue. Если сеттер вычисляемого свойства не определяет имени для нового значения, то используется имя по умолчанию newValue."),
			
			Question(question: ["Как называется вычисляемое свойство имеющее геттер, но не имеющее сеттер?",
								"Свойство, которое доступно через точечный синтаксис, но не может менять свое текущее значение (не имеющее сеттера)?"],
					 image: "",
					 optionA: "Свойство только для чтения",
					 optionB: "Свойство только для записи",
					 optionC: "Неизменяемое свойство",
					 optionD: "Переменное свойство хранения",
					 id: 783890223,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "Свойство только для чтения. Вычисляемое свойство имеющее геттер, но не имеющее сеттера известно так же как вычисляемое свойство только для чтения. Такое вычисляемое свойство только для чтения возвращает значение и может быть доступно через точечный синтаксис, но не может изменить свое текущее значение."),
			
			Question(question: ["Как мы должны объявлять вычисляемые свойства, включая вычисляемые свойства только для чтения?",
								"Вы должны объявлять вычисляемые свойства и вычисляемые свойства только для чтения именно так"],
					 image: "",
					 optionA: "Как переменные свойства (var)",
					 optionB: "Как постоянные свойства (let)",
					 optionC: "Не имеет значения",
					 optionD: "",
					 id: 267849004,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
                     helpText: """
                     Как переменные свойства (var). Вы должны объявлять вычисляемые свойства, включая вычисляемые свойства для чтения, как переменные свойства с ключевым словом var, потому что их значение не фиксировано. Ключевое слово let используется только для константных свойств, значение которых не может меняться, после того как было установлено как часть инициализации экземпляра.
                     """),
			
			Question(question: ["Можем ли мы упростить объявление вычисляемых свойств только для чтения, удаляя ключевое слово get и его фигурные скобки?",
								"Можете ли вы упрощать объявление вычисляемых свойств только для чтения, удаляя get и дополнительные {}?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "Можем удалить только {}",
					 optionD: "Можем удалить только get",
					 id: 426809299,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "Да. Вы можете упростить объявление вычисляемых свойств только для чтения, удаляя ключевое слово get и его скобки."),
			
			Question(question: ["Что мы получим в консоль после запуска данного кода?",
								"Что выводится в консоль?"],
					 image: "Properties20",
					 optionA: "40.0",
					 optionB: "4",
					 optionC: "Столкнемся с ошибкой",
					 optionD: "Ничего",
					 id: 568422992,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
                     helpText: """
                     40. Этот пример объявляет новую структуру Cuboid, которая представляет 3D прямоугольную коробку с width, height, depth свойствами.
                     
                     Так же эта структура имеет свойство доступное только для чтения volume, которое считает и возвращает текущий объем кубоида.
                     
                     Никакого смысла делать volume значением установленным, так как будет непонятно какие значения width, height и depth должны быть использованы для конкретного значения объема. Тем не менее для кубоида полезно иметь вычисляемое свойство только для чтения, чтобы пользователи могли узнать текущий рассчитанный объем.
                     """),
			
			Question(question: ["Если устанавливаемое значение совпадает с уже установленным, будет ли вызываться наблюдатель свойств?",
								"Наблюдатели свойств вызываются даже если устанавливаемое значение не отличается от старого, это так?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 id: 918997271,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "Да. Наблюдатели свойств вызываются каждый раз, как устанавливается значение свойству, даже если устанавливаемое значение не отличается от старого."),
			
			Question(question: ["Выберите правильные наблюдатели свойств"],
					 image: "",
					 optionA: "willSet и didSet",
					 optionB: "set и get",
					 optionC: "willSet и didGet",
					 optionD: "willGet и didSet",
					 id: 357665770,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "willSet и didSet. У вас есть опция определять один или оба этих наблюдателя свойства: willSet вызывается прямо перед сохранением значения, didSet вызывается сразу после сохранения значения."),
			
			Question(question: ["Этот наблюдатель свойств вызывается прямо перед сохранением значения",
								"Перед сохранением значения вызывается этот наблюдатель свойств"],
					 image: "",
					 optionA: "willSet",
					 optionB: "didSet",
					 optionC: "get",
					 optionD: "set",
					 id: 675073742,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "willSet. willSet вызывается прямо перед сохранением значения."),
			
			Question(question: ["Этот наблюдатель свойств вызывается сразу после сохранения значения",
								"Сразу после сохранения значения вызывается этот наблюдатель свойств"],
					 image: "",
					 optionA: "didSet",
					 optionB: "willSet",
					 optionC: "get",
					 optionD: "set",
					 id: 974237056,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "didSet. didSet вызывается сразу после сохранения значения."),
			
			Question(question: ["Если вы не станете указывать новое имя параметра при реализации willSet наблюдателя, каким оно будет?"],
					 image: "",
					 optionA: "newValue",
					 optionB: "new",
					 optionC: "old",
					 optionD: "oldValue",
					 id: 969783702,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
                     helpText: """
                     newValue. Если вы реализуете наблюдатель willSet, то он передает новое значение свойства как константный параметр.
                     
                     Вы можете сами определить ему имя внутри реализации willSet. Если вы не станете указывать новое имя параметра и скобки внутри реализации, то параметр все равно будет доступен через имя параметра по умолчанию newValue.
                     """),
			
			Question(question: ["Если вы не станете указывать новое имя параметра при реализации didSet наблюдателя, каким оно будет?"],
					 image: "",
					 optionA: "oldValue",
					 optionB: "new",
					 optionC: "old",
					 optionD: "newValue",
					 id: 584558510,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "oldValue. Если вы реализуете наблюдатель didSet, то ему будет передан параметр-константа, содержащий старое значение свойства. Вы можете задать имя параметру, но если вы этого не сделаете, то он все равно будет доступен через имя параметра по умолчанию oldValue."),
			
			Question(question: ["Переменные, которые объявляются вне любой функции, метода, замыкания или контекста типа"],
					 image: "",
					 optionA: "Глобальные переменные",
					 optionB: "Локальные переменные",
					 optionC: "",
					 optionD: "",
					 id: 315481420,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "Глобальные переменные. Глобальные переменные - переменные, которые объявляются вне любой функции, метода, замыкания или контекста типа."),
			
			Question(question: ["Переменные, которые объявляются внутри функции, метода или внутри контекста замыкания"],
					 image: "",
					 optionA: "Локальные переменные",
					 optionB: "Глобальные переменные",
					 optionC: "",
					 optionD: "",
					 id: 315481420,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "Локальные переменные. Локальные переменные - переменные, которые объявляются внутри функции, метода или внутри контекста замыкания."),
			
			Question(question: ["Являются ли глобальные константы и переменные вычисляемыми отложено?",
								"Глобальные переменные и константы являются, аналогично свойствам ленивого хранения, вычисляемыми отложено?",
								"В отличии от свойств ленивого хранения, глобальные переменные и константы не нуждаются в маркере lazy, так ли это?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 id: 605569471,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "Да. Глобальные константы и переменные всегда являются вычисляемыми отложено, аналогично свойствам ленивого хранения. В отличии от свойств ленивого хранения глобальные константы и переменные не нуждаются в маркере lazy. Локальные константы и переменные никогда не вычисляются отложено."),
			
			Question(question: ["Можем ли мы объявлять свойства, которые будут принадлежать самому типу, а не экземплярам этого типа?",
								"Свойства типа полезны при объявлении значений, которые являются универсальными для всех экземпляров конкретного типа, так ли это?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 id: 475511865,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
                     helpText: """
                     Да. Вы можете объявить свойства, которые принадлежат самому типу, а не экземплярам этого типа. Будет всего одна копия этих свойств, и не важно сколько экземпляров вы создадите. Такие свойства называются свойствами типа.
                     
                     Свойства типа полезны при объявлении значений, которые являются универсальными для всех экземпляров конкретного типа, как например постоянное свойство, которое могут использовать все экземпляры (как например статическая константа в C), или переменное свойство, которое хранит значение и которое является глобальным для всех экземпляров данного типа (как статическая переменная в C).
                     """),
			
			Question(question: ["Должны ли мы давать свойствам типов значение по умолчанию?",
								"В отличие от свойств хранения экземпляра, должны ли мы давать свойствам типов значение по умолчанию?",
								"Мы должны давать свойствам типа значение по умолчанию, так ли это?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 id: 759894252,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "Да. В отличии от свойств хранения экземпляра, вы должны всегда давать свойствам типов значение по умолчанию. Это потому, что тип сам по себе не имеет инициализатора, который мог бы присвоить значение хранимому свойству типа."),
			
			Question(question: ["Гарантирует ли Swift единоразовую инициализацию свойства типа, даже при обращении к нему из нескольких потоков?",
								"Даже если свойства типа доступны сразу для нескольких потоков, они гарантировано инициализируются только один раз, так ли это?",
								"Хранимые свойства типа инициализируются отложено, гарантированно инициализируются только один раз, и не нуждаются в маркировке lazy, так ли это?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 id: 810964107,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "Да. Хранимые свойства типа отложено инициализируются при первом обращении к ним. Они гарантировано инициализируются только один раз, даже если они доступны сразу для нескольких потоков. Эти свойства не нуждаются в маркировке lazy."),
			
			Question(question: ["Какое ключевое слово используется для объявления свойств типа?",
								"Чтобы объявить свойства типа, используется это ключевое слово"],
					 image: "",
					 optionA: "static",
					 optionB: "fileprivate",
					 optionC: "private",
					 optionD: "public",
					 id: 157256631,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "static. Чтобы объявить свойства типа, используйте ключевое слово static."),
			
			Question(question: [
                "Какое ключевое слово используется для вычисляемых свойств класса, вместо static, когда мы хотим разрешать подклассам переопределение?"
            ],
					 image: "",
					 optionA: "class",
					 optionB: "struct",
					 optionC: "public",
					 optionD: "",
					 id: 569227571,
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
			
			Question(question: ["Какое значение мы получим в консоль?"],
					 image: "Properties37",
					 optionA: "true",
					 optionB: "false",
					 optionC: "Ошибка компиляции",
					 optionD: "",
					 id: 666371638,
                     links: [
                        "https://swiftbook.ru/content/languageguide/properties/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties"
                     ],
					 helpText: "true. DidSet не запускается в инициализаторе, поэтому исходное значение p.point.x будет равно 5, что даст true в результате выполнения программы."),
            
            Question(question: [
                "Можем ли мы явно объявлять свойство типа (static var) как lazy?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 451575642,
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
                "Какой результат мы получим в консоль?"
            ],
                     image: "Interview11",
                     optionA: "1110",
                     optionB: "1111",
                     optionC: "2210",
                     optionD: "",
                     id: 565654554,
                     links: [
                        "https://swiftbook.org/docs/1509/"
                     ],
                     helpText: """
                     1110. У вас есть опция определять один или оба наблюдателя свойства:

                     willSet - вызывается прямо перед сохранением значения
                     didSet - вызывается сразу после сохранения значения
                     
                     В нашем случае мы установим исходное значение 1000 (наблюдатели свойств не вызываются), после чего, когда мы вызовем foo.bar += 10, мы попадем в willSet, где у нас есть доступ только к новому значению (1010), но нет возможности изменить его.
                     
                     После чего мы попадаем в блок didSet, где наше значение прибавляется на 10 (исходный вызов), а потом мы прибавляем к уже установленному свойству еще +100 (так как оно уже доступно для изменений).
                     """
                    ),
            
            Question(question: [
                "Скомпилируется ли данный код?"
            ],
                     image: "Interview15",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 923454807,
                     links: [
                        "https://swiftbook.org/docs/1510/",
                        "https://swiftbook.org/docs/1509/"
                     ],
                     helpText: """
                     Нет. Этот код не соберется. Компилятор укажет на ошибку: Value type 'AA' cannot have a stored property that recursively contains it
                     
                     Ошибка возникает по причине того, что типы значений занимают фиксированное место в памяти. Это пространство предопределено типом и должно быть известно во время компиляции.
                     
                     Таким образом, компилятору нужно знать, сколько места зарезервировать для структуры АА и BB.
                     
                     Но значение вычислить невозможно так как одна структура содержит, в том числе, другое значение того же типа, а это значение содержит третье, и так далее, что приводит к рекурсии.
                     """
                    ),
		]
	}
}
