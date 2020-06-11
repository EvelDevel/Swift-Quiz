
//  Created by Евгений Никитин on 12.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class StructuresAndClassesSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: ["Как будет \"Структуры\" по Английски?"],
                     image: "",
                     optionA: "Structures",
                     optionB: "Classes",
                     optionC: "Enumerations",
                     optionD: "Collections",
                     correctAnswer: 1,
                     questionId: 1,
                     helpText: "Правильный ответ: Structures. "),
            
            Question(question: ["Как будет \"Классы\" по Английски?"],
                     image: "",
                     optionA: "Classes",
                     optionB: "Structures",
                     optionC: "Enumerations",
                     optionD: "Collections",
                     correctAnswer: 1,
                     questionId: 2,
                     helpText: "Правильный ответ: Classes."),
            
            Question(question: ["Какими ключевыми словами обозначаются структуры и классы в коде?",
                                "Ключевые слова, которыми обозначаются классы и структуры в коде"],
                     image: "",
                     optionA: "class и struct",
                     optionB: "classes и structures",
                     optionC: "class и structures",
                     optionD: "classes и struct",
                     correctAnswer: 1,
                     questionId: 3,
                     helpText: "Классы и структуры имеют схожий синтаксис объявления. Для объявления классов, используйте ключевое слово class, а для структур - ключевое слово struct. В обоих случаях необходимо поместить все определение полностью внутрь пары фигурных скобок"),
            
            Question(question: ["Что можно объявить внутри классов и структур для добавления функциональности?",
                                "Для добавления функциональности внутри классов и структур мы можем объявлять это",
                                "Что вы можете добавить в класс или структуру, чтобы добавить им функциональности?"],
                     image: "",
                     optionA: "Свойства и методы",
                     optionB: "Константы и переменные",
                     optionC: "Функции и замыкания",
                     optionD: "Комментарии",
                     correctAnswer: 1,
                     questionId: 4,
                     helpText: "Классы и структуры являются универсальными и гибкими конструкциями, которые станут строительными блоками для кода вашей программы. Для добавления функциональности в классах и структурах можно объявить свойства и методы, применив тот же синтаксис, как и при объявлении констант, переменных и функций."),
            
            Question(question: ["Требует ли Swift создавать отдельные файлы для интерфейсов и реализаций пользовательских классов и структур?",
                                "Свифт требует создавать отдельные файлы для реализации пользовательских классов и структур, так ли это?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 5,
                     helpText: "В отличие от других языков программирования, Swift не требует создавать отдельные файлы для интерфейсов и реализаций пользовательских классов и структур. В Swift, вы объявляете структуру или класс в одном файле, и внешний интерфейс автоматически становится доступным для использования в другом коде."),
            
            Question(question: ["Как традиционно называют экземпляр класса в ООП?"],
                     image: "",
                     optionA: "Объект",
                     optionB: "Экземпляр",
                     optionC: "Таргет",
                     optionD: "Структура",
                     correctAnswer: 1,
                     questionId: 6,
                     helpText: "Экземпляр класса традиционно называют объектом."),
            
            Question(question: ["Можем ли мы применять функциональность экземпляров класса к экземплярам структуры?",
                                "Применима ли функциональность классов к структурам?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 7,
                     helpText: "Экземпляр класса традиционно называют объектом. Тем не менее, классы и структуры в Swift гораздо ближе по функциональности, чем в других языках, и многое в этой главе описывает функциональность, которую можно применить к экземплярам и класса, и структуры."),
            
            Question(question: ["Выберите то, что не является общей чертой класса и структуры",
                                "Что не является общей чертой классов и структур?"],
                     image: "",
                     optionA: "Можно использовать деиниализатор",
                     optionB: "Можно объявлять свойства",
                     optionC: "Можно объявлять методы",
                     optionD: "Можно объявлять инициализаторы",
                     correctAnswer: 1,
                     questionId: 8,
                     helpText: "Вы не можете использовать деинициализатор у структуры. Классы и структуры в Swift имеют много общего. И в классах и в структурах можно: Объявлять свойства для хранения значений. Объявлять методы, чтобы обеспечить функциональность. Объявлять индексы, чтобы обеспечить доступ к их значениям, через синтаксис индексов. Объявлять инициализаторы, чтобы установить их первоначальное состояние. Они оба могут быть расширены, чтобы расширить их функционал за пределами стандартной реализации. Они оба могут соответствовать протоколам, для обеспечения стандартной функциональности определенного типа"),
            
            Question(question: ["Могут ли структуры соответствовать протоколам, чтобы обеспечивать стандартную функционального определенного типа?",
                                "Могут ли классы соответствовать протоколам, чтобы обеспечивать функциональность определенного типа?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 9,
                     helpText: "Они оба могут соответствовать протоколам, для обеспечения стандартной функциональности определенного типа."),
            
            Question(question: ["Позволяет ли наследование одной структуре наследовать характеристики другой?",
                                "Есть ли у структуры возможность использования приведения типов?",
                                "Можем ли мы пользоваться деинициализаторами в структуре?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 10,
                     helpText: "Классы имеют дополнительные возможности, которых нет у структур: Наследование позволяет одному классу наследовать характеристики другого. Приведение типов позволяет проверить и интерпретировать тип экземпляра класса в процессе выполнения. Деинициализаторы позволяют экземпляру класса освободить любые ресурсы, которые он использовал. Подсчет ссылок допускает более чем одну ссылку на экземпляр класса."),
            
            Question(question: ["С чем связаны дополнительные возможности поддержки классов в Swift?"],
                     image: "",
                     optionA: "С увеличением сложности",
                     optionB: "Со снижением сложности",
                     optionC: "С архитектурой языка",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 11,
                     helpText: "Дополнительные возможности поддержки классов связаны с увеличением сложности. Лучше использовать структуры и перечисления, потому что их легче понимать. Также не забывайте про классы. На практике - большинство пользовательских типов данных, с которыми вы работаете - это структуры и перечисления."),
            
            Question(question: ["Имена классов и структур в Swift должны начинаться с UpperCamelCase или lowerCamelCase?",
                                "Вы должны писать имена структур и классов в Swift в этом стиле написания составных слов",
                                "Какой стиль написания составных слов вы должны использовать при написании имен классов и структур?"],
                     image: "",
                     optionA: "UpperCamelCase",
                     optionB: "lowerCamelCase",
                     optionC: "Зависит от команды",
                     optionD: "Без разницы",
                     correctAnswer: 1,
                     questionId: 12,
                     helpText: "Чего бы вы не создавали, новый класс или структуру, вы фактически создаете новый тип в Swift. Назначайте имена типов, используя UpperCamelCase(SomeClass или SomeStructure), чтобы соответствовать стандартам написания имен типов в Swift (например, String, Int и Bool)."),

            Question(question: ["Имена свойств и методов в Swift должны начинаться с UpperCamelCase или lowerCamelCase?",
                                "Вы должны писать имена свойств и методов в Swift в этом стиле написания составных слов",
                                "Какой стиль написания составных слов вы должны использовать при написании имен свойств и методов?"],
                     image: "",
                     optionA: "lowerCamelCase",
                     optionB: "UpperCamelCase",
                     optionC: "Зависит от команды",
                     optionD: "На ваше усмотрение",
                     correctAnswer: 1,
                     questionId: 13,
                     helpText: "Всегда назначайте свойствам и методам имена в lowerCamelCase (например, frameRate и incrementCount), чтобы отличить их от имен типов."),

            Question(question: ["Сами по себе классы или структуры описывают специфику каких-либо объектов?",
                                "Классы и структуры, сами по себе описывают специфику каких-либо объектов?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "Только классы",
                     optionD: "Только структуры",
                     correctAnswer: 1,
                     questionId: 14,
                     helpText: "Сами по себе классы и структуры не описывают специфику каких-либо объектов. Для того чтобы это сделать нам нужно создать экземпляр структуры или класса."),

            Question(question: ["Чтобы создать экземпляр класса, какой синтаксис необходимо использовать?",
                                "Как мы можем создать экземпляр структуры?",
                                "Экземпляры классов и структур можно создать через этот синтаксис"],
                     image: "",
                     optionA: "let objectName = ClassName()",
                     optionB: "let objectName: ClassName = ()",
                     optionC: "let objectName = (ClassName)()",
                     optionD: "let objectName = ClassName[]",
                     correctAnswer: 1,
                     questionId: 15,
                     helpText: "И классы и структуры используют синтаксис инициализатора для образования новых экземпляров. Самая простая форма синтаксиса инициализатора - использование имени типа и пустые круглые скобки сразу после него Resolution(), VideoMode(). Это создает новый экземпляр класса или структуры с любыми инициализированными свойствами с их значениями по умолчанию."),

            Question(question: ["Как мы можем получить доступ к свойствам экземпляра?",
                                "Через данный синтаксис мы можем получить доступ к свойствам экземпляра класса",
                                "Через этот синтаксис мы можем получить доступ к свойствам экземпляра структуры"],
                     image: "",
                     optionA: "Точечный синтаксис",
                     optionB: "Синтаксис индексов",
                     optionC: "Синтаксис инициализации",
                     optionD: "Синтаксис деинициализатора",
                     correctAnswer: 1,
                     questionId: 16,
                     helpText: "Вы можете получить доступ к свойствам экземпляра, используя точечный синтаксис. В точечном синтаксисе имя свойства пишется сразу после имени экземпляра, а между ними вписывается точка (.) без пробелов. Вы так же можете углубляться дальше в подсвойства, используя тот же синтаксис через точку."),

            Question(question: ["Можем ли мы присваивать новое значение свойству экземпляра через точечный синтаксис?",
                                "Можете ли вы, через точечный синтаксис, присвоить новое значение свойству экземпляра?"],
                     image: "",
                     optionA: "Если оно является переменной",
                     optionB: "Можем всегда",
                     optionC: "Нет",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 17,
                     helpText: "Вы можете использовать точечный синтаксис для присваивания нового значения свойству экземпляра. Только если это свойство - переменная, а не константа."),

            Question(question: ["У структур и у классов есть поэлементный, автоматически генерированный инициализатор, так ли это?",
                                "У классов и структур есть автоматически генерированный, поэлементный инициализатор, это так?"],
                     image: "",
                     optionA: "Только у структур",
                     optionB: "Только у классов",
                     optionC: "И у структур и у классов",
                     optionD: "Нет",
                     correctAnswer: 1,
                     questionId: 18,
                     helpText: "Все структуры имеют автоматически генерированный \"поэлементный инициализатор\", который вы можете использовать для инициализации свойств новых экземпляров структуры. Начальные значения для свойств нового экземпляра могут быть переданы поэлементному инициализатору по имени. В отличии от структур, классы не получили поэлементного инициализатора исходных значений."),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 19,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 20,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 21,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 22,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 23,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 24,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 25,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 26,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 27,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 28,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 29,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 30,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 31,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 32,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 33,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 34,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 35,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 36,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 37,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 38,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 39,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 40,
                     helpText: ""),

            Question(question: ["",
                                "",
                                ""],
                     image: "",
                     optionA: "",
                     optionB: "",
                     optionC: "",
                     optionD: "",
                     correctAnswer: 1,
                     questionId: 41,
                     helpText: ""),
        ]
    }
}
