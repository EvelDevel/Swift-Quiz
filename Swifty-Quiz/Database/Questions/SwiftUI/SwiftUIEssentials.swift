//
//  SwiftUIEssentials.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 14.08.2022.
//  Copyright © 2022 Evel-Devel. All rights reserved.
//

import Foundation

final class SwiftUIEssentials {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "Какому протоколу соответствует основная структура проекта, используещего SwiftUI Lifecycle?",
                "Когда приложение использует жизненный цикл SwiftUI, основная структура, отвечающая за отображение контента, соответствует этому протоколу"
            ],
                     image: "",
                     optionA: "App",
                     optionB: "AnyObject",
                     optionC: "UIApplicationDelegate",
                     optionD: "",
                     id: 948115569,
                     links: [
                        "https://developer.apple.com/documentation/swiftui/app",
                        "https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-an-appdelegate-to-a-swiftui-app"
                     ],
                     helpText: """
                     App. Приложение, использующее жизненный цикл SwiftUI, имеет структуру (struct), соответствующую протоколу App, у которой имя соответствует имени вашего приложения (с добавкой App).
                     
                     Эта структура является сценой, которая отвечает за отображение контента нашего приложения.
                     
                     AnyObject - является typealias, а UIApplicationDelegate - публичным протоколом, который используется в AppDelegate в приложениях, использующих Storyboard.
                     """),
            
            Question(question: [
                "Какой атрибут структуры определяет точку входа в приложение, использующее SwiftUI Lifecycle?",
                "При использовании жизненного цикла SwiftUI, этот атрибут структуры будет определять точку входа в приложение"
            ],
                     image: "",
                     optionA: "@main",
                     optionB: "@initial",
                     optionC: "@entry",
                     optionD: "",
                     id: 197451092,
                     links: [
                        "https://developer.apple.com/documentation/swiftui/app/main()",
                        "https://medium.com/@abedalkareemomreyh/what-is-main-in-swift-bc79fbee741c"
                     ],
                     helpText: """
                     @main. Атрибут @main определяет точку входа приложения, использующее жизненный цикл SwiftUI.
                     """),
            
            Question(question: [
                "При использовании SwiftUI Lifecycle - какое свойство структуры возвращает одну или несколько сцен с содержимым для отображения?"
            ],
                     image: "",
                     optionA: "body",
                     optionB: "main",
                     optionC: "content",
                     optionD: "",
                     id: 599468478,
                     links: [
                        "https://developer.apple.com/documentation/swiftui/view/body-swift.property",
                        "https://developer.apple.com/documentation/swiftui/view/body-swift.associatedtype"
                     ],
                     helpText: """
                     body. Свойство структуры body - возвращает одну или несколько сцен, которые, в свою очередь, предоставляют содержимое для отображения.
                     
                     @main
                     struct LandmarksApp: App {
                         var body: some Scene {
                             WindowGroup {
                                 ContentView()
                             }
                         }
                     }
                     """),
            
            Question(question: [
                "Какие дефолтные структуры объявлены в ContentView при использовании SwiftUI?"
            ],
                     image: "",
                     optionA: """
                     ContentView
                     ContentView_Previews
                     """,
                     optionB: """
                     ContentView
                     """,
                     optionC: "Никакие",
                     optionD: "",
                     id: 130890925,
                     links: [
                        "https://developer.apple.com/tutorials/swiftui-concepts/exploring-the-structure-of-a-swiftui-app",
                        "https://www.hackingwithswift.com/books/ios-swiftui/understanding-the-basic-structure-of-a-swiftui-app",
                        "https://habr.com/ru/post/471918/"
                     ],
                     helpText: """
                     ContentView, ContentView_Previews. По умолчанию, файл ContentView у SwiftUI приложений имеет две структуры. Первая структура соответствует протоколу View и описывает содержимое и макет. Вторая структура объявляет предварительный просмотр.
                     
                     struct ContentView: View {
                         var body: some View {
                            //
                         }
                     }

                     struct ContentView_Previews: PreviewProvider {
                         static var previews: some View {
                             ContentView()
                         }
                     }
                     """),
            
            Question(question: [
                "Какому протоколу соответствует дефолтная структура ContentView, отвечающая за содержимое и макет в приложениях со SwiftUI?"
            ],
                     image: "",
                     optionA: "Veiw",
                     optionB: "App",
                     optionC: "UIView",
                     optionD: "PreviewProvider",
                     id: 245983055,
                     links: [
                        "https://developer.apple.com/documentation/swiftui/view",
                        "https://www.kodeco.com/28684524-swiftui-fundamentals/lessons/2"
                     ],
                     helpText: """
                     Veiw. Структура ContentView соответствует публичному протоколу View, и описывает содержимое и макет.
                     """),
            
            Question(question: [
                "Какому протоколу соответствует дефолтная структура ContentView_Previews, отвечающая за предварительный просмотр в SwiftUI?"
            ],
                     image: "",
                     optionA: "PreviewProvider",
                     optionB: "Veiw",
                     optionC: "App",
                     optionD: "",
                     id: 455895047,
                     links: [
                        "https://developer.apple.com/documentation/swiftui/previewprovider",
                        "https://betterprogramming.pub/swiftui-preview-provider-for-uikit-3dd089d77915",
                        "https://apptractor.ru/info/articles/ispolzuem-swiftui-previewprovider-dlya-predstavleniy-uikit.html"
                     ],
                     helpText: """
                     PreviewProvider. PreviewProvider — это тип протокола, который создает предварительный просмотр представления (view) в Xcode (окно предпросмотра в правой части программы).
                     
                     Он содержит переменную previews, которая имеет тип some View. View — это представление SwiftUI, которое мы вернем для отображения в PreviewProvider.
                     """),
            
            Question(question: [
                "Какое название носит кнопка в xcode, позволяющая запустить предварительный просмотре вашего макета в приложениях со SwiftUI?"
            ],
                     image: "",
                     optionA: "Resume",
                     optionB: "Restart",
                     optionC: "Refresh",
                     optionD: "Continue",
                     id: 125545712,
                     helpText: """
                     Resume. На холсте (canvas) нажмите Resume («Возобновить»), чтобы отобразить предварительный просмотр.
                     
                     Если холст (canvas) не отображается, выберите «Редактор» > «Холст» (Editor -> Canvas), чтобы отобразить его.
                     """),
            
            Question(question: [
                "Какую клавишу необходимо удерживать при клике, чтобы показать это окно?"
            ],
                     image: "SwiftUIEssentials01",
                     optionA: "Cmd",
                     optionB: "Ctrl",
                     optionC: "Option",
                     optionD: "Fn",
                     id: 317756604,
                     helpText: """
                     Cmd. В предварительном просмотре щелкните на лейбл, удерживая клавишу Command, чтобы открыть всплывающее окно структурированного редактирования.
                     """),
            
            Question(question: [
                "Как называются методы в SwiftUI, изменяющие внешний вид view (например: .font)?"
            ],
                     image: "SwiftUIEssentials02",
                     optionA: "Модификаторы",
                     optionB: "Кастомайзеры",
                     optionC: "Визуальные параметры",
                     optionD: "",
                     id: 504358274,
                     links: [
                        "https://developer.apple.com/documentation/swiftui/viewmodifier",
                        "https://www.kodeco.com/34699757-swiftui-view-modifiers-tutorial-for-ios",
                        "https://www.hackingwithswift.com/books/ios-swiftui/custom-modifiers"
                     ],
                     helpText: """
                     Модификаторы. Чтобы настроить вью в SwiftUI, вы вызываете методы, называемые модификаторами (modifiers).
                     
                     Модификаторы (built-in modifiers) оборачивают вью, чтобы изменить его отображение или другие свойства.
                     
                     Каждый модификатор (modifier) возвращает новое вью, поэтому принято объединять несколько модификаторов в цепочку, располагая их вертикально. Например:
                     
                     content
                        .font(.title2)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 8)
                        .foregroundColor(Color.pink)
                     """),
            
            Question(question: [
                "Если вы поменяли модификаторы (modifiers) через SwiftUI Inspector, что произойдет с этими модификаторами в коде?"
            ],
                     image: "",
                     optionA: "Они обновятся",
                     optionB: "Модификаторы не изменятся",
                     optionC: "Получим ошибку",
                     optionD: "",
                     id: 532082683,
                     helpText: """
                     Они обновятся. Ваш код всегда является "источником правды" (the source of truth) для вашего view.
                     
                     Когда вы используете SwiftUI Inspector для изменения или удаления модификатора (modifier), Xcode немедленно обновляет ваш код, чтобы он соответствовал этим изменениям.
                     """),
            
            Question(question: [
                "Как добавить в SwiftUI разделитель, расширяющийся вдоль главной оси стека, или по обеим осям, если он не содержится в стеке?",
                "Как добавить в SwiftUI код адаптивное вью без содержимого, которое расширяется настолько, насколько это возможно?"
            ],
                     image: "",
                     optionA: "Spacer()",
                     optionB: ".padding",
                     optionC: "Hstack { // }",
                     optionD: "Divider()",
                     id: 103867572,
                     links: [
                        "https://developer.apple.com/documentation/swiftui/spacer",
                        "https://www.hackingwithswift.com/quick-start/swiftui/how-to-make-a-fixed-size-spacer",
                        "https://www.hackingwithswift.com/quick-start/swiftui/how-to-force-views-to-one-side-inside-a-stack-using-spacer"
                     ],
                     helpText: """
                     Spacer(). Разделитель (Spacer) - это гибкое пространство, расширяющееся вдоль главной оси стека, или по обеим осям, если оно не содержится в стеке.

                     Разделитель (Spacer) - создает адаптивное вью без содержимого, которое расширяется настолько, насколько это возможно.
                     
                     Например, при размещении в HStack разделитель расширяется по горизонтали настолько, насколько позволяет стек, перемещая все соседние view в стороны, в пределах его размера.
                     """),
            
            Question(question: [
                "Spacer() в SwiftUI занимает все доступное пространство родительского вью. Так ли это?",
                "Spacer() в SwiftUI не определяет свой размер своим содержимым. Это правда?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 851046140,
                     links: [
                        "https://developer.apple.com/documentation/swiftui/spacer"
                     ],
                     helpText: """
                     Да. Разделитель (Spacer) расширяется, занимая все доступное пространство своего родительского view, вместо того, чтобы определять размер своим содержимым (то есть размер разделителя не определяется размером его контента).
                     """),
            
            Question(question: [
                "Являются ли модификаторы .padding(16) и .padding() в SwiftUI эквивалентными (для iOS)?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "Только в некоторых view",
                     optionD: "",
                     id: 732147881,
                     links: [
                        "https://developer.apple.com/documentation/charts/chart/padding(_:_:)"
                     ],
                     helpText: """
                     Да. Модификатор .padding() добавляет внутренние отступы во view.
                     
                     Если не указывать значение в поинтах (points) для параметра length внутри круглых скобок, SwiftUI использует значение по умолчанию для конкретной платформы.
                     
                     Для iOS это 16 pt.
                     """),
            
            Question(question: [
                "Для создания кастомных view на SwiftUI - необходимо создавать новые файлы View.xib. Так ли это?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 468682159,
                     helpText: """
                     Нет. Когда вы используете SwiftUI, вы создаете файлы для кастомных view через сочетание клавиш Cmd+N -> шаблон “SwiftUI View” -> Next -> Введите имя шаблона -> Create.
                     
                     При этом вы никогда не используете файл View.xib.
                     """),
            
            Question(question: [
                "С помощью какого типа в SwiftUI можно добавить изображение на экран?"
            ],
                     image: "",
                     optionA: "Image(_:)",
                     optionB: "AddImage(_:)",
                     optionC: "InsertImage(_:)",
                     optionD: "",
                     id: 339501840,
                     links: [
                        "https://developer.apple.com/documentation/swiftui/image",
                        "https://codewithchris.com/swiftui/swiftui-image/",
                        "https://www.hackingwithswift.com/quick-start/swiftui/how-to-draw-images-using-image-views"
                     ],
                     helpText: """
                     Image(_:). Image - это view, которое показывает изображения. Используйте структуру Image, если вы хотите добавить изображения в свое приложение на SwiftUI.
                     """),
            
            Question(question: [
                "Какой тип нам нужно добавить в модификатор .clipShape() в SwiftUI, чтобы получить круглое view (с равными сторонами 1:1)?"
            ],
                     image: "",
                     optionA: "Circle()",
                     optionB: "Capsule()",
                     optionC: "Rectangle()",
                     optionD: "",
                     id: 780349105,
                     links: [
                        "https://developer.apple.com/documentation/swiftui/circle",
                        "https://www.hackingwithswift.com/quick-start/swiftui/swiftuis-built-in-shapes",
                        "https://www.hackingwithswift.com/quick-start/swiftui/how-to-display-solid-shapes"
                     ],
                     helpText: """
                     clipShape(Circle()). В SwiftUI для создания круглого изображения можно использовать несколько встроенных форм (SwiftUI’s built-in shapes):
                     
                     - Circle() - нарисует круг, где высота и ширина будут равны, при этом, даже если мы отдадим туда изображение 100х50, мы получим 50х50.
                     
                     - Capsule() - нарисует прямоугольник, где стороны фигуры закругляются по одной из ее бОльших осей, ширина или высота (круг можно создать, если использовать квадратное изображение с равными сторонами).
                     
                     Если создать изображение 100x50 - оно будет закругляться только слева и справа (так как ширина больше), а снизу и сверху будут прямые грани.
                     """),
            
            Question(question: [
                "Какую форму нам нужно добавить в модификатор .clipShape() в SwiftUI, чтобы получить прямоугольник, у которого только грани одной из сторон (бОльшей) будут скругляться?"
            ],
                     image: "",
                     optionA: "Capsule()",
                     optionB: "Rectangle()",
                     optionC: "Circle()",
                     optionD: "Ellipse()",
                     id: 105541431,
                     links: [
                        "https://developer.apple.com/documentation/swiftui/capsule",
                        "https://www.hackingwithswift.com/quick-start/swiftui/swiftuis-built-in-shapes"
                     ],
                     helpText: """
                     Capsule(). Данный нативная геометрическая форма (SwiftUI’s built-in shapes) нарисует прямоугольник, где стороны фигуры закругляются по одной из ее бОльших осей, ширина или высота (круг можно создать, если использовать квадратное изображение с равными сторонами).
                     
                     Если создать изображение 100x50 - оно будет закругляться только слева и справа (так как ширина больше), а снизу и сверху будут прямые грани.
                     """),
            
            Question(question: [
                "Если в SwiftUI изображению 50х50 добавить модификатор с такими параметрами: .clipShape(RoundedRectangle(cornerRadius: 100)), что произойдет с изображением?"
            ],
                     image: "",
                     optionA: "Получим ровный круг",
                     optionB: "Изображение исчезнет",
                     optionC: "Останется квадратным",
                     optionD: "",
                     id: 466191839,
                     helpText: """
                     Получим ровный круг. В отличии от UIKit, какое-бы значение CornerRadius мы не присваивали view в SwiftUI - максимальное скругление произойдет до состояния "ровный круг". Дальше скругление применяться не будет.
                     
                     В UIKit, если вы делаете скругление больше высоты или ширины - изображение начинает принимать неправильную форму трапеции.
                     """),
            
            Question(question: [
                "Если вместе со SwiftUI вы импортируете другие фреймворки, вы получаете доступ к специфичному функционалу этих фреймворков для SwiftUI. Это правда?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 994474814,
                     helpText: """
                     Да. Когда вы импортируете SwiftUI и некоторые другие фреймворки (например: MapKit) в один и тот же файл, вы получаете доступ к специфичным для SwiftUI функциям, предоставляемым этим фреймворком.
                     """),
            
            Question(question: [
                "Атрибут (обертка) в SwiftUI, которая позволяет создать свойство хранения каких-либо данных, отвечающих за состояние вью (например: координаты точки на карте)"
            ],
                     image: "",
                     optionA: "@State",
                     optionB: "@Binding",
                     optionC: "@ObservedObject",
                     optionD: "@Environment",
                     id: 393824711,
                     links: [
                        "https://developer.apple.com/documentation/swiftui/state",
                        "https://habr.com/ru/company/otus/blog/475078/",
                        "https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-state-property-wrapper"
                     ],
                     helpText: """
                     @State. @State — это атрибут (обертка), который мы можем использовать для свойств, которые обозначают состояния View. SwiftUI будет хранить значение с этим атрибутом в специальной внутренней памяти вне структуры View.
                     
                     Вы используете атрибут @State, чтобы установить "источник правды" для данных в вашем приложении, который вы можете изменять из более чем одного View.
                     
                     Как только значение свойства @State меняется, SwiftUI перестраивает View для учета изменений состояния и его корректного отображения.
                     """),
            
            Question(question: [
                "Что произойдет с шириной View в SwiftUI, если мы зададим ей frame, указывая только значения высоты. Например: .frame(height: 300)?"
            ],
                     image: "",
                     optionA: "Примет ширину контента",
                     optionB: "Займет половину экрана",
                     optionC: "Останется неизменной",
                     optionD: "",
                     id: 287003972,
                     links: [
                        "https://developer.apple.com/documentation/swiftui/view/frame(width:height:alignment:)"
                     ],
                     helpText: """
                     Примет ширину контента. Когда вы указываете только параметр высоты для модификатора .frame, View автоматически изменяется по ширине его содержимого (контента).
                     
                     Если ширина контента (например это MapView) выше, чем ширина экрана - View займет всю доступную ширину.
                     """),
            
            Question(question: [
                "Выберите модификатор, который сместит наше View на 100 pt вверх по оси Y"
            ],
                     image: "",
                     optionA: ".offset(y: -100)",
                     optionB: ".offset(y: 100)",
                     optionC: ".offset(x: -100)",
                     optionD: "",
                     id: 511384010,
                     links: [
                        "https://developer.apple.com/documentation/swiftui/view/offset(x:y:)"
                     ],
                     helpText: """
                     offset(y: -100). Данный модификатор позволяет нам изменять положение View по оси Y.
                     
                     Смещение на отрицательное значение будет смещать View наверх, и наоборот, положительное значение будет смещать его вниз.
                     """),
            
            Question(question: [
                "Какой модификатор из SwiftUI позволит вашему View не обращать внимания на ограничения safe area?"
            ],
                     image: "",
                     optionA: ".ignoresSafeArea",
                     optionB: ".removeSafeArea",
                     optionC: ".deleteSafeArea",
                     optionD: "",
                     id: 623943874,
                     links: [
                        "https://developer.apple.com/documentation/swiftui/grid/ignoressafearea(_:edges:)"
                     ],
                     helpText: """
                     ignoresSafeArea. Этот модификаторв в SwiftUI позволяет расширить границы view за пределы своей безопасной зоны (safe area).
                     
                     Данный модификатор имеет параметр edges, который позволяет указывать определенные стороны, которые должны выходить за предела safeArea, остальные, не указанные стороны - останутся неизменными (внутри safe area).
                     """),
            
            Question(question: [
                "Каким образом вы можете добавить разделитель на экран (полоса 1 px высотой) в SwiftUI?"
            ],
                     image: "",
                     optionA: "Divider()",
                     optionB: "Spacer()",
                     optionC: "frame(0, 1, 0)",
                     optionD: "",
                     id: 478944843,
                     links: [
                        "https://developer.apple.com/documentation/swiftui/divider"
                     ],
                     helpText: """
                     Divider(). Разделитель (Divider) - это визуальный элемент, который можно использовать для визуального разделения одного контента от другого.
                     """),
            
            Question(question: [
                "Можете ли вы применить модификатор .font() к стек-вью в SwiftUI, чтобы он подействовал на все текстовые лейблы внутри стека?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 761758842,
                     helpText: """
                     Да. Когда вы применяете модификатор, например, к стеку (VStack, HStack), SwiftUI применяет модификатор ко всем элементам, содержащимся в группе (модификаторы распространяют свое действие на вложенные объекты).
                     """),
            
            Question(question: [
                "Позволяет ли модификатор .ignoresSafeArea (SwiftUI) выбирать, какие именно стороны вашего вью могут выходить за пределы безопасной зоны (safe area)?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 195416164,
                     links: [
                        "https://developer.apple.com/documentation/swiftui/grid/ignoressafearea(_:edges:)"
                     ],
                     helpText: """
                     Да. Данный модификатор имеет параметр edges, который позволяет указывать определенные стороны, которые должны выходить за предела safeArea, остальные, не указанные стороны - останутся неизменными (внутри safe area).
                     
                     Перечисление edges содержит следующие параметры: .top, .bottom, .leading, .trailing, .all, .vertical, .horizontal.
                     """),
            
            Question(question: [
                "Когда вы создаете кастомное SwiftUI View, где необходимо создавать его макет (layout)?"
            ],
                     image: "",
                     optionA: "Внутри свойства body",
                     optionB: "В инициализаторе view",
                     optionC: "В методе layoutSubviews()",
                     optionD: "",
                     id: 554041601,
                     helpText: """
                     Внутри свойства body. Пользовательские view обязательно реализуют внутри себя свойство body, которое является требованием публичного протокола View. Внутри body мы размещаем весь layout нашего кастомного вью.
                     """),
            
            Question(question: [
                "Какой модификатор в SwiftUI может переопределить размер контейнера для предпросмотра (canvas)?"
            ],
                     image: "",
                     optionA: ".previewLayout()",
                     optionB: ".previewDevice()",
                     optionC: ".compositioningGroup()",
                     optionD: "",
                     id: 817702693,
                     helpText: """
                     previewLayout(). Данный модификатор переопределяет размер контейнера для предварительного просмотра (canvas).
                     
                     По умолчанию предварительный просмотр использует макет «PreviewLayout/device», который помещает интерфейс в выбранное "устройство" (например: iPhone 12 mini).
                     
                     Вместо этого вы можете указать предварительному просмотру использовать другие значения: sizeThatFits  или fixed.
                     """),
            
            Question(question: [
                "С помощью какого типа в SwiftUI можно объединить несколько разных content type вместе, не влияя при этом на их макеты (layout)?"
            ],
                     image: "",
                     optionA: "Group",
                     optionB: "VStack",
                     optionC: "GridItem",
                     optionD: "Section",
                     id: 225908548,
                     helpText: """
                     Group. Group является типом, который может собирать несколько экземпляров content type — например, View, Scene или Commands в единый модуль.
                     
                     Используйте группу (Group), чтобы объединить несколько View в один экземпляр, без влияния на их макеты (layout), в отличие от SwiftUI/HStack, SwiftUI/VStack или SwiftUI/Section, использование которых - повлечет за собой непосредственные изменения (расположение элементов, отступы, и т.д).
                     
                     После создания группы - любой модификатор, который вы применяете к ней, повлияет на всех членов этой группы. Например:
                     
                     Group {
                         Text("SwiftUI")
                         Text("Combine")
                         Text("Swift System")
                     }
                     .font(.headline)
                     """),
            
            Question(question: [
                "Если в SwiftUI применить модификатор к типу Group, он применится ко всем членам этой группы. Так ли это?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 544449077,
                     helpText: """
                     Да. После создания группы - любой модификатор, который вы применяете к ней, повлияет на всех членов этой группы. Например:
                     
                     Group {
                         Text("SwiftUI")
                         Text("Combine")
                         Text("Swift System")
                     }
                     .font(.headline)
                     """),
            
            Question(question: [
                "Можете ли вы объединить типы Scene, View и ToolbarContent в тип Group в SwiftUI?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 853685500,
                     helpText: """
                     Вы можете инициализировать группы (Group) в SwiftUI с несколькими разными типами, а не только с SwiftUI/View. Вы можете использовать, например SwiftUI/Scene и SwiftUI/ToolbarContent.
                     """),
            
            Question(question: [
                "Если в SwiftUI объединить 2 объекта внутри типа Group, сколько окон предварительного просмотра вы увидите на холсте (canvas)?"
            ],
                     image: "",
                     optionA: "2",
                     optionB: "1",
                     optionC: "3",
                     optionD: "",
                     id: 493190017,
                     helpText: """
                     2. Группа (Group) — это контейнер для группировки разных типов View. Xcode отображает дочерние view группы как отдельные окна предварительного просмотра на холсте (canvas).
                     
                     Если ваша группа содержит два элемента - вы увидите два отдельных окна предварительного просмотра. Пример:
                     
                     Group {
                         SomeView()
                             .previewLayout(.sizeThatFits)
                         SomeView()
                             .previewLayout(.sizeThatFits)
                     }
                     """),
            
            Question(question: [
                "Применится ли SwiftUI модификатор .foregroundColor к данному тексту?"
            ],
                     image: "SwiftUIEssentials03",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     id: 762898627,
                     helpText: """
                     Нет. Из-за того, что наш текст оканчивается на .com - он будет определяться как гиперссылка и будет покрашен в нативный синий цвет ссылок. Модификатор foregroundColor не применится.
                     
                     Чтобы данный модификатор применялся к подобным текстам - нам необходимо поставить перед текстом ключевое слово verbatim с последующим двоеточием.
                     
                     Text(verbatim: "test@swifty.com")
                        .foregroundColor(.green)
                     """),
            
            Question(question: [
                "Применится ли SwiftUI модификатор .foregroundColor к данному тексту?"
            ],
                     image: "SwiftUIEssentials04",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 831791923,
                     helpText: """
                     Да. Из-за того, что наш текст оканчивается на .com - он определяется как гиперссылка, а модификатор foregroundColor не применяется к гиперссылкам.
                     
                     Но поскольку мы поставили перед текстом ключевое слово verbatim с последующим двоеточием - SwiftUI проигнорирует вложенную гиперссылку и обработает ее как текст.
                     """),
            
            Question(question: [
                "Контейнер, который служит для отражения на экране всех элементов переданной коллекции",
                "Этот контейнер возвращает одну единственную View, созданную на базе элементов переданной коллекции",
                "Контейнер, в который передается коллекция, и инструкция — как отразить элементы коллекции на экране"
            ],
                     image: "",
                     optionA: "ForEach",
                     optionB: "List",
                     optionC: "forEach",
                     optionD: "",
                     id: 480031551,
                     helpText: """
                     ForEach. ForEach - это контейнер, который служит для отражения на экране всех элементов переданной коллекции.
                     
                     В первую очередь, нужно понять, что это не то же самое что для какой-то коллекции вызвать forEach. ForEach возвращает одну единственную View, созданную на базе элементов переданной коллекции. Т.е. это просто очередной контейнер, в который передается коллекция, и инструкция — как отразить элементы коллекции на экране.
                     
                     Кроме того, ForEach должен быть помещен внутрь какого-то другого контейнера, который уже определит, как именно сгруппировать эту множественную сущность — расположив по вертикали, по горизонтали, или, например, поместив в список (List).
                     """),
            
            Question(question: [
                "ForEach должен быть помещен внутрь какого-то другого контейнера для корректного размещения элементов. Так ли это?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     id: 299229048,
                     helpText: """
                     Да. ForEach должен быть помещен внутрь какого-то другого контейнера, который определяет, как именно сгруппировать эту множественную сущность — расположив по вертикали, по горизонтали, или, например, поместив в список (List).
                     """),
            
            Question(question: [
                "Какие параметры принимает контейнер ForEach?"
            ],
                     image: "",
                     optionA: "data, id, content",
                     optionB: "data, id",
                     optionC: "data, content",
                     optionD: "",
                     id: 293733345,
                     helpText: """
                     data, id, content.
                     
                     ForEach принимает три параметра:
                     - коллекцию (data: RandomAccesCollection)
                     - адрес идентификатора элемента коллекции (id: Hashable)
                     - и контент (content: () -> Content).
                     
                     Как любой другой контейнер, ForEach принимает Content — т.е. замыкание. Но в отличие от обычных контейнеров, где content не содержит параметров, ForEach передает в замыкание элемент коллекции, который можно использовать при описании контента.
                     """),
            
            Question(question: [
                "Для контейнера ForEach подойдет любая коллекция. Так ли это?"
            ],
                     image: "",
                     optionA: "Нет, только RandomAccesCollection",
                     optionB: "Да, любая",
                     optionC: "",
                     optionD: "",
                     id: 227977871,
                     helpText: """
                     Нет, только RandomAccesCollection.
                     
                     Коллекция для ForEach подойдет не любая, а только RandomAccesCollection. Для различных неупорядоченных коллекций достаточно вызвать метод sorted(by:), с помощью которого можно получить RandomAccesCollection и использовать ее.
                     """),
            
            Question(question: [
                "Какой модификатор может пересчитать размер изображения, чтобы оно корректно заняло доступное пространство?"
            ],
                     image: "",
                     optionA: ".resizable()",
                     optionB: ".stretch()",
                     optionC: ".image()",
                     optionD: "",
                     id: 533354967,
                     helpText: """
                     resizable().
                     
                     Этот модификатор устанавливает для image режим, с помощью которого SwiftUI изменяет размер изображения, чтобы оно соответствовало его пространству.
                     
                     Модификатор принимает два параметра - capInsets и resizingMode.
                     """),
            
            Question(question: [
                "Увидим ли мы в предпросмотре текст \"Add to Favorite\"?"
            ],
                     image: "SwiftUIEssentials05",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "Только на девайсе",
                     optionD: "",
                     id: 404108238,
                     helpText: """
                     Нет. Текст, который вы указываете для Button - не будет отображаться в пользовательском интерфейсе при использовании стиля .iconOnly.
                     
                     При этом VoiceOver будет использовать его для улучшения специальных возможностей и доступности, так что добавлять их желательно.
                     """),
            
            Question(question: [
                "Максимальное количество дочерних элементов, которые можно поместить внутрь Form без группирования (SwiftUI)?",
                "Максимальное количество дочерних элементов, которые можно поместить внутрь HStack без группирования (SwiftUI)?",
                "Максимальное количество дочерних элементов, которые можно поместить внутрь VStack без группирования (SwiftUI)?"
            ],
                     image: "",
                     optionA: "10",
                     optionB: "15",
                     optionC: "4",
                     optionD: "1",
                     id: 820959610,
                     links: [
                        "https://www.hackingwithswift.com/books/ios-swiftui/creating-a-form",
                        "https://www.hackingwithswift.com/books/ios-swiftui/using-stacks-to-arrange-views"
                     ],
                     helpText: """
                     10. Внутрь структуры Form, или любой другой структуры (например VStack, HStack, ZStack), можно размещать до 10 отдельных объектов (включительно), при попытке разместить 11 элементов - икскод выдаст ошибку компиляции.
                     
                     В SwiftUI есть негласное, номинальное ограничение в 10 элементов. Чтобы исправить - поместите объекты внутрь Group или Section.
                     """
                    ),
            
            Question(question: [
                "Какой текст будет самым верхним на экране (SwiftUI)?"
            ],
                     image: "SwiftUIEssentials06",
                     optionA: "first",
                     optionB: "second",
                     optionC: "last",
                     optionD: "",
                     id: 495131401,
                     links: [
                        "https://www.hackingwithswift.com/books/ios-swiftui/using-stacks-to-arrange-views"
                     ],
                     helpText: """
                     first. Элементы внутри ZStack располагаются друг над другом, и отрисовываются по порядку, с первого до последнего.
                     
                     Последним элементом в нашем случае будет отрисовываться Text("first") - то есть он будет самым верхним.
                     """
                    ),
        ]
    }
}
