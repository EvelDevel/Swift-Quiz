//
//  Interview.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 20.01.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import Foundation

final class InterviewJunior {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "Какими типами ссылок мы можем ссылаться на объект в Swift?"
            ],
                     image: "",
                     optionA: "Strong, weak, unowned",
                     optionB: "strong, unowned",
                     optionC: "direct, weak, strong",
                     optionD: "",
                     id: 678255779,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     Сильной или слабой. В основе механизма работы с памятью лежит система подсчёта ссылок на объекты (ARC).
                     На объект можно ссылаться сильной (strong) или слабой (weak) ссылкой.

                     Сильные ссылки держат объект и препятствуют его очистке из памяти. Как только количество сильных ссылок станет равным нулю - объект будет очищен из памяти.
                     
                     Таким образом разработчику не требуется управлять всем вручную, но важно корректно расставлять типы ссылок.
                     """
                    ),
            
            Question(question: [
                "С помощью чего происходит управление памятью в Swift?"
            ],
                     image: "",
                     optionA: "ARC",
                     optionB: "MRC",
                     optionC: "Вручную",
                     optionD: "",
                     id: 342790056,
                     links: [
                        "https://swiftbook.ru/content/languageguide/automatic-reference-counting/#:~:text=Swift%20%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D1%83%D0%B5%D1%82%20automatic%20reference%20counting,%D0%B4%D1%83%D0%BC%D0%B0%D1%82%D1%8C%20%D0%BE%20%D1%81%D0%B0%D0%BC%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D0%BC%20%D1%83%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B8%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D1%8C%D1%8E."
                     ],
                     helpText: """
                     ARC. Swift использует automatic reference counting (автоматический подсчет ссылок) для отслеживания и управления памятью вашего приложения.
                     
                     В большинстве случаев это означает, что управление памятью "просто работает" в Swift и вам не нужно думать о самостоятельном управлении.

                     ARC автоматически освобождает память, которая использовалась экземплярами класса, когда эти экземпляры больше нам не нужны (на экземпляр нет сильных ссылок).
                     """
                    ),
            
            Question(question: [
                "При каком количестве сильных ссылок в Swift, объект будет очищен из памяти?"
            ],
                     image: "",
                     optionA: "0",
                     optionB: "1",
                     optionC: "Не имеет значения",
                     optionD: "",
                     id: 537225677,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     0. Сильные ссылки держат объект и препятствуют его очистке из памяти. Как только количество сильных ссылок станет равным нулю - объект будет очищен из памяти.
                     
                     Таким образом разработчику не требуется управлять всем вручную, но важно корректно расставлять типы ссылок.

                     Для корректного подсчёта этих ссылок существуют ARC (Automatic Reference Counter) и MRC (Manual Reference Counter).
                     
                     Как можно понять из названия, один из них считает ссылки автоматически, другой - в ручную.
                     """
                    ),
            
            Question(question: [
                "Цель этого типа ссылок - хранить объект живым"
            ],
                     image: "",
                     optionA: "strong",
                     optionB: "weak",
                     optionC: "unowned",
                     optionD: "",
                     id: 419647432,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     strong. Цель сильной (strong) ссылки - сохранить объект в живых.

                     Сильные ссылки могут привести к нескольким нетривиальным проблемам:
                     - Retain cycles (о нем говорили выше)
                     - Не всегда возможно сделать сильные ссылки действительными сразу при создании объекта, например с делегатами.
                     """
                    ),

            Question(question: [
                "Если на объект указывает этот тип ссылки, он может быть обнулен"
            ],
                     image: "",
                     optionA: "weak",
                     optionB: "strong",
                     optionC: "",
                     optionD: "",
                     id: 803856401,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     weak. Объект может быть уничтожен, если на него указывают слабые ссылки.

                     Слабая ссылка возвращает nil, когда объект, на который она указывает, больше не жив. Это называется обнулением.
                     """
                    ),
            
            Question(question: [
                "Что из перечисленного относится к Reference Type?"
            ],
                     image: "",
                     optionA: "Class",
                     optionB: "Int",
                     optionC: "Enum",
                     optionD: "",
                     id: 974361124,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     Class. К ссылочным типам относятся: Классы, функции и замыкания (closures).
                     """
                    ),

            Question(question: [
                "Что из перечисленного относится к Value Type?"
            ],
                     image: "",
                     optionA: "Struct",
                     optionB: "Closure",
                     optionC: "Function",
                     optionD: "",
                     id: 620493116,
                     links: [
                        "https://habr.com/ru/post/592385/"
                     ],
                     helpText: """
                     Struct. К типам значения относятся базовые типы (Int, Double, String), структуры, перечисления (enum), массивы, словари и кортежи.
                     """
                    ),
            
            Question(question: [
                "Что такое Run Loop?"
            ],
                     image: "",
                     optionA: "Бесконечный цикл исполнения",
                     optionB: "Единовременная проверка",
                     optionC: "Итератор массивов",
                     optionD: "",
                     id: 274504854,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/company/otus/blog/590319/"
                     ],
                     helpText: """
                     Бесконечный цикл исполнения. Run Loop - Это бесконечный цикл, на котором происходит обработка всех внешних и внутренних событий:
                     - тап пальцем по экрану
                     - данные из сети
                     - таймеры
                     - или простое обновление UI
                     """
                    ),
            
            Question(question: [
                "Какое минимальное количество Run Loop может быть в приложении?"
            ],
                     image: "",
                     optionA: "Один",
                     optionB: "Два",
                     optionC: "По количеству потоков",
                     optionD: "",
                     id: 807039101,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/company/otus/blog/590319/"
                     ],
                     helpText: """
                     Один. У каждого потока может быть не болше одного Run Loop. Значит в приложении может быть минимум один Run Loop, а максимум столько, сколько потоков.
                     """
                    ),

            Question(question: [
                "Какое максимальное количество Run Loop мы можем добавить на поток?"
            ],
                     image: "",
                     optionA: "1",
                     optionB: "2",
                     optionC: "Неограниченное",
                     optionD: "",
                     id: 318965895,
                     links: [
                        "https://habr.com/ru/articles/572316/",
                        "https://habr.com/ru/company/otus/blog/590319/"
                     ],
                     helpText: """
                     1. У каждого потока может быть не болше одного Run Loop.
                     
                     Значит в приложении может быть минимум один Run Loop, а максимум столько, сколько потоков.
                     """
                    ),
            
            Question(question: [
                "Какой метод AppDelegate будет вызываться, когда приложение переходит из Active состояния в Inactive?"
            ],
                     image: "",
                     optionA: "applicationWillResignActive",
                     optionB: "applicationDidEnterBackground",
                     optionC: "applicationDidBecomeActive",
                     optionD: "",
                     id: 104580000,
                     links: [
                        "https://habr.com/ru/post/578752/",
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     applicationWillResignActive. Когда приложение собирается перейти из состояния Active в состояние Inactive - будет вызываться метод applicationWillResignActive.
                     
                     В этом метод можно сохранять текущий статус изменяемых данных.
                     """),
            
            Question(question: [
                "Этот метод позволяет вам выполнять код во время запуска приложения"
            ],
                     image: "",
                     optionA: "willFinishLaunchingWithOptions",
                     optionB: "didFinishLaunchingWithOptions",
                     optionC: "",
                     optionD: "",
                     id: 614223432,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     willFinishLaunchingWithOptions. Этот метод позволит исполнить код во время запуска приложения.
                     """
                    ),
            
            Question(question: [
                "Этот метод позволит вам выполнить код после успешного запуска приложения"
            ],
                     image: "",
                     optionA: "didFinishLaunchingWithOptions",
                     optionB: "willFinishLaunchingWithOptions",
                     optionC: "",
                     optionD: "",
                     id: 941269429,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     didFinishLaunchingWithOptions. Этот метод позволит исполнить код после успешного запуска приложения.
                     """
                    ),
            
            Question(question: [
                "Выберите корректное количество состояний вашего приложения в его жизненном цикле?"
            ],
                     image: "",
                     optionA: """
                     - Not Running;
                     - Inactive;
                     - Active;
                     - Background;
                     - Suspended.
                     """,
                     optionB: """
                     - Inactive;
                     - Active;
                     - Suspended;
                     - Background.
                     """,
                     optionC: "",
                     optionD: "",
                     id: 966969777,
                     links: [
                        "https://habr.com/ru/post/578752/",
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     Пять: Not Running, Inactive, Active, Background, Suspended.
                     
                     - «Не запущено» (Not Running state) - приложение не было запущено или остановлено системой. Неактивное состояние
                     
                     - Inactive state - приложение переходит в состояние переднего плана, но не получает и не обрабатывает события.
                     
                     - Активное состояние - Active state - приложение переходит в состояние переднего плана и может обрабатывать события.
                     
                     - Фоновое состояние - Background state - в этом состоянии, если есть исполняемый код, он будет выполняться, а если исполняемого кода нет или выполнение завершено, приложение будет немедленно приостановлено.
                     
                     - Приостановленное состояние - Suspended state - приложение находится в фоновом режиме (в памяти), но не выполняет код, и если в системе недостаточно памяти, она завершит работу вашего приложения.
                     """),
            
            Question(question: ["Какой метод AppDelegate будет вызываться, когда приложение переходит в фоновый режим (background)?"],
                     image: "",
                     optionA: "applicationDidEnterBackground",
                     optionB: "applicationWillEnterForeground",
                     optionC: "applicationDidBecomeActive",
                     optionD: "",
                     id: 493825556,
                     links: [
                        "https://habr.com/ru/post/578752/",
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     applicationDidEnterBackground. При переходе приложения в фоновый (background) режим будет вызываться метод applicationDidEnterBackground.
                     
                     Внутри этого метода мы можем сохранять текущую информацию о пользователе, или освобождать все используемые ресурсы, прекращать работу с базами данных.
                     """),
            
            Question(question: ["Выберите корректное название состояния: Приложение переходит в состояние переднего плана и может обрабатывать события"],
                     image: "",
                     optionA: "Active",
                     optionB: "Inactive",
                     optionC: "Not running",
                     optionD: "",
                     id: 551888796,
                     links: [
                        "https://habr.com/ru/post/578752/",
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: "Active. Активное состояние - Active state - приложение переходит в состояние переднего плана и может обрабатывать события."),
            
            Question(question: ["Какой метод SceneDelegate будет вызываться, когда приложение переходит из Active состояния в Inactive?"],
                     image: "",
                     optionA: "sceneWillResignActive",
                     optionB: "sceneWillEnterForeground",
                     optionC: "sceneDidEnterBackground",
                     optionD: "sceneDidBecomeActive",
                     id: 156634382,
                     links: [
                        "https://habr.com/ru/post/578752/",
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     sceneWillResignActive. Когда приложение собирается перейти из состояния Active в состояние Inactive - будет вызываться метод sceneWillResignActive у SceneDelegate.
                     
                     В этом метод можно сохранять текущий статус изменяемых данных. Этот метод вызывается во время непреднамеренных прерываний (пришла смс / входящий звонок).
                     """),
            
            Question(question: ["Какие состояния (state) приложения происходят на заднем плане, в фоновом режиме (background)?"],
                     image: "",
                     optionA: "Background, Suspended",
                     optionB: "Suspended, Active",
                     optionC: "Background, Inactive",
                     optionD: "",
                     id: 224991714,
                     links: [
                        "https://habr.com/ru/post/578752/",
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     Background, Suspended. На заднем плане (background) существует два состояния:
                     
                     Фоновое состояние - Background state - в этом состоянии, если есть исполняемый код, он будет выполняться, а если исполняемого кода нет или выполнение завершено, приложение будет немедленно приостановлено.
                     
                     Приостановленное состояние - Suspended state - приложение находится в фоновом режиме (в памяти), но не выполняет код, и если в системе недостаточно памяти, она завершит работу вашего приложения.
                     """),
            
            Question(question: ["Выберите корректное название состояния: Приложение находится в фоновом режиме (в памяти), но не выполняет код, и если в системе недостаточно памяти, она завершит работу вашего приложения"],
                     image: "",
                     optionA: "Suspended",
                     optionB: "Background",
                     optionC: "Not running",
                     optionD: "Inactive",
                     id: 917741590,
                     links: [
                        "https://habr.com/ru/post/578752/",
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: "Suspended. Приостановленное состояние - Suspended state - приложение находится в фоновом режиме (в памяти), но не выполняет код, и если в системе недостаточно памяти, она завершит работу вашего приложения."),
            
            Question(question: [
                "UIKit вызывает этот метод AppDelegate, чтобы ваше приложение знало, что оно перешло из неактивного состояния в активное"
            ],
                     image: "",
                     optionA: "applicationDidBecomeActive",
                     optionB: "applicationWillResignActive",
                     optionC: "applicationWillEnterForeground",
                     optionD: "",
                     id: 297092320,
                     links: [
                        "https://habr.com/ru/post/578752/",
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     applicationDidBecomeActive. UIKit вызывает этот метод (applicationDidBecomeActive), чтобы ваше приложение знало, что оно перешло из неактивного состояния в активное.
                     
                     Приложение переходит в активное состояние, потому что оно было запущено пользователем или системой.
                     
                     Или в случае, когда пользователь игнорирует системное прерывание (например: поступил входящий телефонный звонок или SMS-сообщение), в этот момент приложение временно переходит в неактивное состояние и быстро возвращается обратно (в случае, когда мы игнорируем звонок или смс), инициируя вызов метода applicationDidBecomeActive.
                     """),
            
            Question(question: [
                "Какой метод AppDelegate вызывается в момент, когда приложение переходит из состояния background в состояние foreground, но еще не становится активным (active)?"
            ],
                     image: "",
                     optionA: "applicationWillEnterForeground",
                     optionB: "applicationDidEnterBackground",
                     optionC: "applicationDidBecomeActive",
                     optionD: "",
                     id: 979698336,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle",
                        "https://habr.com/ru/post/578752/"
                     ],
                     helpText: """
                     applicationWillEnterForeground. Метод applicationWillEnterForeground у AppDelegate вызывается в момент перехода приложения из background в foreground (перед тем, как оно выйдет на передний план).
                     
                     В этот момент приложение еще не будет активным. Здесь удобно восстанавливать информацию, которую вы планируете показывать пользователю (отменить действие изменений, которые вы производили в момент, когда приложение переходило в фоновый режим).
                     """),
            
            Question(question: [
                "Этот метод AppDelegate сообщает вашему приложению, что оно будет завершено и полностью очищено из памяти"
            ],
                     image: "",
                     optionA: "applicationWillTerminate",
                     optionB: "applicationWillResignActive",
                     optionC: "applicationDidEnterBackground",
                     optionD: "",
                     id: 418701548,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle",
                        "https://habr.com/ru/post/578752/"
                     ],
                     helpText: """
                     applicationWillTerminate. Этот метод (applicationWillTerminate) сообщает вашему приложению, что оно будет завершено и полностью очищено из памяти.
                     
                     Вы должны использовать этот метод для выполнения любых задач окончательной очистки для вашего приложения, таких как освобождение общих ресурсов, сохранение пользовательских данных и аннулирование таймеров.
                     
                     В вашей реализации этого метода есть примерно пять секунд для выполнения любых задач и возврата. Если метод не вернется до истечения времени, система может в автоматическом режиме \"убить\" все незавершенные процессы без сохранения данных.
                     """),
            
            Question(question: ["Выберите первый этап жизненного цикла, перед которым у нас уже будут проинициализированы все свойства хранения и аутлеты внутри контроллера"],
                     image: "",
                     optionA: "Перед loadView()",
                     optionB: "Перед viewDidLoad()",
                     optionC: "Перед viewWillLayoutSubviews()",
                     optionD: "",
                     id: 171519758,
                     links: [
                        "https://habr.com/ru/post/654517/",
                        "https://medium.com/good-morning-swift/ios-view-controller-life-cycle-2a0f02e74ff5"
                     ],
                     helpText: "Перед loadView(). Все свойства и аутлеты устанавливаются перед loadView(), после awakeFromNib()."),
            
            Question(question: ["В каком методе мы можем инициализировать объекты и переменные, которые должны жить весь жизненный цикл вью?"],
                     image: "",
                     optionA: "viewDidLoad()",
                     optionB: "awakeFromNib()",
                     optionC: "viewWillTransition()",
                     optionD: "deinit()",
                     id: 650973627,
                     links: [
                        "https://habr.com/ru/post/654517/",
                        "https://medium.com/good-morning-swift/ios-view-controller-life-cycle-2a0f02e74ff5"
                     ],
                     helpText: "viewDidLoad(). В методе viewDidLoad() вы можете инициализировать переменные и объекты, которые должны жить на протяжении всего жизненного цикла вью."),
            
            Question(question: ["Какой из этих методов жизненного цикла отработает первым?"],
                     image: "",
                     optionA: "viewWillAppear",
                     optionB: "updateViewConstraints",
                     optionC: "viewWillLayoutSubviews",
                     optionD: "",
                     id: 675973931,
                     links: [
                        "https://habr.com/ru/post/654517/",
                        "https://medium.com/good-morning-swift/ios-view-controller-life-cycle-2a0f02e74ff5"
                     ],
                     helpText: "viewWillAppear. Самым первым среди указанных отработает viewWillAppear()."),
            
            Question(question: ["Если мы не используем Autolayout, в каком методе жизненного цикла мы можем скорректировать положение и размеры наших сабвью?"],
                     image: "",
                     optionA: "viewWillLayoutSubviews",
                     optionB: "viewDidLayoutSubviews",
                     optionC: "viewWillAppear",
                     optionD: "viewWillDisappear",
                     id: 617491990,
                     links: [
                        "https://habr.com/ru/post/654517/",
                        "https://medium.com/good-morning-swift/ios-view-controller-life-cycle-2a0f02e74ff5"
                     ],
                     helpText: """
                     viewWillLayoutSubviews. Если вы не используете autolayout, то подходящим местом для работы с вашими вью и сабвью будет метод viewWillLayoutSubviews, который, как раз, вызывается перед тем как происходит рассчет и расстановка всей иерархии вью на экране.
                     
                     Этот метод сообщает, что сейчас размеры вью будут изменены под размер экрана.
                     """),
            
            Question(question: [
                "Расстановка автолейаута происходит между методами viewDidLayoutSubviews и viewWillLayoutSubviews. Правда ли это?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 606229902,
                     links: [
                        "https://habr.com/ru/post/654517/",
                        "https://medium.com/good-morning-swift/ios-view-controller-life-cycle-2a0f02e74ff5"
                     ],
                     helpText: """
                     Да. Между методами viewDidLayoutSubviews и viewWillLayoutSubviews происходит расстановка автолейаута.
                     """
                    ),
            
            Question(question: [
                "На каком этапе жизненного цикла вы можете сохранить геометрически корректное положение scrollView (положение всех элементов view уже установлено)?",
                ],
                     image: "",
                     optionA: "viewDidLayoutSubviews()",
                     optionB: "viewWillLayoutSubviews()",
                     optionC: "viewDidLoad()",
                     optionD: "",
                     id: 324653727,
                     links: [
                        "https://habr.com/ru/post/654517/",
                        "https://medium.com/good-morning-swift/ios-view-controller-life-cycle-2a0f02e74ff5"
                     ],
                     helpText: """
                     viewDidLayoutSubviews(). При вызове этого метода мы уже можем быть уверены, что вью корректно выставило положение всех своих потомков.
                     
                     Именно здесь мы можем сохранять последнее состояние каких-то объектов, например: положение скролл вью, или положение ячейки в таблице.
                     """),
            
            Question(question: ["Какой из этих методов отработает последним при первой загрузке экрана?"],
                     image: "",
                     optionA: "viewDidAppear",
                     optionB: "viewDidDisappear",
                     optionC: "viewDidLayoutSubviews",
                     optionD: "",
                     id: 473148308,
                     links: [
                        "https://habr.com/ru/post/654517/",
                        "https://medium.com/good-morning-swift/ios-view-controller-life-cycle-2a0f02e74ff5"
                     ],
                     helpText: """
                     viewDidAppear. При загрузке экрана, последним мы увидим вызов метода viewDidAppear, когда наше вью уже загружено в память, и добавлено в иерархию.
                     
                     Дословно он говорит нам \"вью загружено и представлено на экране\"
                     """),
            
            Question(question: ["Какой метод отработает первым при закрытии экрана?"],
                     image: "",
                     optionA: "viewWillDisappear()",
                     optionB: "viewDidDisappear()",
                     optionC: "deinit()",
                     optionD: "",
                     id: 806955943,
                     links: [
                        "https://habr.com/ru/post/654517/",
                        "https://medium.com/good-morning-swift/ios-view-controller-life-cycle-2a0f02e74ff5"
                     ],
                     helpText: "viewWillDisappear(). При закрытии экрана первым будет вызван метод viewWillDisappear, который сообщает, что вью скоро будет удалено из иерархии и перестанет отображаться."),
            
            Question(question: ["Какой метод говорит нам о том, что вью было успешно удалено из иерархии и больше не отображается на экране?"],
                     image: "",
                     optionA: "viewDidDisappear",
                     optionB: "viewWillDisappear",
                     optionC: "viewWillTransition",
                     optionD: "",
                     id: 759608492,
                     links: [
                        "https://habr.com/ru/post/654517/",
                        "https://medium.com/good-morning-swift/ios-view-controller-life-cycle-2a0f02e74ff5"
                     ],
                     helpText: """
                     viewDidDisappear. Метод viewDidDisappear оповещает о том, что вью было успешно удалено из иерархии. Область применения похожа на viewWillDisappear (удаляются ненужные данные, ставится на паузу плеер).
                     
                     Разница с viewWillDisappear в том, что первый вызывается до анимации экрана, а второй - после. В этом методе так же необходимо обращаться к суперклассу super.viewDidDisappear.
                     """),
            
            Question(question: ["Этот метод отработает последним при закрытии экрана"],
                     image: "",
                     optionA: "deinit()",
                     optionB: "viewDidDisappear()",
                     optionC: "loadView()",
                     optionD: "viewWillDisappear()",
                     id: 744173788,
                     links: [
                        "https://habr.com/ru/post/654517/",
                        "https://medium.com/good-morning-swift/ios-view-controller-life-cycle-2a0f02e74ff5"
                     ],
                     helpText: """
                     deinit(). Последним всегда вызывается deinit(). Деинициализатор вызывается перед освобождением экземпляра класса.
                     
                     Вы пишите деинициализаторы с ключевого слова deinit, аналогично как вы пишите инициализаторы с ключевого слова init.
                     
                     Деинициализаторы доступны только для классовых типов.
                     """),
            
            Question(question: ["Какой из этих методов работает асинхронно?"],
                     image: "",
                     optionA: "setNeedsLayout()",
                     optionB: "layoutIfNeeded()",
                     optionC: "",
                     optionD: "",
                     id: 691444550,
                     links: [
                        "https://abhimuralidharan.medium.com/ios-swift-setneedslayout-vs-layoutifneeded-vs-layoutsubviews-5a2b486da31c"
                     ],
                     helpText: "setNeedsLayout(). Это асинхронный метод. Он завершается и немедленно возвращается (хотя мы и не видим его эффект сразу же)."),
            
            Question(question: ["С помощью чего мы можем разместить view в системе координат его superview?"],
                     image: "",
                     optionA: "frame",
                     optionB: "bounds",
                     optionC: "",
                     optionD: "",
                     id: 189660363,
                     links: [
                        "https://vmityuklyaev.medium.com/%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%B8%D0%B5-frame-%D0%B8-bounds-%D0%B2-ios-frame-vs-bounds-in-ios-4e5aee5ed477",
                        "https://www.hackingwithswift.com/example-code/uikit/whats-the-difference-between-frame-and-bounds"
                     ],
                     helpText: """
                     frame. Это расположение и размер view относительно системы координат родительского view (важно для размещения view в superview). Чтобы помочь разобраться с тем, что такое frame - воспринимайте его как рамку для картины на стене.
                     
                     Рамка похожа на границу нашего view. Вы можете повесить картину (в рамке) где угодно на стене (родительское вью). Точно таким же образом вы можете размещать ваши view в любом месте их родительских superview. Этот superview будет вашей стеной.
                     """),
            
            Question(question: ["С помощью чего мы можем разместить контент или subviews внутри нашей view?"],
                     image: "",
                     optionA: "bounds",
                     optionB: "frame",
                     optionC: "",
                     optionD: "",
                     id: 316697448,
                     links: [
                        "https://vmityuklyaev.medium.com/%D1%80%D0%B0%D0%B7%D0%BB%D0%B8%D1%87%D0%B8%D0%B5-frame-%D0%B8-bounds-%D0%B2-ios-frame-vs-bounds-in-ios-4e5aee5ed477",
                        "https://www.hackingwithswift.com/example-code/uikit/whats-the-difference-between-frame-and-bounds"
                     ],
                     helpText: """
                     bounds. Это расположение и размер view относительно своей системы координат (важно для размещения контента или subviews внутри себя). Чтобы понять bounds, подумайте о баскетбольной площадке, где иногда игра выходит за пределы площадки.
                     
                     Вы можете играть внутри определенных границ этой площадки, но вам все равно где она находится. Это может быть в тренажерном зале, или на улице в школе, или перед домом. Это не имеет значения.
                     
                     Точно также система координат view bounds, заботится только о самом view, она ничего не знает о расположении view на superview. Начало координат (точка (0, 0) по умолчанию) — это верхний левый угол view. Любые subviews располагаются в зависимости от этой точки.
                     """),
        ]
    }
}
