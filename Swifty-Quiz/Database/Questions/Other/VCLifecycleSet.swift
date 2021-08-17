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
            
            Question(question: ["Что входит в список основных обязанностей UIViewController?"],
                     image: "",
                     optionA: "Обновление содержимого экрана",
                     optionB: "Создание вью модели",
                     optionC: "Парсинг данных из сети",
                     optionD: "Сбор аналитики данных",
                     questionId: 942977241,
                     helpText: "Основные обязанности вью контроллера включают следующее: Обновление содержимого экрана, обычно в ответ на изменения базовых данных. Реагирование на взаимодействие пользователя с экраном. Изменение размеров разных вью и управление общим видом всего интерфейса. Координация с другими объектами, включая другие контроллеры в вашем приложении."),
            
            Question(question: ["На каком этапе мы увидим экран с загруженным view?"],
                     image: "Lifecycle01",
                     optionA: "Appeared",
                     optionB: "Dissapearing",
                     optionC: "Dissapeared",
                     optionD: "Appearing",
                     questionId: 615454268,
                     helpText: "Правильный ответ: Appeared. После вызова viewDidAppear: Этот метод вызывается после того, как view отобразилось на экране. Обычно в нем сохраняют данные, запускают анимацию, начинают воспроизведение видео или звука или начинают получение данных по сетевым запросам."),
            
            
            // MARK: loadView()
            
            Question(question: ["Должны ли вы сами обращаться к методу loadView()?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     questionId: 615454268,
                     helpText: "Согласно документации Apple, вы не должны вызывать этот метод самостоятельно. View controller вызывает этот метод когда запрашивается его view property, но в данный момент оно пустое (nil). Он загружает или создает view и присваивает его view property для этого контроллера. Желательно не трогать loadView(), особенно если view создается через .xib или storyboard."),
            
            Question(question: ["Какая основная задача у метода loadView()?"],
                     image: "",
                     optionA: "Создание view",
                     optionB: "Сохранение данных",
                     optionC: "Запуск анимации",
                     optionD: "",
                     questionId: 590412852,
                     helpText: "View controller вызывает этот метод когда запрашивается его view property, но в данный момент оно пустое (nil). Он загружает или создает view и присваивает его view property для этого контроллера."),
            
            Question(question: ["Сколько раз за жизненный цикл экрана вызывается метод loadView()?"],
                     image: "",
                     optionA: "1",
                     optionB: "2",
                     optionC: "Сколько потребуется",
                     optionD: "",
                     questionId: 826127132,
                     helpText: "Как и viewDidLoad, метод loadView() вызывается лишь однажды в течение жизненного цикла вашего экрана (при запуске)."),
            
            
            // MARK: viewDidLoad()
            
            Question(question: ["Сколько раз за жизненный цикл экрана вызывается метод viewDidLoad()?"],
                     image: "",
                     optionA: "1",
                     optionB: "2",
                     optionC: "Сколько необходимо",
                     optionD: "",
                     questionId: 370524130,
                     helpText: "Метод viewDidLoad() вызывается только один раз за жизненный цикл экрана. Он вызывается когда все view уже загружены. В этом методе можно обращаться к локальным методам, к сетевым запросам, которые необходимо выполнить только один раз (исходные данные для экрана), выполнять обработку интерфейса для юзера, и делать любые другие задачи, которые необходимо выполнить один раз на старте экрана."),
            
            Question(question: ["Имеем ли мы к моменту viewDidLoad() все конечные размеры экрана и его элементов?",
                                "Можем ли мы без проблем работать с размерами экрана и элементов на этапе viewDidLoad()?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     questionId: 773533335,
                     helpText: "Метод viewDidLoad() вызывается до того, как просчитываются все размеры на экране, и до того, как выполняется любой поворот (смена ориентации экрана), поэтому очень рискованно работать в нем с размерами ваших view."),
            
            // MARK: viewWillAppear()
            
            
        ]
    }
}

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
