//
//  DrawingAndAnimation.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 14.08.2022.
//  Copyright © 2022 Evel-Devel. All rights reserved.
//

import Foundation

class DrawingAndAnimation {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "Как в SwiftUI называется контейнер, который определяет свое содержимое как функцию собственного размера и пространства координат?"
            ],
                     image: "",
                     optionA: "GeometryReader",
                     optionB: "ViewBuilder",
                     optionC: "Path",
                     optionD: "",
                     questionId: 320291560,
                     helpText: """
                     GeometryReader. Контейнер, который определяет свое содержимое как функцию собственного размера и пространства координат.
                     
                     Если вы хотите, чтобы два вью занимали половину доступной ширины экрана, это было бы невозможно с использованием жестко запрограммированных значений, потому что мы не знаем заранее, какой будет ширина экрана.

                     Чтобы решить эту проблему, GeometryReader предоставляет нам входное значение, говорящее нам о доступной ширине и высоте, и затем мы можем использовать это для любых расчетов, которые нам нужны. Итак, если бы у нас было два представления, и мы хотели бы, чтобы одно занимало треть экрана, а другое — две трети, мы могли бы использовать GeometryReader.
                     """),
            
            Question(question: [
                "Какой тип в SwiftUI позволит вам отрисовать контур 2D-формы?"
            ],
                     image: "",
                     optionA: "Path",
                     optionB: "GeometryReader",
                     optionC: "Text",
                     optionD: "",
                     questionId: 453982010,
                     helpText: """
                     Path. SwiftUI предоставляет нам специальный тип Path для рисования пользовательских фигур.

                     Точно так же, как цвета, градиенты и формы, контуры сами по себе являются представлениями (view). Это означает, что мы можем использовать их точно так же, как текстовые вью (Text) и изображения (Image).
                     """),
            
            Question(question: [
                "Как называется структура, позволяющая создать цветовой градиент в SwiftUI?"
            ],
                     image: "",
                     optionA: "Gradient",
                     optionB: ".linearGradient",
                     optionC: "",
                     optionD: "",
                     questionId: 481923730,
                     helpText: """
                     Gradient. Эта структура позволяет создать цветовой градиент, представленный в виде массива цветовых точек - Gradient(colors: [Color]).
                     
                     В свою очередь linearGradient - это функция (модификатор), позволяющая создавать заливку с градиентом, используя дополнительные параметры (startPoint:, endPoint:).
                     """),
            
            Question(question: [
                "Какой модификатор позволит нам создать градиентную заливку в SwiftUI?"
            ],
                     image: "",
                     optionA: ".linearGradient",
                     optionB: ".gradient",
                     optionC: ".fill",
                     optionD: "",
                     questionId: 202976277,
                     helpText: """
                     linearGradient. linearGradient - это функция (модификатор), позволяющая создавать заливку с градиентом, используя дополнительные параметры (startPoint:, endPoint:).
                     """),
            
            Question(question: [
                "Какие параметры необходимы для создания градиентной заливки в SwiftUI с использованием модификатора .linearGradient?"
            ],
                     image: "",
                     optionA: "startPoint и endPoint",
                     optionB: "points и shape",
                     optionC: "startPoint, endPoint, shape",
                     optionD: "",
                     questionId: 595530231,
                     helpText: """
                     startPoint и endPoint. linearGradient - это функция (модификатор), позволяющая создавать заливку с градиентом, используя дополнительные параметры (startPoint:, endPoint:).
                     """),
            
            Question(question: [
                "Какой метод в SwiftUI позволяет добавить к Path последовательность соединенных прямолинейных сегментов?"
            ],
                     image: "",
                     optionA: "addLines",
                     optionB: "addRects",
                     optionC: "addPath",
                     optionD: "",
                     questionId: 622755780,
                     helpText: """
                     addLines. addLines добавляет к Path последовательность соединенных прямолинейных сегментов (прямые линии).
                     
                     В качестве входящих параметров метод принимает массив CGPoint точек, характеризующих начальную и конечную точки для прямых линий (_ lines: [CGPoint]).
                     """),
            
            Question(question: [
                "Данный метод в SwiftUI позволяет добавить к Path отрезок прямой линии из текущей точки в указанную точку"
            ],
                     image: "",
                     optionA: "addLine",
                     optionB: "addLines",
                     optionC: "addCurve",
                     optionD: "",
                     questionId: 501601837,
                     helpText: """
                     addLine. Метод addLine в Path позволяет добавлять отрезок прямой линии из текущей точки в указанную точку.
                     
                     В качестве входящего параметра этот метод принимает конечную точку для вашей прямой линии (to p: CGPoint).
                     
                     После добавления линии - конечная точка становиться последней текущей точкой / currentPoint (то есть следующая линия начнет выходить из нее).
                     """),
            
            Question(question: [
                "Какой метод в SwiftUI позволит добавить прямоугольник со скругленными углами к Path?"
            ],
                     image: "",
                     optionA: "addRoundedRect",
                     optionB: "addRect",
                     optionC: "addRelativeArc",
                     optionD: "",
                     questionId: 122340441,
                     helpText: """
                     addRoundedRect. Метод addRoundedRect добавляет прямоугольник со скругленными углами к вашему объекту Path.
                     
                     В качестве входящих параметров, данный метод принимает:
                     - Размеры и координаты (in rect: CGRect)
                     - Радиус скругления (cornerSize: CGSize)
                     - Стиль скругления (style: RoundedCornerStyle)
                     - Преобразование (transform: CGAffineTransform)
                     
                     Рисование прямоугольника начинается с перемещения пути в нижний левый угол - и далее против часовой стрелки.
                     """),
            
            Question(question: [
                "Какой метод в SwiftUI позволяет добавить к Path эллипс?"
            ],
                     image: "",
                     optionA: "addEllipse",
                     optionB: "addArc",
                     optionC: "ellipse",
                     optionD: "",
                     questionId: 821840989,
                     helpText: """
                     addEllipse. Метод addEllipse позволяет добавить к Path эллипс. Эллипс создается последовательностью кривых Безье (Bézier curves). Его центр — это середина прямоугольника, заданного параметром rect.
                     
                     Если rect - квадратный, то эллипс будет круговой с радиусом, равным половине ширины (или высоты) прямоугольника. Если параметр rect указывает прямоугольную форму, то главная и малая оси эллипса определяются шириной и высотой прямоугольника.

                     Эллипс образует полный подконтур пути, т. е. рисование эллипса начинается с операции перемещения и заканчивается операцией замыкания подконтура, при этом все движения проходят по часовой стрелке.
                     """),
            
            Question(question: [
                "Какой метод в SwiftUI позволит начать отрисовывать новый подпуть (subpath) с новой currentPoint?"
            ],
                     image: "",
                     optionA: "move",
                     optionB: "addLine",
                     optionC: "beginPath",
                     optionD: "",
                     questionId: 118990891,
                     helpText: """
                     move. В качестве входящего параметра этот метод принимает стартовую точку для вашего будущего подпути / subpath (to point: CGPoint).
                     
                     Указанная стартовая точка становится начальной точкой нового subpath, так же (currentPoint) устанавливается на эту точку, рисование последующих за этим методом объектов будет происходить из нее.
                     """),
            
            Question(question: [
                "Какой модификатор в SwiftUI позволит закрасить Shape простым цветом или градиентом?"
            ],
                     image: "",
                     optionA: ".fill",
                     optionB: ".stroke",
                     optionC: ".radialGradient",
                     optionD: "",
                     questionId: 789698273,
                     helpText: """
                     fill. Данный модификатор позволяет заливать Shape любым цветом или градиентом, принимает два параметра:
                     
                     - content, цвет или градиент, используемый при заполнении этой фигуры.
                     - style, параметры стиля, определяющие способ отображения заливки.
                     
                     Возвращает объект Shape, заполненный заданным вами цветом или градиентом.
                     """),
            
            Question(question: [
                "Геометрический угол в SwiftUI, значение которого вы получаете в радианах или градусах"
            ],
                     image: "",
                     optionA: "Angle",
                     optionB: "Shape",
                     optionC: "Path",
                     optionD: "",
                     questionId: 698674104,
                     helpText: """
                     Angle. Геометрический угол в SwiftUI, значение которого вы получаете в радианах или градусах.
                     """),
            
            Question(question: [
                "Этот модификатор View в SwiftUI позволяет повернуть изображение вокруг указанной точки"
            ],
                     image: "",
                     optionA: "rotationEffect",
                     optionB: "scaleEffect",
                     optionC: "transition",
                     optionD: "",
                     questionId: 491514774,
                     helpText: """
                     rotationEffect. Данный модификатор позволяет повернуть View вокруг якоря (anchor point). Метод принимает два входящих параметра:
                     
                     - angle: Угол, на который необходимо повернуть View.
                     - anchor: Местоположение центра вращения, вокруг которого будет осуществляться поворот на указанный угол.
                     """),
            
            Question(question: [
                "В какую сторону повернется View в SwiftUI при использовании модификатора .rotationEffect(.degrees(-90)?)"
            ],
                     image: "",
                     optionA: "Против часовой",
                     optionB: "По часовой",
                     optionC: "",
                     optionD: "",
                     questionId: 650979466,
                     helpText: """
                     Против часовой. Отрицательный градус поворачивает View против часовой стрелки.
                     """),
            
            Question(question: [
                "Как повернется View в SwiftUI при использовании модификатора .rotationEffect(.radians(.pi)?)"
            ],
                     image: "",
                     optionA: "На 180°",
                     optionB: "Влево на 90°",
                     optionC: "Вправо на 90°",
                     optionD: "Никак",
                     questionId: 195234230,
                     helpText: """
                     На 180°. Константа .pi развернет View вверх-ногами на 180 градусов.
                     """),
        ]
    }
}
