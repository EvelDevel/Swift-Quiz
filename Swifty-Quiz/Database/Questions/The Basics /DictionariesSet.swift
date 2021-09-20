//
//  DictionariesSet.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 04.07.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation

class DictionariesSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: ["Если массив или словарь присвоены переменной, можем ли мы их изменять?",
                                "Можем ли мы изменять словарь или массив, если он присвоен переменной?",
                                "Возможно ли изменять словарь, если при создании мы присвоили его переменной?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Только добавлять элементы",
                     optionC: "Только удалять элементы",
                     optionD: "Нет",
                     questionId: 297589520,
                     helpText: "Когда вы создаете массив или словарь и присваиваете его переменной, то созданная коллекция будет изменяемой. Это означает, что вы можете изменить коллекцию после ее создания путем добавления, удаления, или изменения элементов этой коллекции. И наоборот, когда вы присвоите массив или словарь константе, то он будет неизменяемым, а его размер и содержимое не может быть изменено."),
            
            Question(question: ["С помощью какой функции мы можем объединить две разные последовательности значений в один словарь?",
                                "Эта функция позволит вам объединить две последовательности в один словарь",
                                "С помощью этой функции вы можете проинициализировать две последовательности значений в один словарь"],
                     image: "",
                     optionA: "zip(_:_:)",
                     optionB: "Dictionary()",
                     optionC: "mapValues(_:)",
                     optionD: "Subscripting",
                     questionId: 143207269,
                     helpText: "Функция zip(_:_:) возвращает последовательность пар, основанную на двух базовых последовательностях, после чего должна передавать его свойству uniqueKeysWithValues инициализатора Dictionary. Результирующий словарь будет содержать в качестве ключей значения первой базовой коллекции, а в качестве значения - элементы второй базовой коллекции."),
            
            Question(question: ["Какое ключевое слово используется для маппинга словаря?",
                                "Ключевое слово, которое используется при маппинге словарей?"],
                     image: "",
                     optionA: ".mapValues",
                     optionB: ".map",
                     optionC: ".filter",
                     optionD: ".reduce",
                     questionId: 224757982,
                     helpText: "Обработка (маппинг) значений элементов словарей делается с помощью метода mapValues(_:), в который передается замыкание. Доступ осуществляется поочередно к значению каждого элемента словаря."),
            
            Question(question: ["Какие города объединятся в словаре grouped при группировке словаря по такому признаку?"],
                     image: "Collections76",
                     optionA: "Shanghai и Seoul",
                     optionB: "Shanghai и Karachi",
                     optionC: "Shanghai и Beijing",
                     optionD: "Beijing и Karachi",
                     questionId: 833782801,
                     helpText: "Shanghai и Seoul. При инициализации словаря используется входной аргумент grouping, в качестве значения которому передается анализируемые ключи словаря cities. После инициализатора указывается замыкание, в соответствии с которым и производится группировка значений (в данном случае по первому символу ключа)."),

            Question(question: ["Можем ли мы присваивать значение по умолчанию для элемента словаря, которое будет возвращаться при попытках обратиться по несуществующему ключу?",
                                "Чтобы избежать nil, при попытке обратиться к несуществующему элементу словаря, мы можем присвоить дефолтное значение, которое будет возвращаться. Так ли это?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 938357634,
                     helpText: "Если вы используете доступ к элементам словаря через сабскрипт, то при попытке обратиться по неcуществующему имени вам будет возвращен nil. Теперь вы можете указать значение по умолчанию, которое будет возвращено при попытке доступа к несуществующему элементу. Для этого служит свойство default, указываемое в сабскрипте. [key, default: value]."),
            
            Question(question: ["Какое значение мы получим в консоль?"],
                     image: "Subscripts15",
                     optionA: "4",
                     optionB: "3",
                     optionC: "2",
                     optionD: "Столкнемся с ошибкой",
                     questionId: 119883281,
                     helpText: "Правильный ответ: 4. В примере мы объявляем переменную numberOfLegs и инициализируем ее с помощью литерала словаря, который содержит три пары ключ-значение. Тип словаря numberOfLegs выводится как [String: Int]. После того как словарь создан, в этом примере используется сабскриптное присваивание для добавления ключа типа String “птичка“, значения типа Int 2."),
            
            Question(question: ["Что вернет функция addNewBook(), если в нашей library уже будет Book с таким book.id?"],
                     image: "Collections72",
                     optionA: "false",
                     optionB: "true",
                     optionC: "Значение book.id",
                     optionD: "Столкнемся с ошибкой",
                     questionId: 637371673,
                     helpText: "Метод updateValue(forKey:) устанавливает значение для ключа если оно не существует, или обновляет значение, если этот ключ уже существует. Например, для словаря, который хранит String значения, метод вернет String? тип, или опциональный String. Это опциональное значение содержит старое значение для этого ключа, если оно существовало до обновления, либо nil если значение не существовало. В нашем случае, так как книга уже находится в нашей library, функция вернет нам уже имевшуюся там Book?, а значит при сравнении с nil (== nil) мы получим false."),
            
            Question(question: ["Что вернет функция deleteBook(), если в нашей library уже будет Book с таким book.id?"],
                     image: "Collections73",
                     optionA: "true",
                     optionB: "false",
                     optionC: "Значение book.id",
                     optionD: "",
                     questionId: 129673386,
                     helpText: "Можно удалить пару ключ-значение из словаря с помощью метода removeValue(forKey:). Этот метод удаляет пару ключ-значение если она существует и затем возвращает значение, либо возвращает nil если значения не существует. В нашем случае, книга уже находится в библиотеке, а значит при удалении нам вернется ее значение. При сравнении на неравенство nil (!= nil) мы получим true."),
            
            Question(question: ["Как правильно пишется тип словаря в полной форме?",
                                "Выберите вариант, где корректно указан тип словаря в полной форме",
                                "В полной форме тип словаря записывается именно так"],
                     image: "",
                     optionA: "Dictionary<KeyType, ValueType>",
                     optionB: "Dictionary<KeyType>, <ValueType>",
                     optionC: "Dictionary(KeyType, ValueType)",
                     optionD: "<Dictionary(KeyType, ValueType)>",
                     questionId: 568668338,
                     helpText: "В Swift тип словаря в полной форме пишется как Dictionary<KeyType, ValueType>, где KeyType это тип значения который используется как ключ словаря, а ValueType это тип значения который словарь может хранить для этих ключей. Тип словаря KeyType должен подчиняться протоколу Hashable, как тип значения множества."),
            
            Question(question: ["В каком варианте указана валидная инициализация коллекции?"],
                     image: "Collections12",
                     optionA: "В обоих вариантах",
                     optionB: "Вариант №1",
                     optionC: "Вариант №2",
                     optionD: "",
                     questionId: 679959817,
                     helpText: "В нашем случае - оба варианта являются корректными с точки зрения инициализации."),
            
            Question(question: ["У типа словаря есть краткая форма записи? Если да, то какая?",
                                "Есть ли краткая форма записи у словаря? Если да, то какая?"],
                     image: "",
                     optionA: "Да, [KeyType: ValueType]",
                     optionB: "Да, KeyType: ValueType",
                     optionC: "Да, <KeyType, ValueType>",
                     optionD: "Нет",
                     questionId: 950557602,
                     helpText: "Вы можете написать словарь в сокращенной форме как [KeyType: ValueType]. Хотя две формы функционально идентичны (полная и краткая), краткая форма является предпочтительной."),
            
            Question(question: ["Как мы можем создать пустой словарь определенного типа с помощью синтаксиса инициализатора?",
                                "Создать пустой словарь определенного типа с помощью синтаксиса инициализатора мы можем именно так",
                                "Выберите вариант корректного создания пустого словаря с помощью синтаксиса инициализатора"],
                     image: "",
                     optionA: "var names = [Int: String]()",
                     optionB: "var names = Int: String[]",
                     optionC: "var names: [Int: String] = ()",
                     optionD: "var names: (Int: String) = []",
                     questionId: 463070928,
                     helpText: "Подобно массивам вы можете создать пустой словарь определенного типа с помощью синтаксиса инициализатора: var names = [Int: String](). В этом примере создается пустой словарь с типом [Int: String] для хранения удобных для восприятия имен числовых значений. Его ключи имеют тип Int, а значения - String."),
            
            Question(question: ["Как пишется литерал пустого словаря?",
                                "Литерал пустого словаря пишется именно так",
                                "Выберите вариант правильного написания литерала пустого словаря"],
                     image: "",
                     optionA: "[:]",
                     optionB: "[]",
                     optionC: "[](:)",
                     optionD: "{:}",
                     questionId: 217639254,
                     helpText: "Если контекст уже предоставляет информацию о типе (ранее мы уже инициализировали значения), вы можете создать пустой словарь с помощью литерала пустого словаря, который пишется как [:] ( двоеточие внутри пары квадратных скобок)."),
            
            Question(question: ["Выберите правильное создание словаря через литерал словаря",
                                "Словарь создается литералом словаря именно так",
                                "Какой из вариантов показывает правильно создание словаря через литерал словаря?"],
                     image: "",
                     optionA: "var a: [Int: String] = [0: \"Name\"]",
                     optionB: "var b = [Int: String](1: \"Name\")",
                     optionC: "var c: (Int: String)[0: \"Name\"]",
                     optionD: "var d: <Int: String>[0: \"Name\"]",
                     questionId: 891705705,
                     helpText: "Вы можете инициализировать словарь с помощью литерала словаря, который имеет схожий синтаксис с литералом массива. Литерал словаря это краткий способ написать одну или несколько пар ключ-значение в виде коллекций словаря. В литерале словаря, ключ и значение в каждой паре ключ-значение разделено двоеточием. Пары написаны как список, разделенный запятыми и окруженный парой квадратных скобок."),
            
            Question(question: ["Какой тип Swift присвоит этому словарю?",
                                "Swift присвоит этому словарю такой тип",
                                "Выберите какой тип присвоит этому словарю Swift"],
                     image: "Collections62",
                     optionA: "[Double : String]",
                     optionB: "[Int : Character]",
                     optionC: "[Int : String]",
                     optionD: "[Float : String]",
                     questionId: 813582489,
                     helpText: "Правильный ответ [Double : String], поскольку стандартно присваивается тип Double любому числу с плавающей точкой, без явного указания типа. Вторая часть, значение словаря, имеет тип String."),
            
            Question(question: ["Каким образом можно добавлять и изменять элементы словаря через синтаксис индексов?",
                                "Как через синтаксис индексов можно добавлять и изменять значения словаря?"],
                     image: "",
                     optionA: "dictionary[Key] = Value",
                     optionB: "dictionary.Key(Value)",
                     optionC: "dictionary.Key = [Value]",
                     optionD: "Значения словаря неизменяемы",
                     questionId: 751274678,
                     helpText: "Вы можете добавить новый элемент в словарь с помощью синтаксиса индексов. Используйте новый ключ соответствующего типа в качестве индекса, а затем присвойте новое значение соответствующего типа. Вы также можете использовать синтаксис индексов для изменения значения связанного с определенным ключом. Правильный ответ: dictionary[Key] = Value."),
            
            Question(question: ["Альтернативный способ установить или обновить значение для определенного ключа словаря",
                                "Установить или обновить значение для определенного ключа словаря можно таким способом",
                                "Как без использования синтаксиса индексов установить или обновить значение для определенного ключа словаря?"],
                     image: "",
                     optionA: "updateValue(forKey:)",
                     optionB: "update(key:)",
                     optionC: "changeValue(forKey:)",
                     optionD: "change(key:)",
                     questionId: 959889447,
                     helpText: "В качестве альтернативы индексам, можно использовать метод словаря updateValue(forKey:), чтобы установить или обновить значение для определенного ключа. Метод updateValue(forKey:) устанавливает значение для ключа если оно не существует, или обновляет значение, если этот ключ уже существует. Однако, в отличие от индексов, метод updateValue(forKey:) возвращает старое значение после выполнения обновления. Это позволяет вам проверить состоялось ли обновление или нет."),
            
            Question(question: ["Если при применении updateValue(forKey:) значение не существовало, что нам вернется?",
                                "Что вернется, если при применении updateValue(forKey:) к словарю, данное значение не существовало?"],
                     image: "",
                     optionA: "nil",
                     optionB: "0",
                     optionC: "Ничего",
                     optionD: "Опциональный тип",
                     questionId: 206704919,
                     helpText: "Метод updateValue(forKey:) возвращает опциональное значение соответствующее типу значения словаря. Например, для словаря, который хранит String значения, метод вернет String? тип, или опциональный String. Это опциональное значение содержит старое значение для этого ключа, если оно существовало до обновления, либо nil если значение не существовало."),
            
            Question(question: ["Если мы попытаемся получить доступ в несуществующему значению словаря через синтаксис индексов, что мы получим?",
                                "Что вернется при попытке получить доступ к несуществующему значению словаря через синтаксис индексов?"],
                     image: "",
                     optionA: "nil",
                     optionB: "Ничего",
                     optionC: "Рандомное значение",
                     optionD: "Столкнемся с ошибкой",
                     questionId: 543232667,
                     helpText: "Поскольку есть вероятность запросить ключ для несуществующего значения, индекс словаря возвращает опциональное значение соответствующее типу значений словаря. Если словарь содержит значение для запрошенного ключа, индекс возвращает опциональное значение, содержащее существующее значение для этого ключа. В противном случае индекс возвращает nil."),
            
            Question(question: ["Как мы можем удалить пару ключ-значение из словаря с помощью синтаксиса индексов?",
                                "Мы можем удалить пару ключ-значение из словаря с использованием синтаксиса индексов, как?",
                                "Каким образом, используя синтаксис индексов, вы можете удалить из словаря пару ключ-значение?"],
                     image: "",
                     optionA: "dict[Key] = nil",
                     optionB: "dict[Key] = []",
                     optionC: "dict[Key] = 0",
                     optionD: "dict[Key].remove()",
                     questionId: 255571974,
                     helpText: "Вы можете использовать синтаксис индексов для удаления пары ключ-значение из словаря путем присвоения nil значению для этого ключа."),
            
            Question(question: ["Этот метод удаляет пару ключ-значение если она существует и затем возвращает значение, либо возвращает nil если значения не существует",
                                "Метод, который удаляет пару ключ-значение если она существует, а затем возвращает значение, либо возвращает nil если значения не существует"],
                     image: "",
                     optionA: "removeValue(forKey:)",
                     optionB: "remove(forKey:)",
                     optionC: "removeValue(Key:)",
                     optionD: "deleteValue(forKey:)",
                     questionId: 822224219,
                     helpText: "Можно удалить пару ключ-значение из словаря с помощью метода removeValue(forKey:). Этот метод удаляет пару ключ-значение если она существует и затем возвращает значение, либо возвращает nil если значения не существует."),
        ]
    }
}
