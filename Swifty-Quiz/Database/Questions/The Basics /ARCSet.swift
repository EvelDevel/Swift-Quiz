
//  Created by Евгений Никитин on 12.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

final class ARCSet {
	static func getQuestions() -> [Question] {
		return [
            Question(question: [
                "Основная задача automatic reference counting в Swift?",
                "Automatic reference counting в Swift используется для этого",
                "Для чего в Swift используют automatic reference counting?"
            ],
					 image: "",
					 optionA: "Управление памятью",
					 optionB: "Создание экземпляров",
					 optionC: "Отложенная инициализация",
					 optionD: "Многопоточность",
					 id: 323726335,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     Управление памятью. Swift использует automatic reference counting (автоматический подсчет ссылок) для отслеживания и управления памятью вашего приложения.
                     
                     В большинстве случаев это означает, что управление памятью \"просто работает\" в Swift и вам не нужно думать о самостоятельном управлении памятью.
                     
                     ARC автоматически освобождает память, которая использовалась экземплярами класса, когда эти экземпляры больше нам не нужны.
                     """),
			
			Question(question: [
                "На какие экземпляры распространяется ARC?",
                "ARC применяется на эти типы экземпляров",
                "Какие типы экземпляров управляются посредством ARC?"
            ],
					 image: "",
					 optionA: "Только классы",
					 optionB: "Только структуры",
					 optionC: "Структуры и перечисления",
					 optionD: "",
					 id: 730582724,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     Только классы. ARC применима только для экземпляров класса. Структуры и перечисления являются типами значений, а не ссылочными типами, и они не хранятся и не передают свои значения по ссылке.
                     """),
            
            Question(question: [
                "Что делает ARC каждый раз, когда вы создаете экземпляр класса?"
            ],
                     image: "",
                     optionA: "Выделяет память",
                     optionB: "Создает копию",
                     optionC: "Не делает ничего",
                     optionD: "",
                     id: 532156281,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     Выделяет память. Каждый раз, когда вы создаете экземпляр класса, ARC выделяет фрагмент памяти для хранения информации этого экземпляра.
                     
                     Этот фрагмент памяти содержит информацию о типе экземпляра, о его значении и любых свойствах хранения, связанных с ним.
                     """),
            
            Question(question: [
                "Что делает ARC каждый раз, когда вы создаете экземпляр структуры?",
                "Что делает ARC каждый раз, когда вы создаете экземпляр перечисления?"
            ],
                     image: "",
                     optionA: "Не делает ничего",
                     optionB: "Создает копию",
                     optionC: "Выделяет память",
                     optionD: "",
                     id: 726815594,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     Не делает ничего. ARC применима только для экземпляров класса.
                     
                     Структуры и перечисления являются типами значений, а не ссылочными типами, и они не хранятся и не передают свои значения по ссылке.
                     """),
			
			Question(question: [
                "ARC не освободит экземпляр, пока у нас...",
                "ARC не будет освобождать экземпляр до тех пор, пока..."
            ],
					 image: "",
					 optionA: "есть сильные ссылки",
					 optionB: "нет активных ссылок",
					 optionC: "существует side table",
					 optionD: "",
					 id: 746309951,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     Есть сильные ссылки. Если ARC освободит память используемого экземпляра, то доступ к свойствам или методам этого экземпляра будет невозможен.
                     
                     Если вы попробуете получить доступ к этому экземпляру, то ваше приложение скорее всего выдаст ошибку и будет остановлено.
                     
                     Для того, чтобы нужный экземпляр не пропал, ARC ведет учет количества свойств, констант, переменных, которые ссылаются на каждый экземпляр класса.
                     
                     ARC не освободит экземпляр, если есть хотя бы одна сильная ссылка.
                     """),
			
			Question(question: [
                "Что создается каждый раз, когда мы присваиваем экземпляр класса переменной или константе?",
            ],
					 image: "",
					 optionA: "strong ссылка",
					 optionB: "weak ссылка",
					 optionC: "middle+ ссылка",
					 optionD: "",
					 id: 806667943,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     strong ссылка. Каждый раз, когда вы присваиваете экземпляр (объект) класса переменной, константе или свойству, создается ссылка на этот экземпляр.
                     
                     Однако важно понимать, что сам объект (экземпляр) не копируется, а создается только сильная (strong) ссылка на него.
                     """),
            
            Question(question: [
                "Какое ключевое слово обозначает слабую ссылку?",
                "Слабую ссылку обозначает это ключевое слово",
                "Ключевое слово, обозначающее слабую ссылку"
            ],
                     image: "",
                     optionA: "weak",
                     optionB: "strong",
                     optionC: "unowned",
                     optionD: "week",
                     id: 389235963,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     weak. weak и unowned ссылки позволяют одному экземпляру в цикле ссылок ссылаться на другой экземпляр без сильного прикрепления. Экземпляры могут ссылаться друг на друга без создания цикла сильных связей.
                     """),
			
			Question(question: [
                "Ситуация, когда два или более объекта обращаются друг к другу, создавая тем самым замкнутую ситуацию, в которой ни один из объектов не может быть освобожден из памяти"
            ],
					 image: "",
					 optionA: "retain cycle",
					 optionB: "weak reference cycle",
					 optionC: "ссылочное связывание",
					 optionD: "",
					 id: 376936202,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     retain cycles (цикл сильных ссылок). retain cycle, также известный как strong reference cycle, возникает в языках программирования с ARC, таких как Swift и Objective-C, когда два или более объекта обращаются друг к другу сильными ссылками, создавая тем самым замкнутую ситуацию, в которой ни один из объектов не может быть освобожден из памяти, так как на него всегда есть хотя бы одна сильная ссылка.
                     
                     Этот цикл приводит к тому, что память, занимаемая этими объектами, не может быть правильно освобождена, так как ARC определяет, что объекты все еще используются (имеют активные сильные ссылки), даже если они на самом деле больше не нужны приложению.
                     """),
			
			Question(question: [
                "Последствия retain cycles?",
                "retain cycles может вызывать это"
            ],
					 image: "",
					 optionA: "Утечка памяти",
					 optionB: "Удаление экземпляров",
					 optionC: "runtime ошибка",
					 optionD: "",
					 id: 607503936,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     Утечка памяти. retain cycles предотвращает освобождение экземпляров, что вызывает утечку памяти в вашем приложении.
                     
                     Утечка памяти (memory leak) - это ситуация, когда выделенная в программе память для объектов или данных не может быть правильно освобождена, даже когда эти объекты или данные больше не нужны приложению.
                     
                     Каждый раз, когда такая ситуация происходит, память остается занята и не может быть использована для других целей, что в конечном итоге может привести к исчерпанию доступной памяти и ухудшению производительности приложения.
                     """),
			
			Question(question: [
                "Тип ссылки, позволяющий одному экземпляру ссылаться на другой экземпляр без сильного прикрепления",
                "Какие ссылки помогают экземплярам ссылаться друг на друга без создания цикла сильных связей?"
            ],
					 image: "",
					 optionA: "weak, unowned",
					 optionB: "middle, weak",
					 optionC: "strong, и unowned",
					 optionD: "",
					 id: 313219102,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     weak и unowned. Эти ссылки позволяют одному экземпляру ссылаться на другой экземпляр без сильного прикрепления.
                     """),
			
			Question(question: [
                "Какую ссылку предпочтительнее использовать, когда другой экземпляр имеет более короткое время жизни (то есть когда другой экземпляр может быть освобожден первым)?"
            ],
					 image: "",
					 optionA: "weak",
					 optionB: "strong",
					 optionC: "unowned",
					 optionD: "",
					 id: 466812939,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     weak ссылка. Используйте слабую (weak) ссылку, если другой экземпляр имеет более короткое время жизни, то есть когда другой экземпляр может быть освобожден первым.
                     """),
			
			Question(question: [
                "Почему мы избегаем циклов сильных ссылок (retain cycle), используя weak?"
            ],
					 image: "",
					 optionA: "ARC их не учитывает",
					 optionB: "Они сразу инициализируются",
					 optionC: "Не занимают места в памяти",
					 optionD: "",
					 id: 328680699,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     ARC их не учитывает. weak ссылки не удерживаются за экземпляр, на который они указывают, так что ARC не берет их во внимание (не увеличивает retain count), когда считает ссылки экземпляра.
                     """),
			
			Question(question: [
                "Мы должны объявлять weak ссылки как переменные или как константы?",
                "Мы объявляем weak ссылки в коде как константы, или как переменные?"
            ],
					 image: "",
					 optionA: "Переменные",
					 optionB: "Константы",
					 optionC: "На наше усмотрение",
					 optionD: "Опциональные константы",
					 id: 284433096,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     Переменные. ARC автоматически присваивает weak ссылке nil, когда экземпляр, на который она указывает, освобождается.
                     
                     И поскольку weak ссылки должны позволять изменять их значение до нуля во время выполнения, они всегда объявляются как переменные, а не как константы опционального типа.
                     """),
			
			Question(question: [
                "Можем ли мы проверять наличие значения в weak ссылке?",
                "Вы можете проверить существование значения в weak ссылке, так ли это?",
                "Мы можем проверять существование значения в weak ссылке точно так же, как и с любыми другими опциональными значениями. Это так?"
            ],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 id: 193631869,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     Да. Вы можете проверить существование значения в weak ссылке точно так же как и с любыми другими опциональными значениями, и вы никогда не будете иметь ссылку с недопустимым значением, например, указывающую на несуществующий экземпляр.
                     """),
			
			Question(question: [
                "Вызываются ли наблюдатели свойств (didSet / willSet), когда ARC устанавливает слабую (weak) ссылку на nil?",
                "Когда ARC устанавливает слабую (weak) ссылку на nil, вызываются ли наблюдатели свойств (didSet / willSet)?"
            ],
					 image: "",
					 optionA: "Нет",
					 optionB: "Да",
					 optionC: "",
					 optionD: "",
					 id: 857772304,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     Нет. Когда ARC устанавливает слабую (weak) ссылку на nil, наблюдатели свойств (didSet / willSet) не вызываются.
                     
                     Если у вас есть слабая (weak) ссылка на объект, и эта ссылка устанавливается в nil, то ARC автоматически удаляет этот объект из памяти, и наблюдатели willSet и didSet не вызовутся.
                     
                     Это логично, так как объект уже был уничтожен, и наблюдатель не имеет смысла.
                     """),
			
			Question(question: [
                "Чем отличается unowned ссылка от weak?",
                "Чем, кроме названия, unowned ссылка отличается от weak?",
                "unowned ссылка отличается от weak ссылки именно этим"
            ],
					 image: "",
					 optionA: "Должна иметь значение",
					 optionB: "Не должна иметь значение",
					 optionC: "Имеет опциональное значение",
					 optionD: "",
					 id: 946209029,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     Должна иметь значение. Обе weak и unowned ссылки полезны для избегания утечек памяти и retain cycle, но unowned следует использовать только в ситуациях, когда вы абсолютно уверены в том, что объект всегда будет существовать во время выполнения.
                     
                     В противном случае вы получите ошибку рантайма, когда попытаетесь обратиться к объекту через unowned, которого не существует.
                     
                     unowned ссылки имеют неопциональное значение.
                     """),
			
            Question(question: [
                "Если захваченная ссылка никогда не будет nil, нам стоит выбрать unowned или weak?",
                "Мы выбираем unowned или weak, если захваченная ссылка никогда не будет nil?"
            ],
                     image: "",
                     optionA: "unowned",
                     optionB: "weak",
                     optionC: "",
                     optionD: "",
                     id: 184898516,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     unowned. Если захваченная ссылка никогда не будет nil, то она должна быть всегда захвачена как unowned ссылка, а не слабая (weak) ссылка.
                     
                     Этот процесс похож на unwrap, когда мы знаем, что значение в данном контексте никогда не будет пустым - мы можем использовать force unwrap.
                     """),
            
			Question(question: [
                "Является ли unowned ссылка опциональной?",
                "unowned ссылка является опциональной, так ли это?"
            ],
					 image: "",
					 optionA: "Нет",
					 optionB: "Да",
					 optionC: "",
					 optionD: "",
					 id: 692696110,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     Нет. Так как unowned ссылка не является опциональной, то вам не нужно и разворачивать ее каждый раз, когда вы собираетесь ее использовать.
                     
                     Вы можете обратиться к unowned ссылке напрямую.
                     """),
			
			Question(question: [
                "Может ли ARC установить значение unowned ссылки на nil?",
                "ARC может установить значение unowned ссылки на nil, так ли это?"
            ],
					 image: "",
					 optionA: "Нет",
					 optionB: "Да",
					 optionC: "",
					 optionD: "",
					 id: 539304566,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     Нет. ARC не может установить значение unowned ссылки на nil, когда экземпляр, на который она ссылается, освобожден, так как переменные не опционального типа не могут иметь значения nil.
                     """),
			
			Question(question: [
                "Если вы попытаетесь получить доступ к unowned ссылке после того, как экземпляр, на который она ссылается освобожден, произойдет это",
                "Что произойдет, если вы вы попытаетесь получить доступ к unowned ссылке после того, как экземпляр, на который она ссылается освобожден?"
            ],
					 image: "",
					 optionA: "runtime error",
					 optionB: "Ошибка компиляции",
					 optionC: "Ничего",
					 optionD: "",
					 id: 578390717,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     Runtime error. Используйте unowned ссылки только в том случае, если вы абсолютно уверены в том, что ссылка всегда будет указывать на существующий экземпляр.
                     
                     Если вы попытаетесь получить доступ к unowned ссылке после того, как экземпляр, на который она ссылается освобожден, вы получите runtime ошибку.
                     """),
			
			Question(question: [
                "Могут ли образовываться циклы сильных ссылок, когда вы присваиваете замыкание свойству экземпляра класса, а тело замыкания захватывает экземпляр?",
                "Сильные ссылки так же могут образовываться, когда вы присваиваете замыкание свойству экземпляра класса, и тело замыкания захватывает экземпляр. Так ли это?"
            ],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 id: 463914992,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     Да. Сильные ссылки так же могут образовываться, когда вы присваиваете замыкание свойству экземпляра класса, и тело замыкания захватывает экземпляр.
                     
                     Этот захват может случиться из-за того, что тело замыкания получает доступ к свойству экземпляра, например self.someProperty, или из-за того, что замыкание вызывает метод типа self.someMethod().
                     
                     В обоих случаях эти доступы и вызывают тот самый “захват” self, при этом создавая цикл сильных ссылок (retain cycles).
                     
                     Этот цикл возникает из-за того, что замыкания, как и классы, являются ссылочными типами.
                     
                     Когда вы присваиваете замыкание свойству, вы присваиваете ссылку на это замыкание.
                     """),
			
			Question(question: [
                "Не допустить цикла сильных ссылок между замыканием и экземпляром класса можно этим путем",
                "Вы можете сделать это, чтобы не допустить цикла сильных ссылок между замыканием и экземпляром класса"
            ],
					 image: "",
					 optionA: "Определение списка захвата",
					 optionB: "Использование lazy свойств",
					 optionC: "Использовать strong ссылки",
					 optionD: "",
					 id: 239563627,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     Определение списка захвата. Когда замыкание захватывает значения из окружающей области видимости, оно может создать ссылку на эти значения, что может повлиять на управление памятью и привести к созданию ритейн-циклов.
                     
                     Определение списка захвата позволяет явно управлять этим процессом и предотвратить нежелательное поведение, такое как утечки памяти.

                     В определении списка захвата вы указываете, какие переменные или константы должны быть захвачены как weak или unowned ссылки внутри замыкания.
                     
                     Чаще всего вы будете встречать захват self ([weak self]).
                     """),
			
			Question(question: [
                "Внутри каких скобок вы должны создавать список захвата?",
                "Список захвата создается внутри таких скобок"
            ],
					 image: "",
					 optionA: "Квадратных []",
					 optionB: "Фигурных {}",
					 optionC: "Круглых ()",
					 optionD: "",
					 id: 236978042,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     Квадратных []. Каждый элемент в списке захвата является парой ключевого слова weak или unowned и ссылки на экземпляр класса (например, self) или переменная инициализированная с помощью какого-либо значения (например, delegate = self.delegate!).
                     
                     Эти пары вписываются в квадратные скобки и разделяются между собой запятыми.
                     """),
			
			Question(question: [
                "Если у замыкания нет списка параметров или возвращаемого типа, как мы должны разместить список захвата?",
                "Как мы размещаем список захвата, если у замыкания нет списка параметров или возвращаемого типа?"
            ],
					 image: "",
					 optionA: "До ключевого in",
					 optionB: "После ключевого in",
					 optionC: "Не принципиально",
					 optionD: "",
					 id: 803221175,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting"
                     ],
                     helpText: """
                     До ключевого in. Если у замыкания нет списка параметров или возвращаемого типа, то вы можете разместить список захвата непосредственно после открывающей скобки замыкания и перед его телом.
                     
                     Вот пример синтаксиса, как это может выглядеть:

                     { [weak self] in
                         // Тело замыкания
                     }
                     """),
            
            Question(question: [
                ""
            ],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     id: 000_000_000,
                     links: [
                        ""
                     ],
                     helpText: """
                     text
                     """
                    ),
		]
	}
}
