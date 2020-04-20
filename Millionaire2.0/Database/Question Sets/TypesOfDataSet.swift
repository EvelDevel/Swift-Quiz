
//  Created by Евгений Никитин on 15.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class TypesOfDataSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: "Тип данных, отвечающий за хранение отдельных Unicode-символов",
                     optionA: "Bool",
                     optionB: "Float",
                     optionC: "Character",
                     optionD: "String",
                     correctAnswer: 3),
            
            Question(question: "Тип данных, отвечающий за хранение произвольной текстовой информации",
                     optionA: "Float",
                     optionB: "String",
                     optionC: "Character",
                     optionD: "Bool",
                     correctAnswer: 2),
            
            Question(question: "Какой тип данных хранит числа, не содержащие дробной части (например 42 или -23)?",
                     optionA: "UInt",
                     optionB: "Int",
                     optionC: "Float",
                     optionD: "Double",
                     correctAnswer: 2),
            
            Question(question: "Все типы в Swift пишутся с ...",
                     optionA: "Строчной буквы",
                     optionB: "Греческой цифры",
                     optionC: "Заглавной буквы",
                     optionD: "Текущей даты",
                     correctAnswer: 3),
            
            Question(question: "Как получить доступ к минимальному и максимальному значению каждого типа целого числа?",
                     optionA: "first и last",
                     optionB: "min и max",
                     optionC: "count",
                     optionD: "first и max",
                     correctAnswer: 2),
            
            Question(question: "Какой тип может хранить более длинные дробные числа?",
                     optionA: "Double",
                     optionB: "Float",
                     optionC: "Character",
                     optionD: "String",
                     correctAnswer: 1),
            
            Question(question: "Какой тип хранит только положительные целые числа?",
                     optionA: "Int",
                     optionB: "Int64",
                     optionC: "UInt",
                     optionD: "Character",
                     correctAnswer: 3),
            
            Question(question: "Фиксированная последовательность символов, окруженная двойными кавычками",
                     optionA: "Числовой литерал",
                     optionB: "Строковый литерал",
                     optionC: "Литерал",
                     optionD: "Натурал",
                     correctAnswer: 2),
            
            Question(question: "Фиксированная последовательность цифр, начинающаяся либо с цифры, либо с префиксного оператора «-» или «+»",
                     optionA: "Оператор",
                     optionB: "Числовой литерал",
                     optionC: "Строковый литерал",
                     optionD: "Генерал",
                     correctAnswer: 2),
            
            Question(question: "Как можно объявлять тип данных?",
                     optionA: "Внятно",
                     optionB: "Неявно",
                     optionC: "Явно или Неявно",
                     optionD: "Внятно или Явно",
                     correctAnswer: 3),
            
            Question(question: "Можно ли использовать переменную или константу, с явным типом данных, до ее инициализации?",
                     optionA: "Можно",
                     optionB: "Нельзя",
                     optionC: "Не совсем",
                     optionD: "Только в день рождения",
                     correctAnswer: 2),
            
            Question(question: "Какой тип может хранить любое целое число в пределах от -2 147 483 648 до 2 147 483 647?",
                     optionA: "Uint32",
                     optionB: "Decimal",
                     optionC: "Int32",
                     optionD: "Int64",
                     correctAnswer: 3),
            
            Question(question: "Если в коде не указать размер целого числа, каким оно будет?",
                     optionA: "Согласно разрядности системы",
                     optionB: "32",
                     optionC: "64",
                     optionD: "128",
                     correctAnswer: 1),
            
            Question(question: "Как называется объявление переменной с присваиванием ей значения?",
                     optionA: "Инаугурация",
                     optionB: "Возведение",
                     optionC: "Объявление",
                     optionD: "Инициализация",
                     correctAnswer: 4),
            
            Question(question: "Какую точность в десятичных цифрах имеет тип Double?",
                     optionA: "15 десятичных цифр",
                     optionB: "6 десятичных цифр",
                     optionC: "12 десятичных цифр",
                     optionD: "18 десятичных цифр",
                     correctAnswer: 1),
            
            Question(question: "Какую точность в десятичных цифрах имеет тип Float?",
                     optionA: "4 десятичных цифр",
                     optionB: "6 десятичных цифр",
                     optionC: "12 десятичных цифр",
                     optionD: "10 десятичных цифр",
                     correctAnswer: 2),
            
            Question(question: "Если равноценно использование обоих типов с плавающей точкой, использование какого предпочтительнее?",
                     optionA: "Double",
                     optionB: "Float",
                     optionC: "Decimal",
                     optionD: "String",
                     correctAnswer: 1),
            
            Question(question: "Можете ли вы передать тип Int, если некоторая часть кода ожидает тип String?",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "В некоторых случаях",
                     optionD: "По настроению",
                     correctAnswer: 2),
            
            Question(question: "По сколько кавычек ставится при открытии и закрытии многострочного литерала?",
                     optionA: "По 1",
                     optionB: "По 2",
                     optionC: "По 3",
                     optionD: "По 4",
                     correctAnswer: 3),
            
            Question(question: "Каким символом(ами) осуществляется перенос строки в многострочном строковом литерале?",
                     optionA: "Звездочка",
                     optionB: "Обратный слеш",
                     optionC: "Нажимаем Enter",
                     optionD: "Тире",
                     correctAnswer: 2),
            
            Question(question: "Как можно инициализировать пустую строку?",
                     optionA: "Пустые кавычки после =",
                     optionB: "= [String]",
                     optionC: "Первые два варианта",
                     optionD: "Оба варианта неверны",
                     correctAnswer: 1),
            
            Question(question: "Способ создать новое значение типа String из разных констант, переменных, литералов и выражений, включая их значения в строковый литерал",
                     optionA: "Конкатенация",
                     optionB: "Интерполяция",
                     optionC: "Объединение строк",
                     optionD: "Вкрапление значений",
                     correctAnswer: 2),
            
            Question(question: "Каким образом можно добавить значение типа Character к переменной типа String?",
                     optionA: "Комбинированные операторы",
                     optionB: "Конкатенация",
                     optionC: "Приведение типов",
                     optionD: "Используя String append",
                     correctAnswer: 4),
            
            Question(question: "Можно ли сравнивать две строки?",
                     optionA: "Нет",
                     optionB: "Можно, только на равенство",
                     optionC: "Можно, только на неравенство",
                     optionD: "Можно, через операторы == и !=",
                     correctAnswer: 4),
            
            Question(question: "Что вернется, при сравнении двух String?",
                     optionA: "Bool",
                     optionB: "String",
                     optionC: "Character",
                     optionD: "+ или -",
                     correctAnswer: 1)
        ]
    }
}


