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
                "Какому протоколу соответствует основная структура (struct) проекта, используещего SwiftUI Lifecycle?",
                "Когда приложение использует жизненный цикл SwiftUI, основная структура, отвечающая за отображение контента соответствует этому протоколу"
            ],
                     image: "",
                     optionA: "App",
                     optionB: "AnyObject",
                     optionC: "UIViewController",
                     optionD: "UIApplicationDelegate",
                     questionId: 948115569,
                     helpText: """
                     App. Приложение, использующее жизненный цикл SwiftUI, имеет структуру (struct), соответствующую протоколу App, у которой имя соответствует имени вашего приложения (с добавкой App). Эта структура является сценой, которая отвечает за отображение контента нашего приложения.
                     
                     AnyObject - является typealias, UIViewController - классом, а UIApplicationDelegate - публичным протоколом, который используется в AppDelegate в приложениях, использующих Storyboard.
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
                     optionA: "Обновятся",
                     optionB: "Не изменятся",
                     optionC: "Покажут ошибку",
                     optionD: "",
                     questionId: 532082683,
                     helpText: """
                     Обновятся. Ваш код всегда является источником правды для view. Когда вы используете SwiftUI Inspector для изменения или удаления модификатора, Xcode немедленно обновляет ваш код, чтобы он соответствовал этим изменениям.
                     """),
        ]
    }
}
