//
//  FramesAndBounds.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 08.09.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation

class FramesAndBounds {
    static func getQuestions() -> [Question] {
        return [
            Question(question: ["Где находится начало системы координат в iOS (origin)?"],
                     image: "",
                     optionA: "Левый верхний угол",
                     optionB: "Правый верхний угол",
                     optionC: "Левый нижний угол",
                     optionD: "",
                     questionId: 198327605,
                     helpText: "Начало системы координат (origin) в iOS находится слева вверху. Мы можем поместить view в начало superview установив x-y координаты на (0, 0)."),
            
            Question(question: ["С помощью чего мы можем разместить view в системе координат его superview?"],
                     image: "",
                     optionA: "frame",
                     optionB: "bounds",
                     optionC: "",
                     optionD: "",
                     questionId: 682433098,
                     helpText: "frame = расположение и размер view относительно системы координат родительского view (важно для размещения view в superview). Чтобы помочь разобраться с тем, что такое frame - воспринимайте его как рамку для картины на стене. Рамка похожа на границу нашего view. Вы можете повесить картину (в рамке) где угодно на стене (родительское вью). Точно таким же образом вы можете размещать ваши view в любом месте их родительских superview. Этот superview будет вашей стеной."),
            
            Question(question: ["С помощью чего мы можем разместить контент или subviews внутри нашей view?"],
                     image: "",
                     optionA: "bounds",
                     optionB: "frame",
                     optionC: "",
                     optionD: "",
                     questionId: 353806968,
                     helpText: "bounds = расположение и размер view относительно своей системы координат (важно для размещения контента или subviews внутри себя). Чтобы понять bounds, подумайте о баскетбольной площадке, где иногда игра выходит за пределы площадки. Вы можете играть внутри определенных границ этой площадки, но вам все равно где она находится. Это может быть в тренажерном зале, или на улице в школе, или перед домом. Это не имеет значения. Точно также система координат view bounds, заботится только о самом view, она ничего не знает о расположении view на superview. Начало координат (точка (0, 0) по умолчанию) — это верхний левый угол view. Любые subviews располагаются в зависимости от этой точки."),
        
            Question(question: ["Какой цвет показывает bounds?"],
                     image: "FramesAndBounds01",
                     optionA: "Зеленый",
                     optionB: "Желтый",
                     optionC: "Красный",
                     optionD: "",
                     questionId: 721042700,
                     helpText: "На первом изображении слева мы видим view, который находится в верхнем левом углу superview. Желтый прямоугольник показывает frame у нашего view. Справа мы снова видим view, но на этот раз родительское представление не отображается. Это потому что bounds ничего не знает о superview. Зеленый прямоугольник изображает bounds у нашего view. Красная точка на обоих изображениях обозначает origin (начало) у frame и bounds."),
            
            Question(question: ["Какой цвет показывает frame?"],
                     image: "FramesAndBounds01",
                     optionA: "Желтый",
                     optionB: "Зеленый",
                     optionC: "Серый",
                     optionD: "",
                     questionId: 597236663,
                     helpText: "На первом изображении слева мы видим view, который находится в верхнем левом углу superview. Желтый прямоугольник показывает frame у нашего view. Справа мы снова видим view, но на этот раз родительское представление не отображается. Это потому что bounds ничего не знает о superview. Зеленый прямоугольник изображает bounds у нашего view. Красная точка на обоих изображениях обозначает origin (начало) у frame и bounds."),
        
            Question(question: ["Каким цветом на этой картинке изображен origin?"],
                     image: "FramesAndBounds01",
                     optionA: "Красный",
                     optionB: "Желтый",
                     optionC: "Зеленый",
                     optionD: "Серый",
                     questionId: 857850292,
                     helpText: "Красная точка на обоих изображениях обозначает origin (начало) у frame и bounds."),
        ]
    }
}
