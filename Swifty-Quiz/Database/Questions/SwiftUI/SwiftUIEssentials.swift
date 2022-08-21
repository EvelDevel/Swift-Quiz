//
//  SwiftUIEssentials.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 14.08.2022.
//  Copyright © 2022 Evel-Devel. All rights reserved.
//

import Foundation

class SwiftUIEssentials {
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
                     questionId: 948115569,
                     helpText: """
                     App. Приложение, использующее жизненный цикл SwiftUI, имеет структуру (struct), соответствующую протоколу App, у которой имя соответствует имени вашего приложения (и App на конце). Эта структура является сценой, которая отвечает за отображение контента нашего приложения.
                     
                     AnyObject - является typealias а UIApplicationDelegate - публичным протоколом, который используется в AppDelegate в приложениях, использующих Storyboard.
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
                     questionId: 197451092,
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
                     questionId: 599468478,
                     helpText: """
                     body. Свойство структуры body - возвращает одну или несколько сцен, которые, в свою очередь, предоставляют содержимое для отображения.
                     
                     --
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
                     questionId: 130890925,
                     helpText: """
                     ContentView, ContentView_Previews. По умолчанию, файл ContentView у SwiftUI приложений имеет две структуры. Первая структура соответствует протоколу View и описывает содержимое и макет. Вторая структура объявляет предварительный просмотр.
                     
                     --
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
                     questionId: 245983055,
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
                     questionId: 455895047,
                     helpText: """
                     PreviewProvider. Cтруктура ContentView_Previews объявляет предварительный просмотр и соответствует публичному протоколу PreviewProvider.
                     """),
            
            Question(question: [
                "Какое название носит кнопка в xcode, позволяющая запустить предварительный просмотре вашего макета в приложениях со SwiftUI?"
            ],
                     image: "",
                     optionA: "Resume",
                     optionB: "Restart",
                     optionC: "Refresh",
                     optionD: "Continue",
                     questionId: 125545712,
                     helpText: """
                     Resume. На холсте (canvas) нажмите Resume («Возобновить»), чтобы отобразить предварительный просмотр. Если холст (canvas) не отображается, выберите «Редактор» > «Холст» (Editor -> Canvas), чтобы отобразить его.
                     """),
            
            Question(question: [
                "Какую клавишу необходимо удерживать при клике, чтобы показать это окно?"
            ],
                     image: "SwiftUIEssentials01",
                     optionA: "Cmd",
                     optionB: "Ctrl",
                     optionC: "Option",
                     optionD: "Fn",
                     questionId: 317756604,
                     helpText: """
                     Cmd. В предварительном просмотре щелкните на лейбл, удерживая клавишу Command, чтобы открыть всплывающее окно структурированного редактирования.
                     """),
            
            Question(question: [
                "Как называются методы, изменяющие внешний вид view (например: .font)?"
            ],
                     image: "SwiftUIEssentials02",
                     optionA: "Модификаторы",
                     optionB: "Кастомайзеры",
                     optionC: "Визуальные параметры",
                     optionD: "",
                     questionId: 504358274,
                     helpText: """
                     Модификаторы. Чтобы настроить вью в SwiftUI, вы вызываете методы, называемые модификаторами.
                     
                     Модификаторы оборачивают вью, чтобы изменить его отображение или другие свойства. Каждый модификатор возвращает новое вью, поэтому принято объединять несколько модификаторов в цепочку, располагая их вертикально.
                     """),
            
            Question(question: [
                "Если вы поменяли модификаторы view через SwiftUI Inspector, что произойдет с этими модификаторами в коде?"
            ],
                     image: "",
                     optionA: "Они обновятся",
                     optionB: "Модификаторы не изменятся",
                     optionC: "Получим ошибку",
                     optionD: "",
                     questionId: 532082683,
                     helpText: """
                     Они обновятся. Ваш код всегда является "источником правды" (the source of truth) для вашего view.
                     
                     Когда вы используете SwiftUI Inspector для изменения или удаления модификатора, Xcode немедленно обновляет ваш код, чтобы он соответствовал этим изменениям.
                     """),
            
            Question(question: [
                "Как добавить в SwiftUI код разделитель, расширяющийся вдоль главной оси стека, или по обеим осям, если он не содержится в стеке?",
                "Как добавить в SwiftUI код адаптивное вью без содержимого, которое расширяется настолько, насколько это возможно?"
            ],
                     image: "",
                     optionA: "Spacer()",
                     optionB: ".padding",
                     optionC: "Hstack { // }",
                     optionD: "Divider()",
                     questionId: 103867572,
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
                     questionId: 851046140,
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
                     questionId: 732147881,
                     helpText: """
                     Да. Модификатор .padding() добавляет внутренние отступы во view.
                     
                     Если не указывать значение в поинтах (points) для параметра length внутри круглых скобок, SwiftUI использует значение по умолчанию для конкретной платформы. Для iOS это 16 pt.
                     """),
            
            Question(question: [
                "Для создания кастомных view на SwiftUI нужно создавать новые файлы View.xib, так ли это?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     questionId: 468682159,
                     helpText: """
                     Нет. Когда вы используете SwiftUI, вы создаете файлы для кастомных view через сочетание клавиш Cmd+N -> выберите шаблон “SwiftUI View” -> Next -> Введите имя шаблона -> Create. При этом файл View.xib вы не используете совсем.
                     """),
            
            Question(question: [
                "С помощью какого типа в SwiftUI можно добавить изображение на экран?"
            ],
                     image: "",
                     optionA: "Image(_:)",
                     optionB: "AddImage(_:)",
                     optionC: "InsertImage(_:)",
                     optionD: "",
                     questionId: 339501840,
                     helpText: """
                     Image(_:). Image - это view, которое показывает изображения. Используйте структуру Image, если вы хотите добавить изображения в свое приложение на SwiftUI.
                     """),
            
            Question(question: [
                "Какую форму нам нужно добавить в модификатор .clipShape() в SwiftUI, чтобы получить круглое view (с равными сторонами 1:1)?"
            ],
                     image: "",
                     optionA: "Circle()",
                     optionB: "Capsule()",
                     optionC: "Rectangle()",
                     optionD: "",
                     questionId: 780349105,
                     helpText: """
                     clipShape(Circle()). В SwiftUI для создания круглого изображения можно использовать несколько встроенных форм (SwiftUI’s built-in shapes):
                     
                     - Circle() - нарисует круг, где высота и ширина будут равны, при этом, даже если мы отдадим туда изображение 100х50, мы получим 50х50.
                     
                     - Capsule() - нарисует прямоугольник, где стороны фигуры закругляются по одной из ее бОльших осей, ширина или высота (круг можно создать, если использовать квадратное изображение с равными сторонами). Если создать изображение 100x50 - оно будет закругляться только слева и справа (так как ширина больше), а снизу и сверху будут прямые грани.
                     """),
            
            Question(question: [
                "Какую форму нам нужно добавить в модификатор .clipShape() в SwiftUI, чтобы получить прямоугольник, у которого только грани одной из сторон (бОльшей) будут скругляться?"
            ],
                     image: "",
                     optionA: "Capsule()",
                     optionB: "Rectangle()",
                     optionC: "Circle()",
                     optionD: "Ellipse()",
                     questionId: 105541431,
                     helpText: """
                     Capsule(). Данный нативная геометрическая форма (SwiftUI’s built-in shapes) нарисует прямоугольник, где стороны фигуры закругляются по одной из ее бОльших осей, ширина или высота (круг можно создать, если использовать квадратное изображение с равными сторонами). Если создать изображение 100x50 - оно будет закругляться только слева и справа (так как ширина больше), а снизу и сверху будут прямые грани.
                     """),
            
            Question(question: [
                "Если в SwiftUI изображению 50х50 добавить модификатор с такими параметрами: .clipShape(RoundedRectangle(cornerRadius: 100)), что произойдет с изображением?"
            ],
                     image: "",
                     optionA: "Получим ровный круг",
                     optionB: "Изображение исчезнет",
                     optionC: "Останется квадратным",
                     optionD: "",
                     questionId: 466191839,
                     helpText: """
                     Получим ровный круг. В отличии от UIKit, какое-бы значение CornerRadius мы не присваивали view в SwiftUI - максимальное скругление произойдет до состояния "ровный круг". Дальше скругление применяться не будет.
                     
                     В UIKit, если вы делаете скругление больше высоты или ширины - изображение начинает принимать неправильную форму трапеции.
                     """),
            
            Question(question: [
                "Если вместе со SwiftUI вы импортируете другие фреймворки, вы получаете доступ к специфичному функционалу этих фреймворков именно для SwiftUI. Это правда?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 994474814,
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
                     questionId: 393824711,
                     helpText: """
                     @State. @State — это атрибут (обертка), который мы можем использовать для свойств, которые обозначают состояния View. SwiftUI будет хранить значение с этим атрибутом в специальной внутренней памяти вне структуры View.
                     
                     Вы используете атрибут @State, чтобы установить "источник правды" для данных в вашем приложении, который вы можете изменять из более чем одного View. Как только значение свойства @State меняется, SwiftUI перестраивает View для учета изменений состояния и его корректного отображения.
                     """),
            
            Question(question: [
                "Что произойдет с шириной View в SwiftUI, если мы зададим ей frame, указывая только значения высоты. Например: .frame(height: 300)?"
            ],
                     image: "",
                     optionA: "Примет ширину контента",
                     optionB: "Займет половину экрана",
                     optionC: "Останется неизменной",
                     optionD: "",
                     questionId: 287003972,
                     helpText: """
                     Примет ширину контента. Когда вы указываете только параметр высоты для модификатора .frame, View автоматически изменяется по ширине его содержимого (контента). Если ширина контента (например это MapView) выше, чем ширина экрана - View займет всю доступную ширину.
                     """),
            
            Question(question: [
                "Выберите модификатор, который сместит наше View на 100 pt вверх по оси Y"
            ],
                     image: "",
                     optionA: ".offset(y: -100)",
                     optionB: ".offset(y: 100)",
                     optionC: ".offset(x: -100)",
                     optionD: "",
                     questionId: 511384010,
                     helpText: """
                     offset(y: -100). Данный модификатор позволяет нам изменять положение View по оси Y. Смещение на отрицательное значение будет смещать View наверх, и наоборот, положительное значение будет смещать его вниз.
                     """),
            
            Question(question: [
                "Какой модификатор из SwiftUI позволит вашему View не обращать внимания на ограничения safe area?"
            ],
                     image: "",
                     optionA: ".ignoresSafeArea",
                     optionB: ".removeSafeArea",
                     optionC: ".deleteSafeArea",
                     optionD: "",
                     questionId: 623943874,
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
                     questionId: 478944843,
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
                     questionId: 761758842,
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
                     questionId: 195416164,
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
                     questionId: 554041601,
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
                     questionId: 817702693,
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
                     questionId: 225908548,
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
                     questionId: 544449077,
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
                     questionId: 853685500,
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
                     questionId: 493190017,
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
        ]
    }
}
