//
//  Interview.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 20.01.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import Foundation

final class Interview3 {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "Что мы получим в консоль?"
            ],
                     image: "Closures05",
                     optionA: "5, 10",
                     optionB: "5, 5",
                     optionC: "Получим ошибку",
                     optionD: "",
                     id: 876333566,
                     links: [
                        "https://swiftbook.ru/content/languageguide/closures/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/"
                     ],
                     helpText: """
                     5, 10. Мы создаем параметр типа Int и выводим его значение на консоль с помощью замыкания.
                     
                     Int — это структура (value type), значение которого должно передаваться копированием. Но при этом замыкание всегда выводит актуальное значение параметра.
                     
                     Это говорит о том, что внутри замыкания используется не копия параметра a, а ссылка на него.
                     
                     Это пример того, как значимый тип данных может быть передан по ссылке, замыкания всегда захватывают значения по ссылке, а не копированием, даже value type.
                     """
                    ),
            
            Question(question: [
                "Должны ли мы использовать [weak self] в данном случае?"
            ],
                     image: "ARC01",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "Зависит от ситуации",
                     optionD: "",
                     id: 923997241,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting",
                        "https://www.youtube.com/watch?v=0sOrVoLOf7Q"
                     ],
                     helpText: """
                     Нет. В данном случае использование [weak self] внутри замыкания map не обязательно, так как map является non-escaping closure.
                     
                     То есть замыкание используется только временно, для преобразования значений массива [1, 2, 3] с использованием метода format, и затем оно освобождается.
                     
                     Оно не сохраняется для последующего использования, поэтому здесь нет необходимости использовать [weak self].
                     """
                    ),
            
            Question(question: [
                "Обязаны ли мы указывать self при использовании format(value)?"
            ],
                     image: "ARC02",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "Зависит от ситуации",
                     optionD: "",
                     id: 831980655,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting",
                        "https://www.youtube.com/watch?v=0sOrVoLOf7Q"
                     ],
                     helpText: """
                     Нет. map является non-escaping closure, поэтому если убрать self - компилятор не будет возражать.
                     
                     По этой же причине здесь нет необходимости использовать [weak self].
                     """
                    ),
            
            Question(question: [
                "Обязательно ли писать [weak self] в данном случае?"
            ],
                     image: "ARC03",
                     optionA: "Зависит от ситуации",
                     optionB: "Нет",
                     optionC: "Да",
                     optionD: "",
                     id: 158133098,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting",
                        "https://www.youtube.com/watch?v=0sOrVoLOf7Q"
                     ],
                     helpText: """
                     Зависит от ситуации. Большинство будет настаивать на том, что использование слабой ссылки здесь обязательно (asyncAfter является @escaping замыканием), что так будет правильнее и нагляднее, но все зависит от поведения, которое вы преследуете.
                     
                     Если вы хотите внутри блока отправить, например, некую собираемую статистику, вы можете не использовать слабую ссылку, и уходя с экрана - ровно через две секунды (или смотря сколько будет задержка), замыкание выполнится, и экран будет деинициализирован.
                     
                     Утечки памяти не произойдет, но ваша логика выполнится, потому что объект не будет к этому времени удален из памяти.
                     """
                    ),
            
            Question(question: [
                "Будет ли объект деинициализирован в таком случае?"
            ],
                     image: "ARC04",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 907876486,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/",
                        "https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting",
                        "https://www.youtube.com/watch?v=0sOrVoLOf7Q"
                     ],
                     helpText: """
                     Да. Объект деинициализируется после задержки, когда замыкание выполнится (если мы больше никаким другим образом не держим этот объект, например - ушли с контроллера и он больше не используется).
                     """
                    ),
        ]
    }
}
