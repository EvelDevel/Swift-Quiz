//
//  FramesAndBounds.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 08.09.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation

final class FramesAndBounds {
    static func getQuestions() -> [Question] {
        return [
            Question(question: ["Где находится начало системы координат (origin) в iOS?"],
                     image: "",
                     optionA: "Левый верхний угол",
                     optionB: "Правый верхний угол",
                     optionC: "Левый нижний угол",
                     optionD: "",
                     id: 198327605,
                     helpText: "Левый верхний угол. Начало системы координат (origin) в iOS находится слева вверху. Мы можем поместить view в начало superview установив x-y координаты на (0, 0)."),
            
            Question(question: ["Что мы обязательно должны задать для frame нашего view, помимо его исходной точки (origin)?"],
                     image: "",
                     optionA: "Width & height",
                     optionB: "Width & bounds",
                     optionC: "Height & weight",
                     optionD: "",
                     id: 401910011,
                     helpText: "Width & height. View отвечает за рисование и обработку событий в прямоугольной области окна. Чтобы указать этот прямоугольник \"ответственности\", вы определяете его местоположение как исходную точку (origin) и размер (width / height), используя систему координат."),
            
            Question(question: ["С помощью чего мы можем разместить view в системе координат его superview?"],
                     image: "",
                     optionA: "frame",
                     optionB: "bounds",
                     optionC: "",
                     optionD: "",
                     id: 682433098,
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
                     id: 353806968,
                     helpText: """
                     bounds. Это расположение и размер view относительно своей системы координат (важно для размещения контента или subviews внутри себя). Чтобы понять bounds, подумайте о баскетбольной площадке, где иногда игра выходит за пределы площадки.
                     
                     Вы можете играть внутри определенных границ этой площадки, но вам все равно где она находится. Это может быть в тренажерном зале, или на улице в школе, или перед домом. Это не имеет значения.
                     
                     Точно также система координат view bounds, заботится только о самом view, она ничего не знает о расположении view на superview. Начало координат (точка (0, 0) по умолчанию) — это верхний левый угол view. Любые subviews располагаются в зависимости от этой точки.
                     """),
        
            Question(question: ["Какой тип имеет origin у frame?"],
                     image: "",
                     optionA: "CGPoint",
                     optionB: "CGFloat",
                     optionC: "CGSize",
                     optionD: "",
                     id: 757597993,
                     helpText: "CGPoint. origin описывает координаты начальной точки для frame или bounds. Она имеет тип CGPoint, и содержит в себе два параметра, x - y."),
            
            Question(question: ["Какой цвет показывает bounds?"],
                     image: "FramesAndBounds01",
                     optionA: "Зеленый",
                     optionB: "Желтый",
                     optionC: "Красный",
                     optionD: "",
                     id: 721042700,
                     helpText: """
                     Зеленый. На первом изображении слева мы видим view, который находится в верхнем левом углу superview. Желтый прямоугольник показывает frame у нашего view.
                     
                     Справа мы снова видим view, но на этот раз родительское представление не отображается. Это потому что bounds ничего не знает о superview.
                     
                     Зеленый прямоугольник изображает bounds у нашего view. Красная точка на обоих изображениях обозначает origin (начало) у frame и bounds.
                     """),
            
            Question(question: ["Какой тип имеет frame.size?"],
                     image: "",
                     optionA: "CGSize",
                     optionB: "CGFloat",
                     optionC: "CGPoint",
                     optionD: "",
                     id: 902146550,
                     helpText: "CGSize. Он описывает высоту и ширину нашего прямоугольника, имеет тип CGSize (структура, содержащая значение высоты и значение ширины, height / width)."),
            
            Question(question: ["Будет ли вызываться метод draw(_:) при простом изменении frame?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 872856807,
                     helpText: "Нет. При изменении прямоугольника frame, view автоматически переотобразится без вызова метода draw(_:). Если вы хотите, чтобы UIKit вызывал метод draw(_:) при изменении прямоугольника frame, установите для свойства contentMode значение UIView.ContentMode.redraw."),
            
            Question(question: ["Какой цвет показывает frame?"],
                     image: "FramesAndBounds01",
                     optionA: "Желтый",
                     optionB: "Зеленый",
                     optionC: "Серый",
                     optionD: "",
                     id: 597236663,
                     helpText: """
                     Желтый. На первом изображении слева мы видим view, который находится в верхнем левом углу superview.
                     
                     Желтый прямоугольник показывает frame у нашего view. Справа мы снова видим view, но на этот раз родительское представление не отображается.
                     
                     Это потому что bounds ничего не знает о superview. Зеленый прямоугольник изображает bounds у нашего view. Красная точка на обоих изображениях обозначает origin (начало) у frame и bounds.
                     """),
        
            Question(question: ["Каким цветом на этой картинке изображен origin?"],
                     image: "FramesAndBounds01",
                     optionA: "Красный",
                     optionB: "Желтый",
                     optionC: "Зеленый",
                     optionD: "Серый",
                     id: 857850292,
                     helpText: "Красный. Красная точка на обоих изображениях обозначает origin (начало) у frame и bounds."),
            
            Question(question: ["Каким образом мы можем корректно изменить положение view после того, как применили к нему масштабирование или вращение через transform?"],
                     image: "",
                     optionA: "С помощью .center",
                     optionB: "Через свойство frame",
                     optionC: "С помощью свойства bounds",
                     optionD: "",
                     id: 979026551,
                     helpText: """
                     С помощью center. Центральная точка (.center) указывается в поинтах (points) в системе координат superview. Установка этого свойства соответствующим образом обновляет исходную точку прямоугольника в свойстве frame.
                     
                     Используйте это свойство вместо свойства frame, если вы хотите изменить положение view. Центральная точка всегда валидна (корректно расположена), даже если к view применялось масштабирование или вращение (через transform).
                     
                     Изменения этого свойства можно анимировать.
                     """),
            
            Question(question: ["Будут ли отличаться параметры bounds для этого view на изображениях слева и справа (зеленая рамка)?"],
                     image: "FramesAndBounds03",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 601981868,
                     helpText: "Нет. Если мы повернем view на 20 градусов по часовой стрелке (вращение выполняется с помощью преобразования, описанного в документации, через transform) - bounds останется прежним (origin 0, 0), он не знает что произошло c frame. Однако, все значения frame изменились."),
            
            Question(question: ["Структура, содержащая расположение и размеры прямоугольника"],
                     image: "",
                     optionA: "CGRect",
                     optionB: "CGAffineTransform",
                     optionC: "CGPoint",
                     optionD: "",
                     id: 600663733,
                     helpText: "CGRect. CGRect это структура, содержащая расположение и размеры прямоугольника."),
            
            Question(question: ["Следует ли нам использовать значения frame, после преобразования нашего view через transform?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 454326503,
                     helpText: "Нет. Если вы трансформируете view, frame становится неопределенным. Это означает, что если вы поворачиваете, масштабируете или выполняете какое-либо другое преобразование вашего view через transform, вам больше не следует использовать значения frame, но вы можете продолжать использовать значения bounds."),
            
            Question(question: ["Мы создаем frame для нашего view используя CGRect. У него есть возможность инициализации как с помощью Int значений, так и с помощью CGFloat значений. Это так?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Только CGFloat",
                     optionC: "Только Int",
                     optionD: "",
                     id: 108982672,
                     helpText: """
                     Да. У CGRect есть четыре инициализатора:
                     
                     1. init(origin: CGPoint, size: CGSize) - создает прямоугольник с указанием origin точки и размеров;
                     2. init(x: Double, y: Double, width: Double, height: Double) - создает прямоугольник, принимая на вход числа с плавающей точкой;
                     3. init(x: Int, y: Int, width: Int, height: Int) - создает прямоугольник, используя целые числа;
                     4. init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) - создает прямоугольник, используя CGFloat значения.
                     """),
            
            Question(question: ["Как мы можем получить размер view, если мы его трансформировали через transform?"],
                     image: "",
                     optionA: "Используя размер bounds",
                     optionB: "Используя размер frame",
                     optionC: "Через size",
                     optionD: "",
                     id: 998813391,
                     helpText: "Используя размер bounds. Когда вы вносите внутренние изменения, например, рисуете объекты или упорядочиваете subviews в вашем view. Также используйте bounds, чтобы получить размер вашего view, если вы его изменяли через transform."),
            
            Question(question: ["Можем ли мы создать CGRect для нашего frame используя CGFloat значения?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет, только Int",
                     optionC: "Нет, только Double",
                     optionD: "",
                     id: 885853330,
                     helpText: """
                     Да. Конечно можем, у CGRect есть четыре инициализатора:
                     
                     1. init(origin: CGPoint, size: CGSize) - создает прямоугольник с указанием origin точки и размеров;
                     2. init(x: Double, y: Double, width: Double, height: Double) - создает прямоугольник, принимая на вход числа с плавающей точкой;
                     3. init(x: Int, y: Int, width: Int, height: Int) - создает прямоугольник, используя целые числа;
                     4. init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) - создает прямоугольник, используя CGFloat значения.
                     """),
            
            Question(question: ["Мы можем создать frame с нулевыми значениями (origin (0,0) и размером (0,0)) через пустой инициализатор init(). Каким еще способом мы можем создать подобный frame?"],
                     image: "",
                     optionA: "CGRect.zero",
                     optionB: "CGRect.null",
                     optionC: "CGRect.infinite",
                     optionD: "",
                     id: 861098676,
                     helpText: "zero. Прямоугольник со значениями 0 можно создать двумя способами: 1. Через статическое свойство .zero (static var zero: CGRect) - cоздает прямоугольник, у которого origin и размер равны нулю. 2. Через пустую инициализацию - init() - создаст прямоугольник с origin (0,0) и размером (0,0)."),
        ]
    }
}
