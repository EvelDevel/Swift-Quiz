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
                     links: [
                        URL(string: "https://developer.apple.com/documentation/swiftui/geometryreader")!,
                        URL(string: "https://www.hackingwithswift.com/quick-start/swiftui/how-to-provide-relative-sizes-using-geometryreader")!
                     ],
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
                     links: [
                        URL(
                            string: "https://www.hackingwithswift.com/books/ios-swiftui/creating-custom-paths-with-swiftui"
                        )!
                     ],
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
                     links: [
                        URL(
                            string: "https://sarunw.com/posts/gradient-in-swiftui"
                        )!
                     ],
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
                     links: [
                        URL(
                            string: "https://sarunw.com/posts/gradient-in-swiftui/#lineargradient"
                        )!
                     ],
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
                     links: [
                        URL(
                            string: "https://sarunw.com/posts/gradient-in-swiftui/#lineargradient"
                        )!
                     ],
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
                     links: [
                        URL(
                            string: "https://developer.apple.com/documentation/swiftui/path/addlines(_:)"
                        )!
                     ],
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
                     links: [
                        URL(
                            string: "https://www.hackingwithswift.com/books/ios-swiftui/creating-custom-paths-with-swiftui"
                        )!
                     ],
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
                     links: [
                        URL(
                            string: "https://developer.apple.com/documentation/swiftui/path/addroundedrect(in:cornersize:style:transform:)"
                        )!
                     ],
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
            
            Question(question: [
                "Этот модификатор в SwiftUI применяет выбранную анимацию к view, когда изменяется указанное значение (value)"
            ],
                     image: "",
                     optionA: ".animation",
                     optionB: ".rotate",
                     optionC: ".easeInOut",
                     optionD: "",
                     questionId: 854510570,
                     helpText: """
                     animation. Модификатор animation применяет заданную (из перечисления) анимацию к вашему view при изменении указанного значения (например: Когда изменяется флаг какой-нибудь кнопки после нажатия).
                     
                     Данный модификатор принимает два параметра: _ animation: Animation?, value: V, а возвращает какое-то абстрактное view, которое отвечает протоколу Equatable (some View where V : Equatable).
                     """),
            
            Question(question: [
                "Модификатор .animation в SwiftUI принимает именно такие входящие параметры"
            ],
                     image: "",
                     optionA: "animation, value",
                     optionB: "animation, view, value",
                     optionC: "",
                     optionD: "",
                     questionId: 554440557,
                     helpText: """
                     animation, value. Animation модификатор принимает два параметра: _ animation: Animation?, value: V, а возвращает какое-то абстрактное view, которое отвечает протоколу Equatable (some View where V : Equatable).
                     """),
            
            Question(question: [
                "Что возвращает модификатор .animation в SwiftUI?"
            ],
                     image: "",
                     optionA: "-> some View",
                     optionB: "-> Bool",
                     optionC: "-> Animation?",
                     optionD: "",
                     questionId: 955935092,
                     helpText: """
                     -> some View. Animation модификатор принимает два параметра: _ animation: Animation?, value: V, а возвращает какое-то абстрактное view, которое отвечает протоколу Equatable (some View where V : Equatable).
                     """),
            
            Question(question: [
                "Какой модификатор SwiftUI мы будем использовать, если необходимо добавить анимацию для view, которая сработает сразу после изменения выбранного значения в коде?"
            ],
                     image: "",
                     optionA: ".animation",
                     optionB: ".rotationEffect",
                     optionC: "",
                     optionD: "",
                     questionId: 119460518,
                     helpText: """
                     animation. Модификатор .animation применяется, когда нам необходимо воспроизвести заданную (из перечисления) анимацию (animation: Animation?), при изменении указанного value (например: Когда изменяется булевый флаг нажатия кнопки).
                     """),
            
            Question(question: [
                "Какой модификатор SwiftUI позволяет создать переход (transition), у которого будут разные появление на экране (insertion) и удаление с экрана (removal)?"
            ],
                     image: "",
                     optionA: ".asymmetric",
                     optionB: ".transition",
                     optionC: ".insertion",
                     optionD: "",
                     questionId: 987774923,
                     helpText: """
                     asymmetric. Данный модификатор позволяет создавать составные переходы (composite transitions), которые будут использовать разные эффекты для появления view на экране (transition), и для удаления его с экрана (removal).
                     
                     Данный модификатор принимает два входящих параметра:
                     - insertion: AnyTransition
                     - removal: AnyTransition
                     """),
            
            Question(question: [
                "Что вернет модификатор .asymmetric в SwiftUI?"
            ],
                     image: "",
                     optionA: "AnyTransition",
                     optionB: "AnyAnimation",
                     optionC: "ContentTransition",
                     optionD: "",
                     questionId: 987774923,
                     helpText: """
                     AnyTransition. Модификатор .asymmetric позволяет создавать составные переходы (composite transitions), которые будут использовать разные эффекты для появления view на экране (transition), и для удаления его с экрана (removal).
                     
                     Данный модификатор возвращает значение AnyTransition.
                     """),
            
            Question(question: [
                "Какой тип в SwiftUI передает в замыкании GraphicsContext и CGSize для отрисовки 2D графики?"
            ],
                     image: "",
                     optionA: "Canvas",
                     optionB: "Gradient",
                     optionC: "Path",
                     optionD: "",
                     questionId: 810341480,
                     helpText: """
                     Canvas. Используйте Canvas, чтобы отрисовать 2д графику внутри SwiftUI view.
                     
                     Canvas передает внутрь замыкания context (GraphicsContext), чтобы вы могли использовать все операции по отрисовке (immediate mode drawing operations). Так же Canvas передает size (CGSize), который вы также можете использовать для кастомизации того, что вы отрисовываете.
                     
                     Например: вы можете использовать у context команду stroke(_:with:lineWidth:), чтобы отрисовать Path(ellipseIn: CGRect(origin: .zero, size: size)).
                     """),
        ]
    }
}
