//
//  AppLifecycleSet.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 01.09.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation

final class AppLifecycleSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "Должны ли мы сохранить пользовательские данные на диск и закрыть все открытые файлы перед деактивацией приложения?",
                "Должны ли мы приостановить dispatch и operation queues перед деактивацией приложения?",
                "Должны ли мы аннулировать все активные таймеры перед деактивацией приложения?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 416919708,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     Да. Используйте деактивацию, чтобы сохранить данные пользователя и перевести приложение в \"тихое\" состояние, приостановив всю основную работу;
                     
                     Конкретно:
                     - Сохраните пользовательские данные на диск и закройте все открытые файлы.
                     - Приостановить dispatch и operation queues.
                     - Не планируйте выполнение новых задач.
                     - Аннулируйте все активные таймеры.
                     - Автоматическая приостановка игрового процесса.
                     - Не выполняйте никаких новых команд с OpenGL.
                     """),
            
            Question(question: [
                "Какой метод SceneDelegate будет вызываться, когда сцена переходит в фоновый режим, и освобождается системой?"
            ],
                     image: "",
                     optionA: "sceneDidDisconnect",
                     optionB: "sceneDidBecomeActive",
                     optionC: "sceneWillEnterForeground",
                     optionD: "",
                     id: 926366347,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     sceneDidDisconnect. Метод sceneDidDisconnect вызывается, когда сцена освобождается системой. Это происходит вскоре после того, как сцена переходит в фоновый режим (background) или когда ее сессия отменяется.
                     
                     Здесь мы освобождаем все ресурсы, связанные с этой сценой, которые можно будет воссоздать при ее следующей сессии.
                     
                     Сцена может повторно подключиться позже, поскольку ее сеанс не обязательно был отменен (см. Вместо этого `application: didDiscardSceneSessions`).
                     """),
            
            Question(question: [
                "Поддерживается ли объект UIWindowSceneDelegate и его методы в версиях iOS ниже 13?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 840329888,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: "Нет. В версиях iOS до 13, а также в приложениях, не поддерживающих сцены, UIKit доставляет все события жизненного цикла объекту UIApplicationDelegate."),
            
            Question(question: [
                "Этот метод AppDelegate сообщает вашему приложению, что оно будет завершено и полностью очищено из памяти"
            ],
                     image: "",
                     optionA: "applicationWillTerminate",
                     optionB: "applicationWillResignActive",
                     optionC: "applicationDidEnterBackground",
                     optionD: "",
                     id: 173825679,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     applicationWillTerminate. Этот метод (applicationWillTerminate) сообщает вашему приложению, что оно будет завершено и полностью очищено из памяти.
                     
                     Вы должны использовать этот метод для выполнения любых задач окончательной очистки для вашего приложения, таких как освобождение общих ресурсов, сохранение пользовательских данных и аннулирование таймеров.
                     
                     В вашей реализации этого метода есть примерно пять секунд для выполнения любых задач и возврата. Если метод не вернется до истечения времени, система может в автоматическом режиме \"убить\" все незавершенные процессы без сохранения данных.
                     """),
            
            Question(question: [
                "Какой метод AppDelegate будет вызываться, когда приложение переходит из Active состояния в Inactive?"
            ],
                     image: "",
                     optionA: "applicationWillResignActive",
                     optionB: "applicationDidEnterBackground",
                     optionC: "applicationDidBecomeActive",
                     optionD: "",
                     id: 636844612,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     applicationWillResignActive. Когда приложение собирается перейти из состояния Active в состояние Inactive - будет вызываться метод applicationWillResignActive. 
                     
                     В этом метод можно сохранять текущий статус изменяемых данных.
                     """),
            
            
            Question(question: [
                "Выберите вариант с корректным количеством основных состояний вашего приложения в жизненном цикле?"
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
                     id: 682116083,
                     links: [
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
            
            Question(question: [
                "На рисунке схема переходов между состояниями приложения c AppDelegate или SceneDelegate?"
            ],
                     image: "AppLifecycleSet02",
                     optionA: "AppDelegate",
                     optionB: "SceneDelegate",
                     optionC: "",
                     optionD: "",
                     id: 754530381,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     AppDelegate. На этом рисунке показаны переходы между состояниями приложения с участием объекта UIApplicationDelegate. После запуска система переводит приложение в неактивное (inactive) или фоновое (background) состояние, в зависимости от того, появится ли пользовательский интерфейс на экране.
                     
                     При запуске на передний план система автоматически переводит приложение в активное (active) состояние. После этого состояние будет меняться между активным и фоновым до завершения работы приложения.
                     """),
            
            Question(question: [
                "Какой метод AppDelegate будет вызываться, когда приложение переходит в фоновый режим (background)?"
            ],
                     image: "",
                     optionA: "applicationDidEnterBackground",
                     optionB: "applicationWillEnterForeground",
                     optionC: "applicationDidBecomeActive",
                     optionD: "",
                     id: 203840076,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     applicationDidEnterBackground. При переходе приложения в фоновый (background) режим будет вызываться метод applicationDidEnterBackground. 
                     
                     Внутри этого метода мы можем сохранять текущую информацию о пользователе, или освобождать все используемые ресурсы, прекращать работу с базами данных.
                     """),
            
            Question(question: [
                "Выберите корректное название состояния: Приложение переходит в состояние переднего плана и может обрабатывать события"
            ],
                     image: "",
                     optionA: "Active",
                     optionB: "Inactive",
                     optionC: "Not running",
                     optionD: "",
                     id: 651977696,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: "Active. Активное состояние - Active state - приложение переходит в состояние переднего плана и может обрабатывать события."),
            
            Question(question: [
                "Какой метод SceneDelegate будет вызываться, когда сцена перемещается из неактивного состояния в активное?"
            ],
                     image: "",
                     optionA: "sceneDidBecomeActive",
                     optionB: "sceneDidDisconnect",
                     optionC: "sceneWillResignActive",
                     optionD: "",
                     id: 339572396,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     sceneDidBecomeActive. Метод sceneDidBecomeActive вызывается, когда сцена перемещается из неактивного состояния в активное. 
                     
                     Используйте его для того, чтобы перезапустить все задачи, которые были на паузе в момент неактивности (inactive), или запустить новые задачи для активного состояния.
                     """),
            
            Question(question: [
                "Какие состояния (state) приложения происходят на переднем плане (foreground)?"
            ],
                     image: "",
                     optionA: "Inactive, Active",
                     optionB: "Active",
                     optionC: "Inactive, Suspended",
                     optionD: "",
                     id: 910884914,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     Inactive, Active. Есть два основных состояния, которые происходят на переднем плане:
                     
                     Неактивное состояние - Inactive state - приложение переходит в состояние переднего плана, но не получает и не обрабатывает события.
                     
                     Активное состояние - Active state - приложение переходит в состояние переднего плана и может обрабатывать события.
                     """),
            
            Question(question: [
                "UIKit вызывает этот метод AppDelegate, чтобы ваше приложение знало, что оно перешло из неактивного состояния в активное"
            ],
                     image: "",
                     optionA: "applicationDidBecomeActive",
                     optionB: "applicationWillResignActive",
                     optionC: "applicationWillEnterForeground",
                     optionD: "",
                     id: 456494498,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     applicationDidBecomeActive. UIKit вызывает этот метод (applicationDidBecomeActive), чтобы ваше приложение знало, что оно перешло из неактивного состояния в активное.
                     
                     Приложение переходит в активное состояние, потому что оно было запущено пользователем или системой.
                     
                     Или в случае, когда пользователь игнорирует системное прерывание (например: поступил входящий телефонный звонок или SMS-сообщение), в этот момент приложение временно переходит в неактивное состояние и быстро возвращается обратно (в случае, когда мы игнорируем звонок или смс), инициируя вызов метода applicationDidBecomeActive.
                     """),
            
            Question(question: [
                "Должны ли вы завершать доступ к камере или другим системным ресурсам во время перехода приложения в фоновый (background) режим?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 461249376,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     Да. Убедитесь, что ваше приложение не удерживает системные ресурсы при переходе в фоновый режим.
                     
                     Если приложение продолжает получать доступ к камере или базе данных, после перехода в фоновый режим система принудительно завершит работу всего приложения, чтобы освободить эти ресурсы.
                     
                     Если вы используете сторонний фреймворк для доступа к каким-то ресурсам, ознакомьтесь с документацией по этому фреймворку, чтобы узнать, что сделать во время перехода приложения в фон.
                     """),
            
            Question(question: [
                "Метод который можно использовать при загрузке данных из сети, при переходе приложения из фонового (background) режима к переднему плану (foreground) в версиях iOS >13?"
            ],
                     image: "",
                     optionA: "sceneWillEnterForeground(_:)",
                     optionB: "sceneDidEnterBackground(_:)",
                     optionC: "sceneWillResignActive(_:)",
                     optionD: "",
                     id: 144489361,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     sceneWillEnterForeground(_:). Во время старта приложения система запускает его в неактивном состоянии перед тем, как перевести его на передний план. Используйте методы этой фазы запуска для выполнения любой работы, необходимой в это время.
                     
                     Приложение, находящиеся в фоновом режиме, переводятся UIKit в неактивное (inactive) состояние, вызывая один из следующих методов:
                     - Для версий 13 и выше - метод sceneWillEnterForeground(_:) соответствующего объекта делегата сцены (у каждой сцены свой делегат).
                     - Для версий ниже 13 - метод applicationWillEnterForeground(_:). При переходе от фона к переднему плану используйте эти методы для загрузки ресурсов с диска и получения данных из сети.
                     """),
            
            Question(question: [
                "Какой метод SceneDelegate будет вызываться, когда приложение переходит из Active состояния в Inactive?"
            ],
                     image: "",
                     optionA: "sceneWillResignActive",
                     optionB: "sceneWillEnterForeground",
                     optionC: "sceneDidEnterBackground",
                     optionD: "",
                     id: 636844612,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     sceneWillResignActive. Когда приложение собирается перейти из состояния Active в состояние Inactive - будет вызываться метод sceneWillResignActive у SceneDelegate.
                     
                     В этом метод можно сохранять текущий статус изменяемых данных. Этот метод вызывается во время непреднамеренных прерываний (пришла смс / входящий звонок).
                     """),
            
            Question(question: [
                "Какие состояния (state) приложения происходят на заднем плане, в фоновом режиме (background)?"
            ],
                     image: "",
                     optionA: "Background, Suspended",
                     optionB: "Suspended, Active",
                     optionC: "Background, Inactive",
                     optionD: "",
                     id: 276654213,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     Background, Suspended. На заднем плане (background) существует два состояния:
                     
                     Фоновое состояние - Background state - в этом состоянии, если есть исполняемый код, он будет выполняться, а если исполняемого кода нет или выполнение завершено, приложение будет немедленно приостановлено.
                     
                     Приостановленное состояние - Suspended state - приложение находится в фоновом режиме (в памяти), но не выполняет код, и если в системе недостаточно памяти, она завершит работу вашего приложения.
                     """),
            
            Question(question: [
                "Выберите корректное название состояния: Приложение находится в фоновом режиме (в памяти), но не выполняет код, и если в системе недостаточно памяти, она завершит работу вашего приложения"
            ],
                     image: "",
                     optionA: "Suspended",
                     optionB: "Background",
                     optionC: "Not running",
                     optionD: "Inactive",
                     id: 310485773,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     Suspended. Приостановленное состояние - Suspended state - приложение находится в фоновом режиме (в памяти), но не выполняет код, и если в системе недостаточно памяти, она завершит работу вашего приложения.
                     """),
            
            Question(question: [
                "Какой метод SceneDelegate вызывается в момент, когда приложение переходит из состояния background в состояние foreground, но еще не становится активным (active)?"
            ],
                     image: "",
                     optionA: "sceneWillEnterForeground",
                     optionB: "sceneDidEnterBackground",
                     optionC: "sceneWillResignActive",
                     optionD: "",
                     id: 762235574,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     sceneWillEnterForeground. Метод sceneWillEnterForeground у SceneDelegate вызывается в момент перехода приложения из background в foreground (перед тем, как оно выйдет на передний план). В этот момент приложение еще не будет активным.
                     
                     Здесь удобно восстанавливать информацию, которую вы планируете показывать пользователю (отменить действие изменений, которые вы производили в момент, когда приложение переходило в фоновый режим).
                     """),
            
            Question(question: [
                "Поддерживает ли Swift создание нескольких сцен для одного приложения?",
                "Предоставляет ли Swift отдельные события жизненного цикла для каждой сцены, если их несколько в приложении?",
                "Может ли пользователь отображать и скрывать сцены своего приложения по отдельности?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 126590352,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     Да. Вы можете реагировать на события жизненного цикла на основе сцен. Если ваше приложение поддерживает сцены, UIKit предоставляет отдельные события жизненного цикла для каждой.
                     
                     Сцена представляет собой один экземпляр пользовательского интерфейса вашего приложения, работающий на устройстве. Пользователь может создавать несколько сцен для каждого приложения, а также отображать и скрывать их по отдельности.
                     
                     Поскольку у каждой сцены свой жизненный цикл, каждая может находиться в разном состоянии выполнения. Например, одна сцена может быть на переднем плане, а другие - на заднем плане или приостановлены.
                     """),
            
            Question(question: [
                "Выберите корректное название состояния: Если у приложения есть исполняемый код, он будет выполняться, а если исполняемого кода нет или выполнение завершено, приложение будет немедленно приостановлено"
            ],
                     image: "",
                     optionA: "Background",
                     optionB: "Suspended",
                     optionC: "Not running",
                     optionD: "",
                     id: 907149407,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     Background. Фоновое состояние - Background state - в этом состоянии, если есть исполняемый код, он будет выполняться, а если исполняемого кода нет или выполнение завершено, приложение будет немедленно приостановлено.
                     """),
            
            Question(question: [
                "Перед выходом приложения в background режим мы должны удалить любую конфиденциальную информацию о пользователе с экрана, потому что будет сделано это"
            ],
                     image: "",
                     optionA: "Снимок экрана",
                     optionB: "Форматирование данных",
                     optionC: "Сохранение в песочницу",
                     optionD: "Синхронизация с iCloud",
                     id: 210399725,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     Снимок экрана. После того, как ваше приложение переходит в фоновый режим, UIKit делает снимок текущего пользовательского интерфейса вашего приложения. Система отображает получившееся изображение в переключателе приложений (App switcher).
                     
                     В этот момент пользовательский интерфейс вашего приложения не должен содержать конфиденциальную информацию о пользователе, например пароли или номера кредитных карт. Если ваш интерфейс содержит такую информацию, удалите ее с ваших экранов при входе в фоновый режим.
                     
                     Также отключите предупреждения и временные интерфейсы, которые скрывают содержимое вашего приложения. Снимок представляет интерфейс вашего приложения и должен быть узнаваем для пользователей.
                     """),
            
            Question(question: [
                "На рисунке схема переходов между состояниями приложения с AppDelegate или SceneDelegate?"
            ],
                     image: "AppLifecycleSet01",
                     optionA: "SceneDelegate",
                     optionB: "AppDelegate",
                     optionC: "",
                     optionD: "",
                     id: 754530381,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     SceneDelegate. На этом рисунке отображены переходы состояний приложения для сцен (поддержка UIWindowSceneDelegate). Когда пользователь или система запрашивает новую сцену для вашего приложения, UIKit создает ее и переводит в неподключенное (unattached) состояние. Запрошенные пользователем сцены быстро перемещаются на передний план (foreground), где они появляются на экране.
                     
                     Запрошенные системой сцены обычно перемещаются на задний план (background), чтобы они могли обрабатывать необходимые события. Например, система может запустить сцену в фоновом (background) режиме для обработки геолокации. Когда пользователь закрывает интерфейс приложения, UIKit переводит текущую сцену в фоновое (background) состояние и, в конечном итоге, в приостановленное (suspended) состояние.
                     
                     UIKit может отключить фоновую или приостановленную сцену в любое время, чтобы восстановить свои ресурсы, вернув эту сцену в неподключенное (unattached) состояние.
                     """),
            
            Question(question: [
                "Какой метод AppDelegate вызывается в момент, когда приложение переходит из состояния background в состояние foreground, но еще не становится активным (active)?"
            ],
                     image: "",
                     optionA: "applicationWillEnterForeground",
                     optionB: "applicationDidEnterBackground",
                     optionC: "applicationDidBecomeActive",
                     optionD: "",
                     id: 244482666,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     applicationWillEnterForeground. Метод applicationWillEnterForeground у AppDelegate вызывается в момент перехода приложения из background в foreground (перед тем, как оно выйдет на передний план).
                     
                     В этот момент приложение еще не будет активным. Здесь удобно восстанавливать информацию, которую вы планируете показывать пользователю (отменить действие изменений, которые вы производили в момент, когда приложение переходило в фоновый режим).
                     """),
            
            Question(question: [
                "Этот метод будет вызываться, когда сцена переходит в фоновый режим"
            ],
                     image: "",
                     optionA: "sceneDidEnterBackground",
                     optionB: "sceneWillEnterForeground",
                     optionC: "sceneWillResignActive",
                     optionD: "",
                     id: 887827704,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     sceneDidEnterBackground. Когда сцена переходит с переднего плана на задний (из foreground в background) будет вызываться метод sceneDidEnterBackground.
                     
                     В этом методе мы можем сохранять нужную информацию, освобождать любые используемые объекты, и сохранять информацию о состоянии текущей сцены, которая нам может понадобиться для дальнейшей работы со сценой (когда мы вернемся на передний план).
                     """),
            
            Question(question: [
                "Может ли одна сцена приложения быть на переднем плане, а другие - на заднем, или приостановлены?",
                "Можете ли вы создать несколько сцена, и оставить одну на переднем плане, а другие - на заднем, или приостановить?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 743099879,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     Да. Пользователь может создавать несколько сцен для каждого приложения, а также отображать и скрывать их по отдельности.
                     
                     Поскольку у каждой сцены свой жизненный цикл, каждая может находиться в разном состоянии выполнения.
                     
                     Например, одна сцена может быть на переднем плане, а другие - на заднем плане или приостановлены.
                     """),
            
            Question(question: [
                "Является ли хорошей практикой, когда наше приложение в фоновом режиме выполняет ресурсоемкие операции?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "На наше усмотрение",
                     optionD: "",
                     id: 486517064,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     Нет. Когда ваше приложение работает в фоновом (background) режиме, оно должно выполнять как можно меньше задач, а желательно - ничего не выполнять.
                     
                     Если ваше приложение ранее было на переднем плане, используйте фоновый переход, чтобы остановить задачи и освободить все используемые ресурсы.
                     
                     Если ваше приложение переходит в фоновый режим для обработки важного события, обработайте событие и выйдите как можно быстрее.
                     """),
            
            Question(question: [
                "Какой метод AppDelegate мы можем использовать, чтобы завершить инициализацию нашего приложения и внести последние изменения?"
            ],
                     image: "",
                     optionA: "didFinishLaunchingWithOptions",
                     optionB: "configurationForConnecting:options",
                     optionC: "didDiscardSceneSessions",
                     optionD: "",
                     id: 143287185,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     didFinishLaunchingWithOptions. Используйте этот метод у AppDelegate, чтобы завершить инициализацию вашего приложения и внести любые последние изменения.
                     
                     Этот метод вызывается до того, как будут представлены окно вашего приложения или любой другой пользовательский интерфейс. Этот метод предоставляет последний шанс обработать любые ключи в словаре launchOptions.
                     """),
            
            Question(question: [
                "Какой из этих методов извлекает данные конфигурации, и предоставляет их UIKit при создании новой сцены?"
            ],
                     image: "",
                     optionA: "configurationForConnecting:options",
                     optionB: "didFinishLaunchingWithOptions",
                     optionC: "didDiscardSceneSessions",
                     optionD: "",
                     id: 719962590,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     configurationForConnecting:options. Этот метод извлекает данные конфигурации, и предоставляет их UIKit при создании новой сцены.
                     
                     Возвращаемое значение: объект конфигурации, содержащий информацию, необходимую для создания сцены. Реализуйте этот метод, если вы не включаете данные конфигурации сцены в файл Info.plist вашего приложения или если вы хотите динамически изменять данные конфигурации для создаваемых сцен. UIKit вызывает этот метод незадолго до создания новой сцены.
                     
                     В своей реализации верните объект UISceneConfiguration с деталями сцены, включая тип создаваемой сцены, объект делегата, который вы используете для управления сценой, и сториборд, содержащий начальный контроллер для отображения на экране. Если вы не реализуете этот метод, вы должны предоставить данные конфигурации сцены в файле Info.plist вашего приложения.
                     """),
            
            Question(question: [
                "Выберите корректное название состояния: Приложение переходит в состояние переднего плана, но не получает и не обрабатывает события"
            ],
                     image: "",
                     optionA: "Inactive",
                     optionB: "Active",
                     optionC: "Background",
                     optionD: "",
                     id: 618210111,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: "Inactive. Неактивное состояние - Inactive state - приложение переходит в состояние переднего плана, но не получает и не обрабатывает события."),
            
            Question(question: [
                "Выберите корректное название состояния: Приложение не было запущено или остановлено системой"
            ],
                     image: "",
                     optionA: "Not running",
                     optionB: "Suspended",
                     optionC: "Inactive",
                     optionD: "",
                     id: 724140113,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: "Not running. Состояние «Не запущено» - Not Running state - приложение не было запущено или остановлено системой."),
            
            Question(question: [
                "Обычно приложения не получают дополнительного времени на выполнение задач после перехода в фоновый режим. Есть ли из этого правила исключения?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 966160302,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     Да. Обычно приложения не получают дополнительного времени на выполнение задач после перехода в фоновый режим.
                     
                     Однако UIKit предоставляет его приложениям, которые поддерживают любую из следующих чувствительных ко времени возможностей: Аудиосвязь с использованием AirPlay или видео «Картинка в картинке».
                     
                     Услуги, зависящие от местоположения для пользователей. Связь с внешним аксессуаром. Поддержка службы Apple Push Notification (APN). Включите возможности фонового режима в Xcode, если ваше приложение должно поддерживать фоновые функции. У каждой подобной функции разные требования.
                     """),
            
            Question(question: [
                "Когда пользователь выходит из приложения, система деактивирует его. Это произойдет до или после перехода в фоновый режим?"
            ],
                     image: "",
                     optionA: "До перехода в фон",
                     optionB: "После перехода",
                     optionC: "Это опционально",
                     optionD: "",
                     id: 123901593,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     До перехода в фон. Система деактивирует (deactivate) приложения по нескольким причинам. Когда пользователь выходит из приложения, находяшегося на переднем плане (foreground), система немедленно деактивирует это приложение, прежде чем переместить его в фоновый (background) режим.
                     
                     Система также деактивирует приложения, когда ей необходимо временно их прервать, например, для отображения системных предупреждений. В случае появления системного предупреждения (system alert), система повторно активирует приложение, как только пользователь его закроет.
                     """),
            
            Question(question: [
                "Может ли ваше приложение выполнять какие-либо действия в фоновом (background) состоянии?",
                "Может ли система запускать приложение в фоновом режиме? или перемещать приостановленное приложение в фоновый режим",
                "Может ли система перемещать приостановленное приложение в фоновый режим, давая ему время для выполнения важных задач?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 993322551,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     Да. Приложения переходят в фоновое (background) состояние по многим причинам. Когда пользователь выходит из приложения, оно ненадолго переходит в фоновое состояние, прежде чем UIKit приостановит его.
                     
                     Система также может запускать приложение в фоновом режиме или перемещать приостановленное приложение в фоновый режим, давая ему время для выполнения важных задач.
                     """),
            
            Question(question: [
                "Для чего система делает снимок экрана (snapshot), перед тем как приложение уйдет в background режим?"
            ],
                     image: "",
                     optionA: "Показ снимка в app switcher",
                     optionB: "Отправка в Apple connect",
                     optionC: "Синхронизация с iCloud",
                     optionD: "",
                     id: 210399725,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     Показ снимка в app switcher. После того, как ваше приложение переходит в фоновый режим, UIKit делает снимок текущего пользовательского интерфейса вашего приложения.
                     
                     Система отображает получившееся изображение в переключателе приложений (App switcher). В этот момент пользовательский интерфейс вашего приложения не должен содержать конфиденциальную информацию о пользователе, например пароли или номера кредитных карт. Если ваш интерфейс содержит такую информацию, удалите ее с ваших экранов при входе в фоновый режим. Также отключите предупреждения и временные интерфейсы, которые скрывают содержимое вашего приложения.
                     
                     Снимок представляет интерфейс вашего приложения и должен быть узнаваем для пользователей. Когда ваше приложение возвращается на передний план (становится вновь активным), вы можете подходящим способом вернуть и обработать всю необходимую информацию и снова показать ее.
                     """),
            
            Question(question: [
                "Может ли UIKit отключить фоновую сцену, чтобы восстановить свои ресурсы?",
                "Может ли UIKit отключить приостановленную сцену, чтобы восстановить свои ресурсы?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 122596182,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: "Да. UIKit может отключить фоновую или приостановленную сцену в любое время, чтобы восстановить свои ресурсы, вернув эту сцену в неподключенное (unattached) состояние."),
            
            Question(question: [
                "Этот метод вашего приложения позволяет вам выполнять код во время запуска приложения"
            ],
                     image: "",
                     optionA: "willFinishLaunchingWithOptions",
                     optionB: "didFinishLaunchingWithOptions",
                     optionC: "",
                     optionD: "",
                     id: 943894001,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     willFinishLaunchingWithOptions. Этот метод позволит исполнить код во время запуска приложения.
                     """
                    ),
            
            Question(question: [
                "Этот метод вашего приложения позволит вам выполнить код после успешного запуска приложения"
            ],
                     image: "",
                     optionA: "didFinishLaunchingWithOptions",
                     optionB: "willFinishLaunchingWithOptions",
                     optionC: "",
                     optionD: "",
                     id: 901404500,
                     links: [
                        "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
                     ],
                     helpText: """
                     didFinishLaunchingWithOptions. Этот метод позволит исполнить код после успешного запуска приложения.
                     """
                    )
        ]
    }
}


// MARK: - Подумать над вопросами

/*
 Question(question: [
 "Какой объект делегата используется в iOS 13 и выше, для обработки событий жизненного цикла вашего приложения?",
 "В версиях iOS 13 и выше вы будете использовать именно этот объект делегата для обработки событий жизненного цикла"
 ],
 image: "",
 optionA: "UIWindowSceneDelegate",
 optionB: "UIApplicationDelegate",
 optionC: "UIWindow",
 optionD: "",
 id: 529552751,
 links: [
 "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
 ],
 helpText: """
 UIWindowSceneDelegate. Когда состояние вашего приложения меняется, UIKit уведомляет вас, вызывая соответствующие методы делегата: В iOS 13 и выше, используется объект UISceneDelegate для обработки событий жизненного цикла приложения, а в iOS 12 и ниже - используется объект UIApplicationDelegate для обработки этих же событий.
 """),
 
 Question(question: ["Какой метод вызывается при деактивации приложения с версий iOS 13.0 и выше?"],
 image: "",
 optionA: "sceneWillResignActive(_:)",
 optionB: "applicationWillResignActive(_:)",
 optionC: "",
 optionD: "",
 id: 920106021,
 links: [
 "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
 ],
 helpText: "sceneWillResignActive(_:). Во время деактивации UIKit вызывает один из следующих методов вашего приложения: Для приложений, поддерживающих сцены, - метод sceneWillResignActive(_:) соответствующего объекта делегата сцены. Для всех других приложений - метод applicationWillResignActive(_:) объекта делегата приложения."),
 
 Question(question: [
 "При переходе к какому состоянию вам необходимо завершить все важные задачи и освободить как можно больше памяти (при поддержке UIWindowSceneDelegate)?"
 ],
 image: "",
 optionA: "Background",
 optionB: "Feroground Active",
 optionC: "Unnatached",
 optionD: "",
 id: 444761302,
 links: [
 "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
 ],
 helpText: """
 Background. Используйте переходы между сценами для выполнения следующих задач: Перед тем как войти в фоновое (Background) состояние, завершите важные задачи и освободите как можно больше памяти.
 
 При отключении сцены очистите все общие ресурсы, связанные с ней. Помимо событий, связанных со сценой, вы также должны реагировать на запуск вашего приложения с помощью объекта UIApplicationDelegate.
 """),
 
 Question(question: ["Если вы в своем приложении поддерживаете оба типа делегата, UIApplicationDelegate и UIWindowSceneDelegate, к какому будет обращаться UIKit в версии iOS 14?"],
 image: "",
 optionA: "UIWindowSceneDelegate",
 optionB: "UIApplicationDelegate",
 optionC: "",
 optionD: "",
 id: 338828492,
 links: [
 "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
 ],
 helpText: "UIWindowSceneDelegate. Вы можете поддерживать оба типа объектов делегата в своем приложении, но UIKit всегда использует объекты делегата сцены, когда они доступны. UIKit будет уведомлять только делегата конкретной сцены, которая уходит в фоновый режим."),
 
 Question(question: [
 "Какому объекту делегата придет уведомление в версии 12.4 при переходе между состояниями приложения?"
 ],
 image: "",
 optionA: "UIApplicationDelegate",
 optionB: "UISceneDelegate",
 optionC: "Уведомления не отправляются",
 optionD: "",
 id: 501012234,
 links: [
 "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
 ],
 helpText: """
 UIApplicationDelegate. Все переходы между состояниями приводят к отправке UIKit уведомлений соответствующему объекту делегата: В iOS 13 и новее - объект UISceneDelegate. В iOS 12 и ранее - объект UIApplicationDelegate.
 
 Вы можете поддерживать оба типа объектов делегата, но UIKit всегда использует объекты делегата сцены, когда они доступны. UIKit будет уведомлять только делегата конкретной сцены, которая уходит в фоновый режим.
 """),
 
 Question(question: [
 "При переходе к этому состоянию логичнее всего настраивать пользовательский интерфейс и производить подготовку к взаимодействию с юзером (при поддержке UIWindowSceneDelegate)"
 ],
 image: "",
 optionA: "Feroground Active",
 optionB: "Feroground Inactive",
 optionC: "Background",
 optionD: "Unnatached",
 id: 414662380,
 links: [
 "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
 ],
 helpText: """
 Feroground Active. Используйте переходы между сценами для выполнения следующих задач: Когда UIKit подключает сцену к вашему приложению, настройте начальный пользовательский интерфейс вашей сцены и загрузите данные, которые нужны для нее.
 
 При переходе в активное состояние (Feroground Active state) настройте пользовательский интерфейс и подготовьтесь к взаимодействию с пользователем. Выйдя из активного состояния сохраните данные и максимально приглушите любые фоновые задачи вашего приложения.
 """),
 
 Question(question: ["Какой метод будет вызван, при деактивации приложения с версий iOS 12.0?"],
 image: "",
 optionA: "applicationWillResignActive(_:)",
 optionB: "sceneWillResignActive(_:)",
 optionC: "",
 optionD: "",
 id: 599075515,
 links: [
 "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
 ],
 helpText: "applicationWillResignActive(_:). Во время деактивации UIKit вызывает один из следующих методов вашего приложения: Для приложений, поддерживающих сцены, - метод sceneWillResignActive(_:) соответствующего объекта делегата сцены. Для всех других приложений - метод applicationWillResignActive(_:) объекта делегата приложения."),
 
 Question(question: [
 "Какой объект делегата используется в iOS 12 и ниже, для обработки событий жизненного цикла вашего приложения?",
 "В версиях iOS 12 и ниже вы будете использовать именно этот объект делегата для обработки событий жизненного цикла"
 ],
 image: "",
 optionA: "UIApplicationDelegate",
 optionB: "UIWindowSceneDelegate",
 optionC: "UIResponder",
 optionD: "",
 id: 415181042,
 links: [
 "https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle"
 ],
 helpText: "UIApplicationDelegate. Когда состояние вашего приложения меняется, UIKit уведомляет вас, вызывая соответствующие методы делегата: В iOS 13 и выше, используется объект UISceneDelegate для обработки событий жизненного цикла приложения, а в iOS 12 и ниже - используется объект UIApplicationDelegate для обработки этих же событий."),
 
 
 */
