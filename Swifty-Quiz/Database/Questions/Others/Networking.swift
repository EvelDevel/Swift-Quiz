//
//  Networking.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 06.08.2022.
//  Copyright © 2022 Evel-Devel. All rights reserved.
//

import Foundation

class Networking {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "В каком объекте, во время запроса (HTTP Request) нам приходит информация с сервера?",
                "В этом объекте, во время запроса (HTTP Request) мы получаем с сервера всю необходимую информацию"
            ],
                     image: "",
                     optionA: "Response",
                     optionB: "Request",
                     optionC: "",
                     optionD: "",
                     questionId: 712549630,
                     helpText: """
                     Response. Взаимодействие с сервером состоит из операций запроса (Request) и ответа (Response). Клиент отправляет на сервер запрос, сервер обрабатывает его и возвращает ответ.
                     
                     Запрос (Request) — это объект, который мы отправляем на сервер, содержащий всю необходимую информацию. Ответ (Response) приходит в формате JSON (необязательно), который представляет собой совокупность пар ключ-значение.
                     """),
            
            Question(question: [
                "В каком объекте, при запросе (HTTP Request), мы передаем на сервер нужную нам информацию?",
                "С помощью какого объекта, при запросе (HTTP Request), мы можем запросить информацию с сервера?"
            ],
                     image: "",
                     optionA: "Request",
                     optionB: "Response",
                     optionC: "",
                     optionD: "",
                     questionId: 938455752,
                     helpText: """
                     Request. Взаимодействие с сервером состоит из операций запроса (Request) и ответа (Response). Клиент отправляет на сервер запрос (HTTP Request), сервер обрабатывает его и возвращает ответ.
                                          
                     Запрос (Request) — это объект, который мы отправляем на сервер, содержащий всю необходимую информацию. Ответ (Response) приходит в формате JSON (необязательно), который представляет собой совокупность пар ключ-значение.
                     """),
            
            Question(question: [
                "Являются ли заголовки (headers) и тело (message body) обязательными при HTTP-запросе к серверу?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     questionId: 529876300,
                     helpText: """
                     Нет. HTTP протокол описывает взаимодействие между двумя компьютерами (клиентом и сервером), построенное на базе сообщений, называемых запросами (Request) и ответ (Response). Каждое сообщение состоит из трех частей: стартовая строка, заголовки и тело. При этом обязательной является только стартовая строка.
                     """),
            
            Question(question: [
                "При выполнении запроса (HTTP Request), что укажет на действие, которое вы желаете совершить на сервере?"
            ],
                     image: "",
                     optionA: "Тип запроса (HTTP-method)",
                     optionB: "Заголовок (header)",
                     optionC: "Тело запроса (message body)",
                     optionD: "",
                     questionId: 490229700,
                     helpText: """
                     Тип запроса (HTTP-method). При выполнении HTTP Request - тип запроса определяет действие, которое вы желаете совершить на сервере. Вы можете отправлять запрос на один и тот же URI, но, в зависимости от метода, действия на сервере будут совершаться разные.
                     
                     GET – получить данные;
                     POST – создать данные;
                     PUT – изменить данные;
                     DELETE – удалить данные.
                     """),
            
            Question(question: [
                "Какой тип запроса (HTTP-method) позволяет получить данные с сервера?"
            ],
                     image: "",
                     optionA: "GET",
                     optionB: "PUT",
                     optionC: "HEAD",
                     optionD: "",
                     questionId: 182375931,
                     helpText: """
                     GET. При выполнении HTTP Request - тип запроса определяет действие, которое вы желаете совершить на сервере. В зависимости от метода, действия на сервере будут совершаться разные.
                     
                     GET – получить данные;
                     POST – создать данные;
                     PUT – изменить данные;
                     DELETE – удалить данные.
                     """),
            
            Question(question: [
                "Какой тип запроса (HTTP-method) позволяет создать данные на сервере?"
            ],
                     image: "",
                     optionA: "POST",
                     optionB: "CONNECT",
                     optionC: "PUT",
                     optionD: "",
                     questionId: 652587483,
                     helpText: """
                     POST. При выполнении HTTP Request - тип запроса определяет действие, которое вы желаете совершить на сервере. В зависимости от метода, действия на сервере будут совершаться разные.
                     
                     GET – получить данные;
                     POST – создать данные;
                     PUT – изменить данные;
                     DELETE – удалить данные.
                     """),
            
            Question(question: [
                "Какой тип запроса (HTTP-method) позволяет изменить имеющиеся данные на сервере?"
            ],
                     image: "",
                     optionA: "PUT",
                     optionB: "PATCH",
                     optionC: "DELETE",
                     optionD: "",
                     questionId: 457126383,
                     helpText: """
                     PUT. При выполнении HTTP Request - тип запроса определяет действие, которое вы желаете совершить на сервере. В зависимости от метода, действия на сервере будут совершаться разные.
                     
                     GET – получить данные;
                     POST – создать данные;
                     PUT – изменить данные;
                     DELETE – удалить данные.
                     """),
            
            Question(question: [
                "Какой тип запроса (HTTP-method) позволяет удалять данные с сервера?"
            ],
                     image: "",
                     optionA: "DELETE",
                     optionB: "GET",
                     optionC: "TRACE",
                     optionD: "",
                     questionId: 423597156,
                     helpText: """
                     DELETE. При выполнении HTTP Request - тип запроса определяет действие, которое вы желаете совершить на сервере. В зависимости от метода, действия на сервере будут совершаться разные.
                     
                     GET – получить данные;
                     POST – создать данные;
                     PUT – изменить данные;
                     DELETE – удалить данные.
                     """),
            
            Question(question: [
                "Где вы можете отправить вспомогательную информацию в HTTP запросе (например токен для авторизации)?",
                "При отправке HTTP запроса, куда мы можем добавить идентификатор клиента?",
                "Если вы хотите добавить в HTTP запросе источник запроса, где это лучше сделать?",
                "Где вы можете отправить вспомогательную информацию в HTTP запросе, например: время отправки запроса?",
            ],
                     image: "",
                     optionA: "В заголовках (headers)",
                     optionB: "В теле (message body)",
                     optionC: "В параметрах",
                     optionD: "",
                     questionId: 183492562,
                     helpText: """
                     В заголовках (headers). Заголовки нужны, чтобы передавать различную вспомогательную информацию.
                     
                     Обычно в них указывается идентификатор клиента, источник запроса, вариант, в котором необходим ответ, время отправки запроса, локализацию, модель устройства, с которого происходит запрос, токен для авторизации и многое другое.
                     """),
            
            Question(question: [
                "Где мы можем передать на сервер файл для загрузки при запросе (HTTP Request)?"
            ],
                     image: "",
                     optionA: "В теле (message body)",
                     optionB: "В заголовке (header)",
                     optionC: "Через параметры",
                     optionD: "",
                     questionId: 608104939,
                     helpText: """
                     В теле (message body). Тело запроса может быть пустым либо содержать информацию, которую необходимо передать на сервер, например, там может быть массив параметров или файл для загрузки.
                     """),
            
            Question(question: [
                "Что из перечисленного является схемой (scheme) URL?"
            ],
                     image: "",
                     optionA: "https",
                     optionB: "GET",
                     optionC: "PUT",
                     optionD: "func",
                     questionId: 820991515,
                     helpText: """
                     https. Схема обращения к ресурсу, как правило, имеется в виду сетевая, но могут быть и другие варианты: http, https, ftp, mailto, telnet, file.
                     
                     В браузере вы можете ее не указывать, тогда он попытается сам ее вычислить, но при самостоятельной отправке запросов из приложения - вы должны обязательно ее указать.
                     """),
            
            Question(question: [
                "Что из перечисленного является схемой (scheme) URL?"
            ],
                     image: "",
                     optionA: "http",
                     optionB: "PUT",
                     optionC: "www",
                     optionD: "",
                     questionId: 659103651,
                     helpText: """
                     http. Схема обращения к ресурсу, как правило, имеется в виду сетевая, но могут быть и другие варианты: http, https, ftp, mailto, telnet, file.
                     
                     В браузере вы можете ее не указывать, тогда он попытается сам ее вычислить, но при самостоятельной отправке запросов из приложения - вы должны обязательно ее указать.
                     """),
            
            Question(question: [
                "Можем ли мы получить ответ от сервера в формате html?",
                "Можем ли мы получить ответ от сервера в формате xml?",
                "Можем ли мы получить ответ от сервера в формате json?",
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 330625012,
                     helpText: """
                     Да. Чаще всего вы будете работать с json. Это современный, простой и легкий формат, в котором тоже можно описать любую структуру данных.
                     
                     Реже мобильным приложениям приходится работать с html-данными. Это, скорее, исключительный случай, когда вы хотите взаимодействовать с сайтом, который для этого не предназначен.

                     Еще один вариант – xml. Это текстовый формат представления структур данных. Он достаточно мощный, может описывать различные коллекции данных, объекты и прочее. Но, к сожалению, он очень объемный, содержит много лишней информации и в последние годы его уже не используют.
                     """),
            
            Question(question: [
                "Какие данные вы получите в response через URLSessionDataTask?"
            ],
                     image: "",
                     optionA: "data, response, error",
                     optionB: "response, error",
                     optionC: "data, error",
                     optionD: "",
                     questionId: 610015317,
                     helpText: """
                     data, response, error.
                     
                     Пример нативного URLSessionDataTask:
                     let task = urlSession.dataTask(with: url) { data, response, error in
                        // Handle response.
                     }
                     """),
            
            Question(question: [
                "Выберите основные группы HTTP статус кодов, на которые они делятся"
            ],
                     image: "",
                     optionA: """
                     Информационные;
                     Успех;
                     Перенаправление;
                     Ошибка клиента;
                     Ошибка сервера.
                     """,
                     optionB: """
                     Информационные;
                     Успех;
                     Ошибка клиента;
                     Ошибка сервера.
                     """,
                     optionC: "",
                     optionD: "",
                     questionId: 735552965,
                     helpText: """
                     Информационные, Успех, Перенаправление, Ошибка клиента, Ошибка сервера.
                     
                     Пять основных групп HTTP status codes - 1xx:
                     Informational (информационные),
                     2xx: Success (успешно),
                     3xx: Redirection (перенаправление),
                     4xx: Client Error (ошибка клиента),
                     5xx: Server Error (ошибка сервера).
                     """),
            
            Question(question: [
                "Что означает HTTP status code - 200?"
            ],
                     image: "",
                     optionA: "OK (хорошо)",
                     optionB: "Created (создано)",
                     optionC: "Accepted (принято)",
                     optionD: "",
                     questionId: 864619326,
                     helpText: """
                     OK (хорошо). 200 OK — успешный запрос. Если клиентом были запрошены какие-либо данные, то они находятся в заголовке и/или теле сообщения. Появился в HTTP/1.0.
                     
                     Сообщения данного класса информируют о случаях успешного принятия и обработки запроса клиента. В зависимости от статуса сервер может ещё передать заголовки и тело сообщения.
                     """),
            
            Question(question: [
                "Что означает HTTP status code - 400?"
            ],
                     image: "",
                     optionA: "Bad Request (некорректный запрос)",
                     optionB: "Unauthorized (не авторизован)",
                     optionC: "Forbidden (запрещено)",
                     optionD: "",
                     questionId: 351801650,
                     helpText: """
                     Bad Request (некорректный запрос). 400 Bad Request — сервер обнаружил в запросе клиента синтаксическую ошибку. Появился в HTTP/1.0.
                     
                     Класс кодов 4xx предназначен для указания ошибок со стороны клиента. При использовании всех методов, кроме HEAD, сервер должен вернуть в теле сообщения гипертекстовое пояснение для пользователя.
                     """),
            
            Question(question: [
                "Что означает HTTP status code - 500?"
            ],
                     image: "",
                     optionA: "Internal Server Error",
                     optionB: "Bad Gateway",
                     optionC: "Not Implemented",
                     optionD: "",
                     questionId: 176421222,
                     helpText: """
                     Internal Server Error. 500 Internal Server Error — любая внутренняя ошибка сервера, которая не входит в рамки остальных ошибок класса. Появился в HTTP/1.0.
                     
                     Коды 5xx выделены под случаи необработанных исключений при выполнении операций на стороне сервера. Для всех ситуаций, кроме использования метода HEAD, сервер должен включать в тело сообщения объяснение, которое клиент отобразит пользователю.
                     """),
            
            Question(question: [
                "Какой класс HTTP статус кодов информирует о случаях успешного приняти и обработки запросов клиента?"
            ],
                     image: "",
                     optionA: "2хх",
                     optionB: "1хх",
                     optionC: "3хх",
                     optionD: "",
                     questionId: 894945820,
                     helpText: """
                     2хх. Успех. Сообщения данного класса информируют о случаях успешного принятия и обработки запроса клиента. В зависимости от статуса сервер может ещё передать заголовки и тело сообщения.
                     
                     Одно из часто встречающихся сообщений этого класса - 200 OK — успешный запрос. Если клиентом были запрошены какие-либо данные, то они находятся в заголовке и/или теле сообщения.
                     """),
            
            Question(question: [
                "HTTP статус коды этого класса сообщают клиенту, что для успешного выполнения операции необходимо сделать другой запрос, как правило, по другому URI"
            ],
                     image: "",
                     optionA: "3xx",
                     optionB: "2xx",
                     optionC: "5xx",
                     optionD: "",
                     questionId: 351972900,
                     helpText: """
                     3xx. Перенаправление. Коды этого класса сообщают клиенту, что для успешного выполнения операции необходимо сделать другой запрос, как правило, по другому URI.
                     
                     Из данного класса пять кодов 301, 302, 303, 305 и 307 относятся непосредственно к перенаправлениям. Адрес, по которому клиенту следует произвести запрос, сервер указывает в заголовке Location. При этом допускается использование фрагментов в целевом URI.
                     """),
            
            Question(question: [
                "HTTP статус коды этого класса предназначены для указания ошибок со стороны клиента"
            ],
                     image: "",
                     optionA: "4хх",
                     optionB: "5хх",
                     optionC: "2хх",
                     optionD: "",
                     questionId: 144779486,
                     helpText: """
                     4хх. Ошибка клиента. Класс кодов 4xx предназначен для указания ошибок со стороны клиента.
                     
                     При использовании всех методов, кроме HEAD, сервер должен вернуть в теле сообщения гипертекстовое пояснение для пользователя.
                     
                     Одно из часто встречающихся сообщений этого класса - 400 Bad Request — сервер обнаружил в запросе клиента синтаксическую ошибку.
                     """),
            
            Question(question: [
                "HTTP статус коды этого класса выделены под случаи необработанных исключений при выполнении операций на стороне сервера"
            ],
                     image: "",
                     optionA: "5хх",
                     optionB: "4хх",
                     optionC: "1хх",
                     optionD: "",
                     questionId: 776876050,
                     helpText: """
                     5хх. Ошибка сервера. Коды 5xx выделены под случаи необработанных исключений при выполнении операций на стороне сервера.
                     
                     Для всех ситуаций, кроме использования метода HEAD, сервер должен включать в тело сообщения объяснение, которое клиент отобразит пользователю.
                     
                     Одно из часто встречающихся сообщений этого класса - 500 Internal Server Error — любая внутренняя ошибка сервера, которая не входит в рамки остальных ошибок класса.
                     """),
            
            Question(question: [
                "Какие простые типы поддерживает формат JSON"
            ],
                     image: "",
                     optionA: """
                     Строка;
                     Число;
                     Логический тип;
                     null.
                     """,
                     optionB: """
                     Строка;
                     Число;
                     null.
                     """,
                     optionC: """
                     Логический тип;
                     null.
                     """,
                     optionD: "",
                     questionId: 669203162,
                     helpText: """
                     Строка; число; логический; null. JSON поддерживает следующие типы данных: Объекты { ... }; Массивы [ ... ], строки, числа, логические значения true / false, null.
                     """),
            
            Question(question: [
                "Поддерживает ли формат JSON массивы?",
                "Поддерживает ли формат JSON объекты (ключ: значение)?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 460308922,
                     helpText: """
                     Да. JSON поддерживает следующие типы данных: Объекты { ... }; Массивы [ ... ], строки, числа, логические значения true / false, null.
                     """),
        ]
    }
}
