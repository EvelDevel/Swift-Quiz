//
//  VCLifecycleSet.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 16.08.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation

final class VCLifecycleSet {
    static func getQuestions() -> [Question] {
        return [
            Question(question: ["Что входит в список основных обязанностей UIViewController?",
                                "Одна из основных обязанностей вью контроллера заключается в этом"],
                     image: "",
                     optionA: "Обновление содержимого экрана",
                     optionB: "Создание вью модели",
                     optionC: "Парсинг данных из сети",
                     optionD: "Сбор аналитики данных",
                     id: 942977241,
                     helpText: """
                     Обновление содержимого экрана. Основные обязанности вью контроллера включают следующее:
                     
                     - Обновление содержимого экрана, обычно в ответ на изменения базовых данных.
                     - Реагирование на взаимодействие пользователя с экраном.
                     - Изменение размеров разных вью и управление общим видом всего интерфейса.
                     - Координация с другими объектами, включая другие контроллеры в вашем приложении.
                     """),
            
            Question(question: ["Если ваш класс не является наследником UIViewController, будут ли вам доступны методы жизненного цикла вью контроллера?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 239137693,
                     helpText: "Нет. Чтобы получить доступ ко всем стандартным методам вью контроллера, необходимо, чтобы ваш класс наследовался от UIViewController, и в некоторых переопределенных методах обращался к суперклассу super."),
            
            Question(question: ["В каком из этих методов мы не обращаемся к суперклассу?"],
                     image: "",
                     optionA: "viewWillLayoutSubviews",
                     optionB: "viewDidLoad",
                     optionC: "viewDidAppear",
                     optionD: "",
                     id: 919443416,
                     helpText: "viewWillLayoutSubviews. Во всех случаях, кроме viewWillLayoutSubviews и viewDidLayoutSubviews мы должны будем обращаться к суперклассу наших методов через .super"),
            
            Question(question: ["Какой из этих методов жизненного цикла отработает первым?"],
                     image: "",
                     optionA: "viewDidLoad",
                     optionB: "viewWillAppear",
                     optionC: "updateViewConstraints",
                     optionD: "",
                     id: 142565571,
                     helpText: "viewDidLoad. Самым первым среди указанных отработает viewDidLoad()."),
            
            Question(question: ["Имеет ли deinit() доступ к свойствам экземпляра перед его освобождением?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 658675427,
                     helpText: "Да. Так как экземпляр не освобождается до тех пор пока не будет вызван деинициализатор, то деинициалиатор может получить доступ ко всем свойствам экземпляра, который он вызывает, и может изменить свое поведение, основываясь на этих свойствах."),
            
            Question(question: ["На каком из этих этапов мы увидим экран с загруженным вью?",
                                "На одном из этих этапов мы увидим полностью загруженный экран, на каком?"],
                     image: "Lifecycle01",
                     optionA: "Appeared",
                     optionB: "Appearing",
                     optionC: "Disappeared",
                     optionD: "",
                     id: 615454268,
                     helpText: "Appeared. После вызова viewDidAppear: Этот метод вызывается после того, как вью отобразилось на экране. Обычно в нем сохраняют данные, запускают анимацию, начинают воспроизведение видео или звука или начинают получение данных по сетевым запросам."),
            
            Question(question: ["Будет ли вызываться viewDidAppear(), если мы возвращаемся на экран с дочернего контроллера, который показывали через модальное представление (.popover, .pageSheet)?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 344651116,
                     helpText: "Нет. Если вы показываете дочерний контроллер через модальное представление внутри popover или page sheet (modalPresentationStyle = .popover / .pageSheet), по возвращению на предыдущий контроллер (сделали swipe down или dismiss текущего экрана) - метод viewDidAppear() вызываться не будет."),
            
            Question(question: ["В каком методе мы можем инициализировать объекты и переменные, которые должны жить весь жизненный цикл вью?"],
                     image: "",
                     optionA: "viewDidLoad()",
                     optionB: "awakeFromNib()",
                     optionC: "viewWillTransition()",
                     optionD: "deinit()",
                     id: 376396681,
                     helpText: "viewDidLoad(). В методе viewDidLoad() вы можете инициализировать переменные и объекты, которые должны жить на протяжении всего жизненного цикла вью."),
            
            Question(question: ["Этот метод отработает последним при закрытии экрана"],
                     image: "",
                     optionA: "deinit()",
                     optionB: "viewDidDisappear()",
                     optionC: "loadView()",
                     optionD: "viewWillDisappear()",
                     id: 856520368,
                     helpText: "deinit(). Последним всегда вызывается deinit(). Деинициализатор вызывается перед освобождением экземпляра класса. Вы пишите деинициализаторы с ключевого слова deinit, аналогично как вы пишите инициализаторы с ключевого слова init. Деинициализаторы доступны только для классовых типов."),
            
            Question(question: ["В каком из этих методов мы не обращаемся к суперклассу?"],
                     image: "",
                     optionA: "viewDidLayoutSubviews",
                     optionB: "viewDidLoad",
                     optionC: "viewDidAppear",
                     optionD: "viewWillAppear",
                     id: 178466617,
                     helpText: "viewDidLayoutSubviews. Во всех основных методах, кроме viewWillLayoutSubviews и viewDidLayoutSubviews мы должны будем обращаться к суперклассу наших методов через .super"),
            
            Question(question: ["Мы ушли с контроллера, который отображался в fullScreen, отработает ли метод viewDidAppear()?",
                                "Мы ушли с контроллера, который отображался в fullScreen, отработает ли метод viewWillAppear()?",
                                "Мы ушли с контроллера, который отображался в fullScreen, отработает ли метод viewWillLayoutSubviews()?",
                                "Мы ушли с контроллера, который отображался в fullScreen, отработает ли метод viewDidLayoutSubviews()?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 955936630,
                     helpText: "Да. Если мы возвращаемся на наш контроллер после закрытия дочернего, который показывался на полном экране, (modalPresentationStyle = .fullScreen или .overFullScreen), метод viewDidAppear() будет вызван, так же как viewWillAppear(), viewWillLayoutSubviews() и viewDidLayoutSubviews()."),
            
            Question(question: ["После какого метода у нас начнут устанавливаться свойства и аутлеты нашего контроллера?"],
                     image: "",
                     optionA: "После awakeFromNib()",
                     optionB: "После loadView()",
                     optionC: "После viewDidLoad()",
                     optionD: "",
                     id: 567399116,
                     helpText: "После awakeFromNib(). Все свойства и аутлеты устанавливаются после awakeFromNib() и перед loadView()."),
            
            Question(question: ["Требует ли viewDidDisappear обязательного обращения к суперклассу при переопределении?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 239282554,
                     helpText: """
                     Да. Метод viewDidDisappear оповещает о том, что вью было успешно удалено из иерархии. Область применения похожа на viewWillDisappear (удаляются ненужные данные, ставится на паузу плеер).
                     
                     Разница с viewWillDisappear в том, что первый вызывается до анимации экрана, а второй - после. В этом методе так же необходимо обращаться к суперклассу super.viewDidDisappear.
                     """),
            
            Question(question: ["Какой из этих методов жизненного цикла отработает первым?"],
                     image: "",
                     optionA: "viewWillAppear",
                     optionB: "updateViewConstraints",
                     optionC: "viewWillLayoutSubviews",
                     optionD: "",
                     id: 977224853,
                     helpText: "viewWillAppear. Самым первым среди указанных отработает viewWillAppear()."),
            
            Question(question: ["Какой метод не входит в жизненный цикл вью контроллера, но фактически вызывается после инициализации контроллера через storyboard?"],
                     image: "",
                     optionA: "awakeFromNib()",
                     optionB: "loadView()",
                     optionC: "updateViewConstraints()",
                     optionD: "",
                     id: 405126932,
                     helpText: "awakeFromNib(). awakeFromNib не является частью ViewController Lifecycle, ну нужно понимать что он вызывается сразу после инициализации, перед подготовкой перехода у контроллера, который задан с помощью storyboard."),
            
            Question(question: ["Какой метод отработает первым при закрытии экрана?"],
                     image: "",
                     optionA: "viewWillDisappear()",
                     optionB: "viewDidDisappear()",
                     optionC: "deinit()",
                     optionD: "",
                     id: 212615901,
                     helpText: "viewWillDisappear(). При закрытии экрана первым будет вызван метод viewWillDisappear, который сообщает, что вью скоро будет удалено из иерархии и перестанет отображаться. "),
            
            Question(question: ["Что мы получаем к моменту вызова viewDidAppear()?"],
                     image: "",
                     optionA: "Вью появилось на экране",
                     optionB: "Вью только загружены в память",
                     optionC: "Вью имеют размер, но мы их не видим",
                     optionD: "",
                     id: 608391626,
                     helpText: """
                     Вью появилось на экране. Метод viewDidAppear вызывается после того, как все графические элементы добавлены в иерархию view (добавлены и отображаются на экране).
                     
                     В данном методе вы можете произвести действия, которые должны быть выполнены уже после отображения элементов на экране (например, запустить анимацию или синхронизировать данные с сервером).
                     """),
            
            Question(question: ["Должны ли мы переопределить метод loadView() при использовании Interface Builder?",
                                "Надо ли нам переопределять метод loadView() если view создается через .xib или storyboard?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 485945897,
                     helpText: """
                     Нет. Согласно документации Apple, вам нежелательно обращаться к этому методу самостоятельно. View controller вызывает этот метод когда запрашивается его view property, но в данный момент оно пустое (nil).
                     
                     Он загружает или создает вью и присваивает его view property (для этого контроллера). Желательно не трогать loadView(), особенно если вью создается через .xib или storyboard (если вы используете Interface Builder, не переопределяйте этот метод).
                     """),
            
            Question(question: [
                "На каком этапе жизненного цикла вы можете сохранить геометрически корректное положение scrollView (положение всех элементов view уже установлено)?",
                ],
                     image: "",
                     optionA: "viewDidLayoutSubviews()",
                     optionB: "viewWillLayoutSubviews()",
                     optionC: "viewDidLoad()",
                     optionD: "",
                     id: 670969436,
                     helpText: "viewDidLayoutSubviews(). При вызове этого метода мы уже можем быть уверены, что вью корректно выставило положение всех своих потомков. Именно здесь мы можем сохранять последнее состояние каких-то объектов, например: положение скролл вью, или положение ячейки в таблице."),
            
            Question(question: ["Какой метод говорит нам о том, что вью было успешно удалено из иерархии и больше не отображается на экране?"],
                     image: "",
                     optionA: "viewDidDisappear",
                     optionB: "viewWillDisappear",
                     optionC: "viewWillTransition",
                     optionD: "",
                     id: 248289859,
                     helpText: """
                     viewDidDisappear. Метод viewDidDisappear оповещает о том, что вью было успешно удалено из иерархии. Область применения похожа на viewWillDisappear (удаляются ненужные данные, ставится на паузу плеер).
                     
                     Разница с viewWillDisappear в том, что первый вызывается до анимации экрана, а второй - после. В этом методе так же необходимо обращаться к суперклассу super.viewDidDisappear.
                     """),
            
            Question(question: ["Какая основная задача у метода loadView()?",
                                "loadView() выполняет именно эту задачу"],
                     image: "",
                     optionA: "Создание view",
                     optionB: "Сохранение данных",
                     optionC: "Запуск анимации",
                     optionD: "",
                     id: 590412852,
                     helpText: "Создание view. View controller вызывает этот метод когда запрашивается его view property, но в данный момент оно пустое (nil). Он загружает или создает вью и присваивает его view property для этого контроллера."),
            
            Question(question: ["Во время переопределения метода viewDidAppear() должны ли мы обращаться к суперклассу super.viewDidAppear?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 136417931,
                     helpText: "Да. При вызове viewDidAppear() в тот или иной момент (в начале переопределения, либо в конце) мы должны обращаться к суперклассу super.viewDidAppear()."),
            
            Question(question: ["Сколько раз за жизненный цикл экрана вызывается метод loadView()?",
                                "За жизненный цикл экрана метод loadView() вызывается такое количество раз"],
                     image: "",
                     optionA: "Один раз",
                     optionB: "Два раза",
                     optionC: "Три раза",
                     optionD: "Сколько потребуется",
                     id: 826127132,
                     helpText: "Один раз. Как и viewDidLoad, метод loadView() вызывается лишь однажды в течение жизненного цикла вашего экрана (при запуске)."),
            
            Question(question: ["Требует ли viewWillDisappear обязательного обращения к суперклассу при переопределении?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 184565849,
                     helpText: "Да. viewWillDisappear() требует обязательного обращения к суперклассу super.viewWillDisappear()."),
            
            Question(question: ["Должны ли мы обращаться к суперклассу super.viewDidLayoutSubviews()?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да, в конце метода",
                     optionC: "Да, в начале метода",
                     optionD: "",
                     id: 192057514,
                     helpText: "Нет. Дефолтная реализация viewDidLayoutSubviews() не выполняет никаких действий, поэтому обращаться к super.viewDidLayoutSubviews() не нужно."),
            
            Question(question: ["В каком случае нам стоит переопределить (override) метод loadView()?"],
                     image: "",
                     optionA: "Создаем view программно",
                     optionB: "Создаем view из storyboard",
                     optionC: "Создаем view из nib файла",
                     optionD: "",
                     id: 542498123,
                     helpText: "Создаем view программно. Вы можете оверрайдить (override) метод loadView() в случае, если создаете свои вью программно. Если вы решили так делать, проинициализируйте ваше рутовое вью (root view) во view property вашего контроллера. Ваша кастомная реализация этого метода не должна вызывать super."),
            
            Question(question: ["Какой метод отработает при смене ориентации экрана, помимо viewWillLayoutSubviews?"],
                     image: "",
                     optionA: "viewWillTransition",
                     optionB: "updateViewConstraints",
                     optionC: "viewDidDisappear",
                     optionD: "",
                     id: 918290194,
                     helpText: "viewWillTransition. При смене ориентации экрана первым отрабатываем метод viewWillTransition, следом за ним отрабатывают оба метода, ответственные за корректировку визуальных элементов экрана, viewWillLayoutSubviews и viewDidLayoutSubviews."),
            
            Question(question: ["Выполняет ли дефолтная, не переопределенная реализация метода viewDidLayoutSubviews() какие-либо действия с сабвью?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 828879628,
                     helpText: "Нет. Дефолтная реализация viewDidLayoutSubviews() не выполняет никаких действий, поэтому обращаться к super.viewDidLayoutSubviews() не нужно."),
            
            Question(question: ["Должна ли кастомная версия метода loadView() вызывать внутри себя super.loadView()?"],
                     image: "",
                     optionA: "Нет, не должна",
                     optionB: "Да, должна",
                     optionC: "",
                     optionD: "",
                     id: 527779433,
                     helpText: """
                     Нет, не должна. Вы можете оверрайдить (override) метод loadView() в случае, если создаете свои вью программно.
                     
                     Если вы решили так делать, проинициализируйте ваше рутовое вью (root view) во view property вашего контроллера. Ваша переопределенная реализация этого метода не должна вызывать суперкласс super.loadView().
                     """),
            
            Question(question: ["Выберите первый этап жизненного цикла, перед которым у нас уже будут проинициализированы все свойства хранения и аутлеты внутри контроллера"],
                     image: "",
                     optionA: "Перед loadView()",
                     optionB: "Перед viewDidLoad()",
                     optionC: "Перед viewWillLayoutSubviews()",
                     optionD: "",
                     id: 303360430,
                     helpText: "Перед loadView(). Все свойства и аутлеты устанавливаются перед loadView(), после awakeFromNib()."),
            
            Question(question: ["Какой из этих методов жизненного цикла отработает первым?"],
                     image: "",
                     optionA: "loadView",
                     optionB: "viewDidLoad",
                     optionC: "viewWillAppear",
                     optionD: "",
                     id: 423110531,
                     helpText: "loadView. Самым первым среди указанных отработает loadView()."),
            
            Question(question: ["viewWillDisappear вызывается перед удалением вью из иерархии вью контроллера. Так ли это?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 309737988,
                     helpText: """
                     Да. Метод viewWillDisappear() вызывается перед тем, как вью уходит с экрана (удаляется из иерархии вью контроллера).
                     
                     Здесь можно выполнять resignFirstResponder(), ставят на паузу выполняемые действия, можно откатить все изменения, которые были внесены в viewWillAppear (ориентация и стиль статус бара), можно почистить данные, обнулить кэш.
                     
                     Метод требует обязательного обращения к суперклассу super.viewWillDisappear().
                     """),
            
            Question(question: ["Сколько раз за жизненный цикл экрана вызывается метод viewDidLoad()?",
                                "За жизненный цикл экрана метод viewDidLoad() вызывается такое количество раз"],
                     image: "",
                     optionA: "Один",
                     optionB: "Два",
                     optionC: "Сколько необходимо",
                     optionD: "",
                     id: 370524130,
                     helpText: """
                     Один. Метод viewDidLoad() вызывается только один раз за жизненный цикл экрана. Он вызывается когда все вью и сам контроллер уже загружены в память.
                     
                     В этом методе можно обращаться к локальным методам, к сетевым запросам, которые необходимо выполнить только один раз (например: исходные данные для экрана), выполнять обработку интерфейса для юзера, и делать другие подходящие задачи, которые необходимо выполнить один раз на старте вашего экрана.
                     """),
            
            Question(question: ["Должны ли мы обращаться к super.viewWillLayoutSubviews внутри переопределяемой реализации viewWillLayoutSubviews()?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 921715652,
                     helpText: "Нет. В данном методе (viewWillLayoutSubviews) обращение к своему суперклассу не требуется, поэтому писать super.viewWillLayoutSubviews() не нужно."),
            
            Question(question: ["Можем ли мы обратиться к view нашего вью контроллера из awakeFromNib или init(nibName:bundle:)?",
                                "Назначены ли IBOutlets нашего вью контроллера, в момент вызовы awakeFromNib или init(nibName:bundle:)?",
                                "Назначены ли IBActions нашего вью контроллера, в момент вызовы awakeFromNib или init(nibName:bundle:)?",],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 314120503,
                     helpText: """
                     Нет. К моменту awakeFromNib, в случае загрузки из сториборда, или init(nibName:bundle:) в случае программного создания вью контроллера, наш экран находится в состоянии Unloaded, то есть его интерфейс еще не загружен, важно знать, что в этот момент графические элементы интерфейса еще не созданы, а ссылки на объекты, которые должны быть доступны через IBOutlets и IBActions еще не назначены и при попытке обратиться к ним мы столкнемся с ошибкой, и ваше приложение упадет (Fatal error).
                     """),
            
            Question(question: ["Имеем ли мы к моменту вызова viewDidLoad() все окончательные размеры экрана и его элементов?",
                                "Можем ли мы без последующих проблем работать с размерами экрана и элементов внутри viewDidLoad()?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 773533335,
                     helpText: """
                     Нет. Метод viewDidLoad() вызывается до того, как просчитываются все размеры на экране, и до того, как выполняется установка ориентации экрана, поэтому очень рискованно работать в нем с размерами ваших вью.
                     
                     На этом этапе границы вью не установлены, и мы не можем обращаться к значениям геометрии (высота, ширина, и прочие), точнее обратиться мы можем, но получим некорректные данные.
                     """),
            
            Question(question: ["Этот метод будет вызываться в случае нехватки памяти"],
                     image: "",
                     optionA: "didReceiveMemoryWarning()",
                     optionB: "updateViewConstraints()",
                     optionC: "viewWillTransition()",
                     optionD: "",
                     id: 384118327,
                     helpText: """
                     didReceiveMemoryWarning(). В случае нехватки памяти срабатывает метод didReceiveMemoryWarning() (его можно искуственно вызвать через симулятор - Debug / Simulate Memory Warning).
                     
                     В нем можно обнулять объекты, которые не используются, предупредить пользователя, что приложение будет закрыто и попробовать сохранить какие-то данные.
                     """),
            
            Question(question: ["Если внутри вашего вью контроллера вы установите основному view свойство isHidden = true, будет ли вызван метод viewWillAppear?"],
                     image: "",
                     optionA: "Да, вызывается",
                     optionB: "Нет, метод не вызывается",
                     optionC: "",
                     optionD: "",
                     id: 183128318,
                     helpText: """
                     Да, вызывается. Даже если вы скрыли основное вью внутри вью контроллера (присвоили его свойству isHidden = true), и оно в данный момент не отображается на экране (или скрыли любое другое вью), дефолтный метод viewWillAppear все равно будет вызван, так как с помощью него скрытое вью добавляется в иерархию вью (view hierarchy).
                     """),
            
            Question(question: ["Какой из этих методов жизненного цикла отработает первым, при первой загрузке экрана?"],
                     image: "",
                     optionA: "updateViewConstraints",
                     optionB: "viewWillLayoutSubviews",
                     optionC: "viewDidLayoutSubviews",
                     optionD: "",
                     id: 843638882,
                     helpText: "updateViewConstraints. Самым первым среди указанных методов, при первой загрузке экрана, отработает updateViewConstraints(). Он так же будет срабатывать каждый раз, когда мы показываем дочерний контроллер в модальном представлении (popover, page sheet)."),
            
            Question(question: ["Метод viewDidLoad() вызывается только после того, как вью контроллер загрузил все свои вью в память, так ли это?",
                                "viewDidLoad() вызывается независимо от того, были ли вью загружены из nib файла (.xib) или программно через loadView(). Так ли это?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 137416262,
                     helpText: "Да. Метод viewDidLoad() вызывается после того, как вью контроллер загрузил иерархию всех своих вью в память. Этот метод вызывается независимо от того, были ли вью загружены из nib файла (.xib) или программно через loadView() метод."),
            
            Question(question: ["Можем ли мы обращаться к свойствам и аутлетам в методе viewDidLoad(), чтобы это не вызвало ошибку по nil?",
                                "Все свойства и аутлеты контроллера инициализированы к моменту viewDidLoad(). Так ли это?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 151998172,
                     helpText: """
                     Да. В методе viewDidLoad() мы выполняем большинство настроек для нашего вью контроллера, так как в этот момент все свойства и аутлеты уже инициализированы (значит к ним можно обращаться и менять их параметры).
                     
                     Все свойства инициализируются между awakeFromNib и loadView (то есть успевают к viewDidLoad).
                     """),
            
            Question(question: ["Должны ли мы обращаться к суперклассу super.awakeFromNib()?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 691599989,
                     helpText: "Да. Вы должны вызывать super.awakeFromNib, чтобы дать родительскому классу возможность произвести дополнительную инициализацию, которая им необходима. Хотя дефолтная реализация этого метода ничего не делает, большое количество UIKit классов предоставляют не пустые реализации."),
            
            Question(question: ["Если мы не используем Autolayout, в каком методе жизненного цикла мы можем скорректировать положение и размеры наших сабвью?"],
                     image: "",
                     optionA: "viewWillLayoutSubviews",
                     optionB: "viewDidLayoutSubviews",
                     optionC: "viewWillAppear",
                     optionD: "viewWillDisappear",
                     id: 968252448,
                     links: [
                        "https://habr.com/ru/post/654517/",
                        "https://medium.com/good-morning-swift/ios-view-controller-life-cycle-2a0f02e74ff5"
                     ],
                     helpText: """
                     viewWillLayoutSubviews. Если вы не используете autolayout, то подходящим местом для работы с вашими вью и сабвью будет метод viewWillLayoutSubviews, который, как раз, вызывается перед тем как происходит рассчет и расстановка всей иерархии вью на экране.
                     
                     Этот метод сообщает, что сейчас размеры вью будут изменены под размер экрана.
                     """),
            
            Question(question: ["Если мы переопределяем метод viewWillTransition() для обработки анимации экрана при смене ориентации, должны ли мы обращаться к суперклассу super.viewWillTransition()?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 444802935,
                     helpText: "Да. Если вы переопределяете метод viewWillTransition(), обязательно вызывайте суперкласс этого метода в тот или иной момент переопределения, поскольку UIKit должен корректным образом передать дальше по цепочке все размеры."),
            
            Question(question: ["Метод viewWillAppear() вызывается каждый раз перед тем, как ___",
                                "Метод viewWillAppear() предшествует этому"],
                     image: "",
                     optionA: "Вью станут видимыми",
                     optionB: "Все вью загружены в память",
                     optionC: "Вью будет удалено из иерархии",
                     optionD: "",
                     id: 264890650,
                     helpText: """
                     Вью станут видимыми. Этот метод вызывается каждый раз перед тем, как ваши вью станут видимыми, а так же до конфигурации анимации.
                     
                     На этом этапе наши вью уже имеют внешний размер, но ориентация экрана еще не установлена.
                     
                     Вы можете переписать (override) этот метод, чтобы реализовать свои задачи по тонкой настройке ваших вью и сабвью, которые нужно сделать без анимации (спрятать те или иные поля, или отключить какие-либо действия перед тем, как вью станет видимым).
                     """),
            
            Question(question: ["Подходит ли метод viewDidAppear() для вызова becomeFirstResponder()?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 646110117,
                     helpText: "Да. В методе viewDidAppear() можно размещать ресурсоемкие операции, например, связанные с получением данных. В нем можно вызвать becomeFirstResponder(), чтобы сразу начать ввод в нужное поле."),
            
            Question(question: ["В каком методе жизненного цикла экрана лучше всего переопределять значения constraints (например: динамические размеры сабвью, зависящие от контента), чтобы пользователь визуально не мог видеть перерасчет размеров?"],
                     image: "",
                     optionA: "viewWillLayoutSubviews",
                     optionB: "viewDidLoad",
                     optionC: "viewWillDisappear",
                     optionD: "viewDidAppear",
                     id: 128472720,
                     helpText: """
                     viewWillLayoutSubviews. Лучший вариант это viewWillLayoutSubviews или viewDidLayoutSubviews. Эти методы будут вызываться каждый раз при появлении экрана, изменении размеров, смене ориентации и т.д.
                     
                     При этом изменение будет происходить по корректным геометрическим размерам, и до окончательного отображения вью на экране (незаметно для пользователя).
                     
                     Примечание: viewWillLayoutSubviews и viewDidLayoutSubviews будут вызываться неоднократно за жизненный цикл вашего вью контроллера (например когда меняется ориентация экрана), так что если вам необходимо применять изменения только в определенных условиях, не забывайте использовать проверку через флаги (чтобы не применять изменения каждый раз).
                     """),
            
            Question(question: ["Выберите метод, при переопределении которого мы должны обращаться к суперклассу"],
                     image: "",
                     optionA: "viewDidLoad",
                     optionB: "loadView",
                     optionC: "viewWillLayoutSubviews",
                     optionD: "viewDidLayoutSubviews",
                     id: 527795728,
                     helpText: "viewDidLoad. Из представленных методов, к суперклассу обращаться необходимо только внутри viewDidLoad()."),
            
            Question(question: ["Перед каким методом происходит установка свойств в контроллере?"],
                     image: "",
                     optionA: "Перед loadView()",
                     optionB: "Перед viewDidLoad()",
                     optionC: "Перед viewWillAppear()",
                     optionD: "",
                     id: 935333634,
                     helpText: """
                     Перед loadView(). Все свойства (properties) и аутлеты (outlets) устанавливаются после awakeFromNib() и перед loadView(), чтобы к моменту загрузки нашего экрана в viewDidLoad мы уже могли ими оперировать и не вызывать ошибку.
                     
                     При этом надо понимать, что обращаться к аутлетам извне не стоит, поскольку до перехода на экран они не установлены и являются пустыми.
                     """),
            
            Question(question: ["Будут ли вызваться методы viewWillLayoutSubviews() и viewDidLayoutSubviews() после поворота экрана и смены ориентации?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 846218549,
                     helpText: """
                     Да. Отработка поворота экрана отрабатывает автоматически, и устанавливается в настройках проекта.
                     
                     Однако если нужно самостоятельно обработать анимацию при повороте, вы можете переопределить viewWillTransition().
                     
                     Он будет вызываться при смене ориентации экрана, а так же сразу за ним вызываются viewWillLayoutSubviews() и viewDidLayoutSubviews().
                     """),
            
            Question(question: ["При вызове метода viewWillLayoutSubviews() мы уже имеем доступ к геометрическим размерам загружаемого экрана?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 327853033,
                     helpText: """
                     Да. После вызова метода viewWillAppear устанавливаются границы вью, и геометрические данные становятся доступным к этапу viewWillLayoutSubviews.
                     
                     Между методами viewWillLayoutSubviews и viewDidLayoutSubviews происходит AutoLayout, оба этих метода направлены на то, чтобы проконтролировать, выполнились ли правильно расстановка всех вью и сабвью.
                     """),
            
            Question(question: ["Когда мы показываем другой контроллер модально через popover или page sheet, и возвращаемся обратно на предыдущий экран, отработает ли метод viewWillAppear()?",
                                "Когда мы показываем другой контроллер модально через popover или page sheet, и возвращаемся обратно на предыдущий экран, отработает ли метод viewDidAppear()?"],
                     image: "",
                     optionA: "Нет, оба метода не вызываются",
                     optionB: "Да, отработают",
                     optionC: "Только viewWillAppear()",
                     optionD: "Только viewDidAppear()",
                     id: 922512128,
                     helpText: """
                     Нет, оба метода не вызываются. Вы можете переписать (override) viewWillAppear() метод, чтобы выполнить задачи, связанные с отображением вью.
                     
                     Например, вы можете использовать его для того, чтобы изменить ориентацию или стиль статус бара, или самого вью, которое должно появиться на экране. Если вы переписываете этот метод, в тот или иной момент вы должны будете вызвать super.
                     
                     Если вы показываете дочерний контроллер через модальное представление (modalPresentationStyle = .popover / .pageSheet), по возвращению на родительский контроллер (сделали swipe down или dismiss) - этот метод вызываться не будет.
                     """),
            
            Question(question: ["Сколько раз за жизненный цикл может вызываться метод viewWillAppear()?"],
                     image: "",
                     optionA: "Многократно",
                     optionB: "Один раз",
                     optionC: "Только два раза",
                     optionD: "",
                     id: 709411242,
                     helpText: "Многократно. Метод viewWillAppear() вызывается перед тем, как графические элементы экрана будут добавлены в иерархию графических элементов. Но в отличии от viewDidLoad он вызывается не один раз, а каждый раз, когда экран добавляется в иерархию."),
            
            Question(question: ["Будет ли вызван метод viewWillLayoutSubviews() после изменения ориентации экрана?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 642683692,
                     helpText: "Да. Каждый раз, когда размеры вью меняются (или мы меняем ориентацию экрана), viewWillLayoutSubviews() корректирует размеры и положение своих сабвью. При изменении ориентации экрана этот метод будет вызываться сразу после viewWillTransition()."),
            
            Question(question: ["Какой из этих методов отработает последним при первой загрузке экрана?"],
                     image: "",
                     optionA: "viewDidAppear",
                     optionB: "viewDidDisappear",
                     optionC: "viewDidLayoutSubviews",
                     optionD: "",
                     id: 172763936,
                     helpText: "viewDidAppear. При загрузке экрана, последним мы увидим вызов метода viewDidAppear, когда наше вью уже загружено в память, и добавлено в иерархию. Дословно он говорит нам \"вью загружено и представлено на экране\""),
            
            Question(question: ["Какой из этих методов отработает первым (вью устанавливается из storyboard)?"],
                     image: "",
                     optionA: "awakeFromNib",
                     optionB: "loadView",
                     optionC: "viewDidLoad",
                     optionD: "",
                     id: 737731010,
                     helpText: "awakeFromNib. Самым первым среди указанных отработает awakeFromNib()."),
            
            Question(question: ["Если мы с текущего контроллера презентуем следующий через .popover или .pageSheet, какой метод жизненного цикла точно будет вызван?"],
                     image: "",
                     optionA: "updateViewConstraints()",
                     optionB: "viewWillDisappear()",
                     optionC: "viewDidDisappear()",
                     optionD: "viewWillAppear()",
                     id: 254078202,
                     helpText: """
                     updateViewConstraints(). В момент презентации модального контроллера (popover, page sheet) у нас не будут вызываться стандартные методы жизненного цикла, которые вызываются во время презентации полного экрана, и мы будем обращаться только в updateViewConstraints().
                     
                     При этом, сложность заключается в том, что мы не будем обращаться к этим привычным методам ни при презентации модального контроллера, ни по возвращению с него.
                     """),
            
            Question(question: ["Когда вы оверрайдите метод viewWillAppear(), вам необходимо вызывать super. Так ли это?",
                                "Методу viewWillAppear() необходим вызов super. Так ли это?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 589318428,
                     helpText: "Да. Если вы переписываете метод viewWillAppear(), в тот или иной момент вы должны будете обратиться к суперклассу super.viewWillAppear(), так же как и у метода viewDidLoad и многих других."),
            
            Question(question: ["В какой момент мы должны обращаться к super.updateViewConstraints() в переопределяемой реализации updateViewConstraints()?"],
                     image: "",
                     optionA: "В конце",
                     optionB: "В начале",
                     optionC: "Без разницы",
                     optionD: "",
                     id: 758933900,
                     helpText: "В конце. Вызов данного метода происходит перед методом viewWillLayoutSubviews(), в конце переопределенного метода вы обязательно должны обращаться к суперклассу super.updateViewConstraints()."),
            
            Question(question: ["После какого из указанных методов отрабатывает Autolayout вашего приложения?"],
                     image: "",
                     optionA: "viewWillLayoutSubviews",
                     optionB: "viewDidLayoutSubviews",
                     optionC: "viewWillTransition",
                     optionD: "",
                     id: 218344936,
                     helpText: "viewWillLayoutSubviews. Autolayout отрабатывает между методами viewWillLayoutSubviews и viewDidLayoutSubviews, к этому моменту мы имеем доступ ко всем корректным геометрическим данным."),
            
            Question(question: ["Какой метод мы можем использовать для того, чтобы вручную обработать анимацию смены ориентации экрана?"],
                     image: "",
                     optionA: "viewWillTransition()",
                     optionB: "viewWillLayoutSubviews()",
                     optionC: "viewWillAppear()",
                     optionD: "",
                     id: 961215638,
                     helpText: """
                     viewWillTransition(). Отработка поворота экрана отрабатывает автоматически, и устанавливается в настройках проекта.
                     
                     Однако если нужно самостоятельно обработать анимацию при повороте, вы можете переопределить viewWillTransition().
                     
                     Будет вызываться при смене ориентации экрана, а так же сразу за ним вызываются viewWillLayoutSubviews() и viewDidLayoutSubviews().
                     """),
            
            Question(question: ["Какой из методов вызовется в первую очередь?"],
                     image: "",
                     optionA: "updateViewConstraints()",
                     optionB: "viewWillLayoutSubviews()",
                     optionC: "",
                     optionD: "",
                     id: 890793497,
                     helpText: "updateViewConstraints(). Вызов происходит перед методом viewWillLayoutSubviews()."),
            
            Question(question: [
                "Расстановка автолейаута происходит между методами viewDidLayoutSubviews и viewWillLayoutSubviews. Правда ли это?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 459489072,
                     links: [
                        "https://habr.com/ru/post/654517/",
                        "https://medium.com/good-morning-swift/ios-view-controller-life-cycle-2a0f02e74ff5"
                     ],
                     helpText: """
                     Да. Между методами viewDidLayoutSubviews и viewWillLayoutSubviews происходит расстановка автолейаута.
                     """
                    ),
            
            Question(question: [
                "Какой метод жизненного цикла View Controller мы можем использовать для того, чтобы установить view программно, без использования Interface Builder?"
            ],
                     image: "",
                     optionA: "loadView",
                     optionB: "viewDidLoad",
                     optionC: "viewDidAppear",
                     optionD: "",
                     id: 255151644,
                     links: [
                        "https://habr.com/ru/articles/654517/",
                        "https://sparrowcode.io/ru/tutorials/uiviewcontroller-lifecycle"
                     ],
                     helpText: """
                     loadView. Вам следует переопределить loadView, если вы хотите создать свой собственный пользовательский интерфейс программно без использования Interface Builder.
                     
                     Вы должны создать и назначить view для вашего ViewController таким образом:
                     
                     override func loadView() {
                         super.loadView()
                         self.view = UIView()
                     }
                     """
                    ),
            
            Question(question: [
                "Самый ранний метод жизненного цикла View Controller, на котором уже известны корректные размеры его view"
            ],
                     image: "",
                     optionA: "viewWillAppear",
                     optionB: "viewDidLayoutSubviews",
                     optionC: "viewDidAppear",
                     optionD: "",
                     id: 919285641,
                     links: [
                        "https://habr.com/ru/articles/654517/",
                        "https://sparrowcode.io/ru/tutorials/uiviewcontroller-lifecycle"
                     ],
                     helpText: """
                     viewWillAppear. Самый ранний метод жизненного цикла вью контроллера, в котором известны корректные размеры его вью, это viewWillAppear.
                     
                     В этом методе вы можете уверенно использовать размеры вью для размещения и настройки элементов интерфейса пользователя.
                     
                     В этот момент вью контроллер готов к отображению, и его размеры уже соответствуют окончательному размеру, который будет отображаться на экране.
                     """
                    ),
            
            Question(question: [
                "В каком самом раннем методе жизненного цикла View Controller известны корректные размеры всех его subviews?"
            ],
                     image: "",
                     optionA: "viewDidLayoutSubviews",
                     optionB: "viewWillLayoutSubviews",
                     optionC: "viewWillAppear",
                     optionD: "",
                     id: 352191352,
                     links: [
                        "https://habr.com/ru/articles/654517/",
                        "https://sparrowcode.io/ru/tutorials/uiviewcontroller-lifecycle"
                     ],
                     helpText: """
                     viewDidLayoutSubviews. Самый ранний метод жизненного цикла вью контроллера, в котором известны корректные размеры всех его сабвью, является метод viewDidLayoutSubviews.
                     
                     Этот метод вызывается после того, как система установила фактические размеры всех представлений в иерархии вью контроллера.
                     
                     Когда вызывается viewDidLayoutSubviews, размеры всех подпредставлений уже были правильно установлены в соответствии с геометрией и оформлением вью контроллера.

                     Таким образом, viewDidLayoutSubviews представляет собой хорошую точку входа для настройки и настройки размещения сабвью перед их отображением на экране.
                     """
                    ),
            
            Question(question: [
                "Как узнать загружена ли view у View Controller?"
            ],
                     image: "",
                     optionA: "Проверить isViewLoaded",
                     optionB: "Внутри loadView()",
                     optionC: "Никак",
                     optionD: "",
                     id: 249024622,
                     links: [
                        "https://habr.com/ru/articles/654517/",
                        "https://sparrowcode.io/ru/tutorials/uiviewcontroller-lifecycle"
                     ],
                     helpText: """
                     Проверить isViewLoaded. Для того чтобы узнать, загружена ли вью во вью контроллере, можно использовать свойство `isViewLoaded`.

                     Например:
                     
                     if isViewLoaded {
                         // Вью загружена
                     } else {
                         // Вью еще не загружена
                     }

                     Вы можете проверить это свойство внутри методов жизненного цикла вью контроллера или в других методах, где вам может понадобиться узнать, загружена ли вью.
                     """
                    ),
        ]
    }
}
