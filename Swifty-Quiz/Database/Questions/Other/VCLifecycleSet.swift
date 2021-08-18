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
            
            Question(question: ["На каком из этих этапов мы увидим экран с загруженным view?",
                                "На одном из этих этапов мы увидим полностью загруженный экран, на каком?"],
                     image: "Lifecycle01",
                     optionA: "Appeared",
                     optionB: "Dissapearing",
                     optionC: "Dissapeared",
                     optionD: "Appearing",
                     questionId: 615454268,
                     helpText: "Правильный ответ: Appeared. После вызова viewDidAppear: Этот метод вызывается после того, как view отобразилось на экране. Обычно в нем сохраняют данные, запускают анимацию, начинают воспроизведение видео или звука или начинают получение данных по сетевым запросам."),
            
            
            // MARK: loadView()
            
            Question(question: ["Должны ли вы сами обращаться к методу loadView() при использовании Interface Builder для создания views?",
                                "Надо ли нам обращаться к методу loadView() на каком-либо этапе жизненного цикла экрана, если view создается через .xib или storyboard?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     questionId: 615454268,
                     helpText: "Согласно документации Apple, вам нежелательно обращаться к этому методу самостоятельно. View controller вызывает этот метод когда запрашивается его view property, но в данный момент оно пустое (nil). Он загружает или создает view и присваивает его view property этого контроллера. Желательно не трогать loadView(), особенно если view создается через .xib или storyboard (если вы используете Interface Builder для создания своих вьюх и инициализации вью контроллера, не оверрайдите (override) этот метод)."),
            
            Question(question: ["Какая основная задача у метода loadView()?",
                                "loadView() выполняет именно эту задачу"],
                     image: "",
                     optionA: "Создание view",
                     optionB: "Сохранение данных",
                     optionC: "Запуск анимации",
                     optionD: "Инициализация view controller",
                     questionId: 590412852,
                     helpText: "View controller вызывает этот метод когда запрашивается его view property, но в данный момент оно пустое (nil). Он загружает или создает view и присваивает его view property для этого контроллера."),
            
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
                     helpText: "Вы можете оверрайдить (override) метод loadView() в случае, если создаете свои views программно. Если вы решили так делать, проинициализируйте ваше рутовое вью (root view) во view property вашего контроллера. Ваша кастомная реализация этого метода не должна вызывать super."),
            
            Question(question: ["Должна ли кастомная версия метода loadView() вызывать внутри себя super.loadView()?"],
                     image: "",
                     optionA: "Нет, не должна",
                     optionB: "Да, должна",
                     optionC: "",
                     optionD: "",
                     questionId: 527779433,
                     helpText: "Вы можете оверрайдить (override) метод loadView() в случае, если создаете свои views программно. Если вы решили так делать, проинициализируйте ваше рутовое вью (root view) во view property вашего контроллера. Ваша кастомная реализация этого метода не должна вызывать super."),
            
            
            // MARK: viewDidLoad()
            
            Question(question: ["Сколько раз за жизненный цикл экрана вызывается метод viewDidLoad()?",
                                "За жизненный цикл экрана метод viewDidLoad() вызывается такое количество раз"],
                     image: "",
                     optionA: "Один",
                     optionB: "Два",
                     optionC: "Сколько необходимо",
                     optionD: "",
                     questionId: 370524130,
                     helpText: "Метод viewDidLoad() вызывается только один раз за жизненный цикл экрана. Он вызывается когда все view уже загружены. В этом методе можно обращаться к локальным методам, к сетевым запросам, которые необходимо выполнить только один раз (исходные данные для экрана), выполнять обработку интерфейса для юзера, и делать любые другие задачи, которые необходимо выполнить один раз на старте экрана."),
            
            Question(question: ["Имеем ли мы к моменту вызова viewDidLoad() все окончательные размеры экрана и его элементов?",
                                "Можем ли мы без последующих проблем работать с размерами экрана и элементов внутри viewDidLoad()?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     questionId: 773533335,
                     helpText: "Метод viewDidLoad() вызывается до того, как просчитываются все размеры на экране, и до того, как выполняется любой поворот (смена ориентации экрана), поэтому очень рискованно работать в нем с размерами ваших view."),
            
            Question(question: ["Метод viewDidLoad() вызывается только после того, как view controller загрузил все свои views в память, так ли это?",
                                "viewDidLoad() вызывается независимо от того, были ли вью загружены из nib файла (.xib) или программно через loadView(). Так ли это?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 137416262,
                     helpText: "Метод viewDidLoad() вызывается после того, как view controller загрузил иерархию всех своих view в память. Этот метод вызывается независимо от того, были ли views загружены из nib файла (.xib) или программно через loadView() метод. Обычно вы оверрайдите (override) этот метод, чтобы произвести дополнительную работу по инициализации своих views, которые были загружены из nib файла."),
            
            
            // MARK: viewWillAppear()
            
            Question(question: ["Метод viewWillAppear() вызывается каждый раз перед тем, как ___",
                                "Метод viewWillAppear() предшествует этому"],
                     image: "",
                     optionA: "вью становятся видимыми",
                     optionB: "все вью загружены в память",
                     optionC: "ваш контроллер будет деинициализирован",
                     optionD: "",
                     questionId: 264890650,
                     helpText: "Этот метод вызывается каждый раз перед тем, как ваши views становятся видимыми, а так же до конфигурации анимации. На этом этапе наши вью уже имеют внешний размер, но ориентация экрана еще не установлена. Вы можете переписать (override) этот метод чтобы реализовать свои задачи, связанные с отображением view, такие как: спрятать те или иные поля, или отключить какие-либо действия перед тем, как view станет видимым."),
            
            Question(question: ["Когда мы показываем другой контроллер модально (начиная с iOS 13.0), и возвращаемся обратно на предыдущий экран, отработает ли метод viewWillAppear() или viewDidAppear()?"],
                     image: "",
                     optionA: "Нет, оба метода не вызываются",
                     optionB: "Да, отработают",
                     optionC: "Только viewWillAppear()",
                     optionD: "Только viewDidAppear()",
                     questionId: 922512128,
                     helpText: "Вы можете переписать (override) viewWillAppear() метод, чтобы выполнить задачи, связанные с отображением view. Например, вы можете использовать его для того, чтобы изменить ориентацию или стиль статус бара, или самого view, которое должно появиться на экране. Если вы переписываете этот метод, в тот или иной момент вы должны будете вызвать super. Если вы показываете дочерний контроллер через модальное представление (as a sheet as default), по возвращению на родительский контроллер (сделали swipe down) - этот метод вызываться не будет."),
            
            // MARK: updateViewConstraints()
            
            // MARK: viewWillLayoutSubviews()
             
            // MARK: viewDidLayoutSubviews()
            
            // MARK: viewDidAppear()
            
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
