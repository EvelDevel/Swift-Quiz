//
//  VCLifecycleSet.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 16.08.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation

class VCLifecycleSet {
    static func getQuestions() -> [Question] {
        return [
            
            // MARK: General
            
            Question(question: ["Что входит в список основных обязанностей UIViewController?",
                                "Одна из основных обязанностей вью контроллера заключается в этом"],
                     image: "",
                     optionA: "Обновление содержимого экрана",
                     optionB: "Создание вью модели",
                     optionC: "Парсинг данных из сети",
                     optionD: "Сбор аналитики данных",
                     questionId: 942977241,
                     helpText: "Основные обязанности вью контроллера включают следующее: Обновление содержимого экрана, обычно в ответ на изменения базовых данных. Реагирование на взаимодействие пользователя с экраном. Изменение размеров разных вью и управление общим видом всего интерфейса. Координация с другими объектами, включая другие контроллеры в вашем приложении."),
            
            Question(question: ["На каком из этих этапов мы увидим экран с загруженным вью?",
                                "На одном из этих этапов мы увидим полностью загруженный экран, на каком?"],
                     image: "Lifecycle01",
                     optionA: "Appeared",
                     optionB: "Dissapearing",
                     optionC: "Dissapeared",
                     optionD: "Appearing",
                     questionId: 615454268,
                     helpText: "Правильный ответ: Appeared. После вызова viewDidAppear: Этот метод вызывается после того, как вью отобразилось на экране. Обычно в нем сохраняют данные, запускают анимацию, начинают воспроизведение видео или звука или начинают получение данных по сетевым запросам."),
            
            Question(question: ["В каком методе жизненного цикла мы можем инициализировать объекты и переменные, которые должны жить весь жизненный цикл вью?"],
                     image: "",
                     optionA: "viewDidLoad()",
                     optionB: "awakeFromNib()",
                     optionC: "viewWillTransition()",
                     optionD: "deinit()",
                     questionId: 376396681,
                     helpText: "В методе viewDidLoad() вы можете инициализировать переменные и объекты, которые должны жить на протяжении всего жизненного цикла вью."),
            
            Question(question: ["После какого этапа жизненного цикла у нас инициализируются свойства хранения и аутлеты?"],
                     image: "",
                     optionA: "После awakeFromNib()",
                     optionB: "После loadView()",
                     optionC: "После viewDidLoad()",
                     optionD: "",
                     questionId: 567399116,
                     helpText: "Все свойства и аутлеты устанавливаются после awakeFromNib() и перед loadView()."),
            
            Question(question: ["К какому этапу жизненного цикла у нас проиниализированы все свойства хранения и аутлеты?"],
                     image: "",
                     optionA: "Перед loadView()",
                     optionB: "Перед viewDidLoad()",
                     optionC: "Перед viewWillLayoutSubviews()",
                     optionD: "",
                     questionId: 303360430,
                     helpText: "Все свойства и аутлеты устанавливаются перед loadView(), после awakeFromNib()."),
            
            
            // MARK: loadView()
            
            Question(question: ["Должны ли вы сами обращаться к методу loadView() при использовании Interface Builder для создания views?",
                                "Надо ли нам обращаться к методу loadView() на каком-либо этапе жизненного цикла экрана, если view создается через .xib или storyboard?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     questionId: 485945897,
                     helpText: "Согласно документации Apple, вам нежелательно обращаться к этому методу самостоятельно. View controller вызывает этот метод когда запрашивается его view property, но в данный момент оно пустое (nil). Он загружает или создает вью и присваивает его view property этого контроллера. Желательно не трогать loadView(), особенно если вью создается через .xib или storyboard (если вы используете Interface Builder для создания своих вьюх и инициализации вью контроллера, не оверрайдите (override) этот метод)."),
            
            Question(question: ["Какая основная задача у метода loadView()?",
                                "loadView() выполняет именно эту задачу"],
                     image: "",
                     optionA: "Создание view",
                     optionB: "Сохранение данных",
                     optionC: "Запуск анимации",
                     optionD: "Инициализация view controller",
                     questionId: 590412852,
                     helpText: "View controller вызывает этот метод когда запрашивается его view property, но в данный момент оно пустое (nil). Он загружает или создает вью и присваивает его view property для этого контроллера."),
            
            Question(question: ["Сколько раз за жизненный цикл экрана вызывается метод loadView()?",
                                "За жизненный цикл экрана метод loadView() вызывается такое количество раз"],
                     image: "",
                     optionA: "Один раз",
                     optionB: "Два раза",
                     optionC: "Три раза",
                     optionD: "Сколько потребуется",
                     questionId: 826127132,
                     helpText: "Как и viewDidLoad, метод loadView() вызывается лишь однажды в течение жизненного цикла вашего экрана (при запуске)."),
            
            Question(question: ["В каком случае нам стоит оверрайдить (override) метод loadView()?"],
                     image: "",
                     optionA: "Создаем views программно",
                     optionB: "Создаем views из storyboard",
                     optionC: "Создаем views из nib файла",
                     optionD: "",
                     questionId: 542498123,
                     helpText: "Вы можете оверрайдить (override) метод loadView() в случае, если создаете свои вью программно. Если вы решили так делать, проинициализируйте ваше рутовое вью (root view) во view property вашего контроллера. Ваша кастомная реализация этого метода не должна вызывать super."),
            
            Question(question: ["Должна ли кастомная версия метода loadView() вызывать внутри себя super.loadView()?"],
                     image: "",
                     optionA: "Нет, не должна",
                     optionB: "Да, должна",
                     optionC: "",
                     optionD: "",
                     questionId: 527779433,
                     helpText: "Вы можете оверрайдить (override) метод loadView() в случае, если создаете свои вью программно. Если вы решили так делать, проинициализируйте ваше рутовое вью (root view) во view property вашего контроллера. Ваша кастомная реализация этого метода не должна вызывать super."),
            
            
            // MARK: viewDidLoad()
            
            Question(question: ["Сколько раз за жизненный цикл экрана вызывается метод viewDidLoad()?",
                                "За жизненный цикл экрана метод viewDidLoad() вызывается такое количество раз"],
                     image: "",
                     optionA: "Один",
                     optionB: "Два",
                     optionC: "Сколько необходимо",
                     optionD: "",
                     questionId: 370524130,
                     helpText: "Метод viewDidLoad() вызывается только один раз за жизненный цикл экрана. Он вызывается когда все вью и сам контроллер уже загружены в память. В этом методе можно обращаться к локальным методам, к сетевым запросам, которые необходимо выполнить только один раз (например: исходные данные для экрана), выполнять обработку интерфейса для юзера, и делать другие подходящие задачи, которые необходимо выполнить один раз на старте вашего экрана."),
            
            Question(question: ["Имеем ли мы к моменту вызова viewDidLoad() все окончательные размеры экрана и его элементов?",
                                "Можем ли мы без последующих проблем работать с размерами экрана и элементов внутри viewDidLoad()?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     questionId: 773533335,
                     helpText: "Метод viewDidLoad() вызывается до того, как просчитываются все размеры на экране, и до того, как выполняется установка ориентации экрана, поэтому очень рискованно работать в нем с размерами ваших вью. На этом этапе границы вью не установлены, и мы не можем обращаться к значениям геометрии (высота, ширина, и прочие), точнее обратиться мы можем, но получим некорректные данные."),
            
            Question(question: ["Метод viewDidLoad() вызывается только после того, как вью контроллер загрузил все свои вью в память, так ли это?",
                                "viewDidLoad() вызывается независимо от того, были ли вью загружены из nib файла (.xib) или программно через loadView(). Так ли это?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 137416262,
                     helpText: "Метод viewDidLoad() вызывается после того, как вью контроллер загрузил иерархию всех своих вью в память. Этот метод вызывается независимо от того, были ли вью загружены из nib файла (.xib) или программно через loadView() метод."),
            
            Question(question: ["Можем ли мы обращаться к свойствам и аутлетам в методе viewDidLoad()?",
                                "Все свойства и аутлеты контроллера инициализированы к моменту viewDidLoad(). Так ли это?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 151998172,
                     helpText: "В методе viewDidLoad() мы выполняем большинство настроек для нашего вью контроллера, так как в этот момент все свойства и аутлеты уже инициализированы (значит к ним можно обращаться и менять их параметры). Все свойства инициализируются между awakeFromNib() и viewDidLoad()."),
            
            
            // MARK: viewWillAppear()
            
            Question(question: ["Метод viewWillAppear() вызывается каждый раз перед тем, как ___",
                                "Метод viewWillAppear() предшествует этому"],
                     image: "",
                     optionA: "вью станут видимыми",
                     optionB: "все вью загружены в память",
                     optionC: "ваш контроллер будет деинициализирован",
                     optionD: "",
                     questionId: 264890650,
                     helpText: "Этот метод вызывается каждый раз перед тем, как ваши вью станут видимыми, а так же до конфигурации анимации. На этом этапе наши вью уже имеют внешний размер, но ориентация экрана еще не установлена. Вы можете переписать (override) этот метод, чтобы реализовать свои задачи по тонкой настройке ваших вью и сабвью, которые нужно сделать без анимации (спрятать те или иные поля, или отключить какие-либо действия перед тем, как вью станет видимым)."),
            
            Question(question: ["Когда мы показываем другой контроллер модально (начиная с iOS 13.0), и возвращаемся обратно на предыдущий экран, отработает ли метод viewWillAppear() или viewDidAppear()?"],
                     image: "",
                     optionA: "Нет, оба метода не вызываются",
                     optionB: "Да, отработают",
                     optionC: "Только viewWillAppear()",
                     optionD: "Только viewDidAppear()",
                     questionId: 922512128,
                     helpText: "Вы можете переписать (override) viewWillAppear() метод, чтобы выполнить задачи, связанные с отображением вью. Например, вы можете использовать его для того, чтобы изменить ориентацию или стиль статус бара, или самого вью, которое должно появиться на экране. Если вы переписываете этот метод, в тот или иной момент вы должны будете вызвать super. Если вы показываете дочерний контроллер через модальное представление (as a sheet as default), по возвращению на родительский контроллер (сделали swipe down или dismiss) - этот метод вызываться не будет."),
            
            Question(question: ["Сколько раз за жизненный цикл будет вызываться метод viewWillAppear()?"],
                     image: "",
                     optionA: "Многократно по запросу",
                     optionB: "Один раз по запросу",
                     optionC: "Только два раза",
                     optionD: "",
                     questionId: 709411242,
                     helpText: "Метод viewWillAppear() вызывается перед тем, как графические элементы экрана будут добавлены в иерархию графических элементов. Но в отличии от viewDidLoad он вызывается не один раз, а каждый раз, когда экран добавляется в иерархию."),
            
            Question(question: ["Когда вы оверрайдите метод viewWillAppear(), вам необходимо вызывать super. Так ли это?",
                                "Методу viewWillAppear() необходим вызов super. Так ли это?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 589318428,
                     helpText: "Если вы переписываете метод viewWillAppear(), в тот или иной момент вы должны будете обратиться к суперклассу super.viewWillAppear(), так же как и у метода viewDidLoad и многих других."),
            
            
            // MARK: updateViewConstraints()
            
            Question(question: ["В какой момент мы должны обращаться к super.updateViewConstraints() в переопределяемой реализации updateViewConstraints()?"],
                     image: "",
                     optionA: "В конце",
                     optionB: "В начале",
                     optionC: "Без разницы",
                     optionD: "",
                     questionId: 758933900,
                     helpText: "Вызов данного метода происходит перед методом viewWillLayoutSubviews(), в конце переопределенного метода вы обязательно должны обращаться к суперклассу super.updateViewConstraints()."),
            
            Question(question: ["Какой из методов вызовется в первую очередь?"],
                     image: "",
                     optionA: "updateViewConstraints()",
                     optionB: "viewWillLayoutSubviews()",
                     optionC: "",
                     optionD: "",
                     questionId: 890793497,
                     helpText: "Вызов updateViewConstraints() происходит перед методом viewWillLayoutSubviews()."),
            
            
            // MARK: viewWillLayoutSubviews()
            
            Question(question: ["Выполняет ли дефолтная реализация метода viewWillLayoutSubviews() какие-либо действия с сабвью?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     questionId: 819333472,
                     helpText: "Каждый раз, когда размеры вью меняются (или мы меняем ориентацию экрана), viewWillLayoutSubviews() корректирует размеры и положение своих сабвью. Вы можете переписать этот метод, чтобы вносить изменения до того, как вью пересчитает и расположит сабвью. Дефолтная реализация не выполняет никаких действий."),
            
            Question(question: ["Будет ли вызван метод viewWillLayoutSubviews() после изменения ориентации экрана?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 642683692,
                     helpText: "Каждый раз, когда размеры вью меняются (или мы меняем ориентацию экрана), viewWillLayoutSubviews() корректирует размеры и положение своих сабвью. При изменении ориентации экрана этот метод будет вызываться сразу после viewWillTransition()."),
            
            Question(question: ["При вызове метода viewWillLayoutSubviews() мы уже имеем доступ к геометрическим данным загружаемого экрана?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 327853033,
                     helpText: "После вызова метода viewWillAppear устанавливаются границы вью, и геометрические данные становятся доступным к этапу viewWillLayoutSubviews. Между методами viewWillLayoutSubviews и viewDidLayoutSubviews происходит AutoLayout, оба этих метода направлены на то, чтобы проконтролировать, выполнились ли правильно расстановка всех вью и сабвью."),
            
            Question(question: ["Если мы не используем Autolayout, в каком методе жизненного цикла мы можем скорректировать положение и размеры наших сабвью?"],
                     image: "",
                     optionA: "viewWillLayoutSubviews",
                     optionB: "viewDidLayoutSubviews",
                     optionC: "viewWillAppear",
                     optionD: "viewWillDisappear",
                     questionId: 968252448,
                     helpText: "Если вы не используете autolayout, то подходящим местом для работы с вашими вью и сабвью будет метод viewWillLayoutSubviews, который, как раз, вызывается перед тем как происходит рассчет и расстановка всей иерархии вью на экране."),
            
            Question(question: ["Должны ли мы обращаться к super.viewWillLayoutSubviews внутри переопределяемой реализации viewWillLayoutSubviews()?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     questionId: 921715652,
                     helpText: "В данном методе (viewWillLayoutSubviews) обращение к своему суперклассу не требуется, поэтому писать super.viewWillLayoutSubviews() не нужно."),
             
            
            // MARK: viewDidLayoutSubviews()
            
            Question(question: ["Выполняет ли дефолтная, не переопределенная реализация метода viewDidLayoutSubviews() какие-либо действия с сабвью?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     questionId: 828879628,
                     helpText: "Дефолтная реализация viewDidLayoutSubviews() не выполняет никаких действий, поэтому обращаться к super.viewDidLayoutSubviews() не нужно."),
            
            Question(question: ["Должны ли мы обращаться к супер классу super.viewDidLayoutSubviews()?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да, в конце метода",
                     optionC: "Да, в начале метода",
                     optionD: "",
                     questionId: 192057514,
                     helpText: "Дефолтная реализация viewDidLayoutSubviews() не выполняет никаких действий, поэтому обращаться к super.viewDidLayoutSubviews() не нужно."),
            
            Question(question: ["На каком этапе жизненного цикла мы можем сохранить геометрически корректное положение скролл вью?",
                                "На каком этапе жизненного цикла мы можем сохранить геометрически корректное положение ячейки в таблице?"],
                     image: "",
                     optionA: "viewDidLayoutSubviews()",
                     optionB: "viewWillLayoutSubviews()",
                     optionC: "viewDidLoad()",
                     optionD: "",
                     questionId: 670969436,
                     helpText: "При вызове этого метода мы уже можем быть уверены, что вью корректно выставило положение всех своих потомков. Именно здесь мы можем сохранять последнее состояние каких-то объектов, например: положение скролл вью, или положение ячейки в таблице."),
            
            
            // MARK: viewDidAppear()
            
            Question(question: ["Что мы получаем к моменту вызова viedDidAppear()?"],
                     image: "",
                     optionA: "Вью появилось на экране",
                     optionB: "Вью только загружены в память",
                     optionC: "Вью имеют размер, но мы их не видим",
                     optionD: "",
                     questionId: 608391626,
                     helpText: "Метод viewDidAppear вызывается после того, как все графические элементы добавлены в иерархию view (добавлены и отображаются на экране). В данном методе вы можете произвести действия, которые должны быть выполнены уже после отображения элементов на экране (например, запустить анимацию или синхронизировать данные с сервером)."),
            
            Question(question: ["Будет ли вызываться viewDidAppear(), если мы возвращаемся на экран с дочернего контроллера, который мы показывали через модальное представление (.popover)?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     questionId: 344651116,
                     helpText: "Если вы показываете дочерний контроллер через модальное представление внутри popover (modalPresentationStyle = .popover), по возвращению на предыдущий контроллер (сделали swipe down или dismiss текущего экрана) - метод viewDidAppear() вызываться не будет."),
            
            Question(question: ["Во время переопределения метода viewDidAppear() должны ли мы обращаться к суперклассу super.viewDidAppear?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 136417931,
                     helpText: "При вызове viewDidAppear() в тот или иной момент (в начале переопределения, либо в конце) мы должны обращаться к суперклассу super.viewDidAppear()."),
            
            Question(question: ["Подходит ли метод viewDidAppear() для вызова becomeFirstResponder()?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 646110117,
                     helpText: "В методе viewDidAppear() можно размещать ресурсоемкие операции, например, связанные с получением данных. В нем можно вызвать becomeFirstResponder(), чтобы сразу начать ввод в нужное поле."),
            
            
            // MARK: viewWillTransition()
            // Выполняется при развороте экрана (смена ориентации)
            
            
            
            
            // MARK: viewWillDisappear()
            
            
            // MARK: viewDidDisappear()
            
            
            // MARK: deinit()
        ]
    }
}



/**
 В какой момент вызывается?
 Сколько раз вызывается за жизненный цикл?
*/

/**
 awakeFromNib
 property did set
 outlet did set
 loadView
 viewDidLoad
 viewWillAppear
 updateViewConstraints
 viewWillLayoutSubviews
 viewDidLayoutSubviews
 viewDidAppear
 ---
 viewWillTransition
 viewWillLayoutSubviews
 viewDidLayoutSubviews
 ---
 viewWillTransition
 viewWillLayoutSubviews
 viewDidLayoutSubviews
 viewWillDisappear
 ---
 viewDidDisappear
 deinitialize view controller
*/
