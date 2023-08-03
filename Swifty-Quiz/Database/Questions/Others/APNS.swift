//
//  APNS.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 19.09.2022.
//  Copyright © 2022 Evel-Devel. All rights reserved.
//

import Foundation

final class APNS {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "Для чего используется APNs?"
            ],
                     image: "",
                     optionA: "Отправка пуш уведомлений",
                     optionB: "Взаимодействие с сервером",
                     optionC: "Авторизация пользователя",
                     optionD: "",
                     id: 934896209,
                     links: [
                        "https://developer.apple.com/documentation/usernotifications/setting_up_a_remote_notification_server/sending_notification_requests_to_apns/",
                        "https://www.kodeco.com/11395893-push-notifications-tutorial-getting-started#toc-anchor-001"
                     ],
                     helpText: """
                     Отправка пуш уведомлений. APNs расшифровывается как Apple Push Notification service (APNs).
                     
                     Это сервис, который позволяет настроить отправку пуш уведомлений на девайсы клиентов по заданным параметрам (по событиям / по расписанию).
                     
                     Push notifications позволяют разработчикам доносить важную информацию до пользователей, даже если они активно не используют приложение.
                     """
                    ),
            
            Question(question: [
                "Может ли пуш уведомление быть получено пользователем, если он в текущий момент не использует приложение?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 573480430,
                     links: [
                        "https://www.kodeco.com/11395893-push-notifications-tutorial-getting-started#toc-anchor-001"
                     ],
                     helpText: """
                     Да. Пуш уведомления доставляются на девайс клиента независимо от того, пользуется ли он приложением в текущий момент или нет.
                     
                     Если пользователь при первом запуске разрешил отправку пушей на девайс - он будет получать их независимо от жизненного цикла приложения и его активности.
                     """
                    ),
            
            Question(question: [
                "Может ли пуш уведомление содержать в себе текстовое сообщение, которое будет показано пользователю?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 921693297,
                     links: [
                        "https://www.kodeco.com/11395893-push-notifications-tutorial-getting-started#toc-anchor-001"
                     ],
                     helpText: """
                     Да. Основная цель пуш уведомление - это отправка коротких текстовых (маркетинговых, или любых других) сообщений пользователям. Подавляющее большинство пушей содержат текстовую часть.
                     """
                    ),
            
            Question(question: [
                "Какой звук вы можете присвоить пуш уведомлению?"
            ],
                     image: "",
                     optionA: "Любой звук",
                     optionB: "Только default",
                     optionC: "Никакой",
                     optionD: "",
                     id: 352083663,
                     links: [
                        "https://www.kodeco.com/11395893-push-notifications-tutorial-getting-started#toc-anchor-001"
                     ],
                     helpText: """
                     Любой звук. Вы можете установить системный (дефолтный) звук уведомления, а также вы можете поставить свой кастомный звук.
                     
                     При этом необходимо, чтобы название звука (имя) пришло в пуш уведомлении (вместо "default"), чтобы этот звук находился внутри ассетов вашего приложения и был короче 30 секунд.
                     """
                    ),
            
            Question(question: [
                "Можете ли вы добавить в пуш уведомление действие, которое можно выполнить, не открывая при этом приложение?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 277679314,
                     links: [
                        "https://www.kodeco.com/11395893-push-notifications-tutorial-getting-started#toc-anchor-001"
                     ],
                     helpText: """
                     Да. Вы можете добавлять к пуш уведомлениям действия, которые можно выполнять не открывая приложение.
                     """
                    ),
            
            Question(question: [
                "Чтобы пуш уведомления заработали в вашем приложении, необходимо включить Push Notifications Capability в Xcode. Так ли это?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 338120737,
                     links: [
                        "https://www.kodeco.com/11395893-push-notifications-tutorial-getting-started#toc-anchor-001"
                     ],
                     helpText: """
                     Да. Для каждого приложения необходимо добавлять capability (Push Notifications), разрешая работу пуш уведомлений для текущего приложения.
                     """
                    ),
            
            Question(question: [
                "Выберите опции, которые чаще всего используются при получении разрешения на отправку пуш уведомлений?"
            ],
                     image: "",
                     optionA: "[.alert, .sound, .badge]",
                     optionB: "[.provisional, .badge, .carPlay]",
                     optionC: "[.carPlay, .sound, .criticalAlert]",
                     optionD: "",
                     id: 125519260,
                     links: [
                        "https://www.kodeco.com/11395893-push-notifications-tutorial-getting-started#toc-anchor-001"
                     ],
                     helpText: """
                     alert, sound, badge. Преимущественно используются именно эти три опции, при первичном запросе пользователю на разрешение пуш уведомлений.
                     
                     Они позволяют включить текстовые уведомления, обновление бейджика с количеством непрочитанных уведомлений (на иконке приложения), и добавлять звуки на входящие пуши.
                     """
                    ),
            
            Question(question: [
                "После первичного запуска приложения с пуш уведомлениями мы запрашиваем разрешение на их использование, и получаем... ?"
            ],
                     image: "",
                     optionA: "device token",
                     optionB: "permission",
                     optionC: "access",
                     optionD: "",
                     id: 938003172,
                     links: [
                        "https://www.kodeco.com/11395893-push-notifications-tutorial-getting-started#toc-anchor-001"
                     ],
                     helpText: """
                     device token. После выполнения запроса через UNUserNotificationCenter.current() requestAuthorization - мы получим токен девайса, который будет содержать в себе так называемый "адрес", по которому наше приложение будет идентифицировать девайс, и понимать, кому именно отправляется уведомление.
                     """
                    ),
            
            Question(question: [
                "Какая опция UNAuthorizationOptions отвечает за отображение количества непрочитанных пушей справа сверху, на иконке вашего приложения?"
            ],
                     image: "",
                     optionA: ".badge",
                     optionB: ".alert",
                     optionC: ".unread",
                     optionD: "",
                     id: 778630518,
                     links: [
                        "https://www.kodeco.com/11395893-push-notifications-tutorial-getting-started#toc-anchor-001"
                     ],
                     helpText: """
                     badge. Если при запросе разрешения на пуши вы отправите опцию .badge - в правом верхнем углу на иконке вашего приложения будет отображаться количество непрочитанных пушей.
                     
                     Но имейте ввиду - эту цифру надо нужным образом обрабатывать внутри приложения, иначе у вас всегда будет отображаться 1. Ее надо обнулять при нужном действии, а так же прибавлять к счетчику, если это требуется.
                     """
                    ),
            
            Question(question: [
                "Какая опция UNAuthorizationOptions отвечает за разрешение на воспроизведение звука при входящем пуш уведомлении?"
            ],
                     image: "",
                     optionA: ".sound",
                     optionB: ".carPlay",
                     optionC: "",
                     optionD: "",
                     id: 516948379,
                     links: [
                        "https://www.kodeco.com/11395893-push-notifications-tutorial-getting-started#toc-anchor-001"
                     ],
                     helpText: """
                     sound. Если при запросе разрешения на пуши вы отправите опцию .sound - вы сможете добавлять стандартный или любой другой кастомный звук для входящего пуш уведомления.
                     
                     Кастомные звуки должны храниться внутри приложения и быть короче 30 секунд.
                     """
                    ),
            
            Question(question: [
                "Какая опция UNAuthorizationOptions отвечает за визуальное отображение баннера с пуш уведомлением?"
            ],
                     image: "",
                     optionA: ".alert",
                     optionB: ".carPlay",
                     optionC: ".provisional",
                     optionD: ".providesAppNotificationSettings",
                     id: 127445280,
                     links: [
                        "https://www.kodeco.com/11395893-push-notifications-tutorial-getting-started#toc-anchor-001"
                     ],
                     helpText: """
                     alert. Опция .alert разрешает приложению показывать алерты (баннеры) при входящих пуш уведомлениях.
                     """
                    ),
            
            Question(question: [
                "Эта опция UNAuthorizationOptions, отправленная единственной при запросе, не станет запрашивать разрешение на пуш уведомления у пользователя."
            ],
                     image: "",
                     optionA: ".provisional",
                     optionB: ".badge",
                     optionC: ".providesAppNotificationSettings",
                     optionD: "",
                     id: 812414299,
                     links: [
                        "https://www.kodeco.com/11395893-push-notifications-tutorial-getting-started#toc-anchor-001"
                     ],
                     helpText: """
                     provisional. Если вы отправляете только опцию provisional при запросе на пуш уведомления, пользователь не получит нативный алерт на разрешение пушей, и ваши уведомления будут приходить в silent режиме (их обработка будет происходить внутри Notification Center).
                     """
                    ),
            
            Question(question: [
                "Эта опция UNAuthorizationOptions используется, если вы хотите оповестить систему, что имеете свой кастомный UI для настроек пуш уведомлений"
            ],
                     image: "",
                     optionA: ".providesAppNotificationSettings",
                     optionB: ".provisional",
                     optionC: ".badge",
                     optionD: "",
                     id: 199399719,
                     links: [
                        "https://www.kodeco.com/11395893-push-notifications-tutorial-getting-started#toc-anchor-001"
                     ],
                     helpText: """
                     providesAppNotificationSettings. Эта опция отправляется при запросе на пуш уведомления, если вы хотите оповестить систему, что имеете свой кастомный UI для настроек пуш уведомлений.
                     """
                    ),
            
            Question(question: [
                "Какая опция UNAuthorizationOptions позволит вам обходить все режимы \"не беспокоить\" у пользователя?"
            ],
                     image: "",
                     optionA: ".criticalAlert",
                     optionB: ".badge",
                     optionC: ".alert",
                     optionD: ".allow",
                     id: 913783591,
                     links: [
                        "https://www.kodeco.com/11395893-push-notifications-tutorial-getting-started#toc-anchor-001"
                     ],
                     helpText: """
                     criticalAlert. Эта опция позволит вам игнорировать mute режим в телефоне пользователя, а так же все варианты режимов "не Вам необходимо будет получать особо разрешение от Apple на использование этой опции (и предоставить обоснование), поскольку применять ее можно только в очень специфичных и важных случаях.
                     """
                    ),
            
            Question(question: [
                "Какая опция для пуш уведомлений показана на изображении?"
            ],
                     image: "APNS01",
                     optionA: ".alert",
                     optionB: ".sound",
                     optionC: ".badge",
                     optionD: "",
                     id: 428807004,
                     links: [
                        "https://betterprogramming.pub/the-complete-guide-for-configuring-ios-push-notifications-3161d0cddd46"
                     ],
                     helpText: """
                     alert. Данный тип уведомлений включается опцией .alert.
                     """
                    ),
            
            Question(question: [
                "Какая опция для пуш уведомлений показана на изображении?"
            ],
                     image: "APNS02",
                     optionA: ".sound",
                     optionB: ".alert",
                     optionC: ".badge",
                     optionD: "",
                     id: 113697328,
                     links: [
                        "https://betterprogramming.pub/the-complete-guide-for-configuring-ios-push-notifications-3161d0cddd46"
                     ],
                     helpText: """
                     sound. Данный тип уведомлений включается опцией .sound.
                     """
                    ),
            
            Question(question: [
                "Какая опция для пуш уведомлений показана на изображении?"
            ],
                     image: "APNS03",
                     optionA: ".badge",
                     optionB: ".alert",
                     optionC: ".sound",
                     optionD: "",
                     id: 748610940,
                     links: [
                        "https://betterprogramming.pub/the-complete-guide-for-configuring-ios-push-notifications-3161d0cddd46"
                     ],
                     helpText: """
                     badge. Данный тип уведомлений включается опцией .badge.
                     """
                    ),
        ]
    }
}
