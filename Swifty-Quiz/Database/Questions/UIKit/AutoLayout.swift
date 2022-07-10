//
//  AutoLayout.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 07.11.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation

class AutoLayout {
    static func getQuestions() -> [Question] {
        return [
            Question(question: ["Auto Layout позволяет вам адаптировать все элементы экрана под разные размеры и режимы отображения. Так ли это?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 618137998,
                     helpText: """
                     Да. Изначально Apple создала iPhone с экраном одного размера, и разработчикам не нужно было создавать гибкие интерфейсы, они должны были соответствовать только одному размеру.
                     
                     Сегодня есть множество устройств разного размера, и большой упор идет на ландшафтный режим отображения.
                     
                     Auto Layout - решение этой проблемы от Apple, позволяющее элементам пользовательского интерфейса увеличиваться, уменьшаться и перемещаться в зависимости от размера экрана.
                     """),
            
            Question(question: ["Если вы измените размер окна приложения на macOS, Auto Layout сам перерасчитает интерфейс. Правда ли это?",
                                "Если вы измените ориентацию экрана вашего девайса, Auto Layout сам перерасчитает интерфейс. Правда ли это?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 770323841,
                     helpText: """
                     Да. Auto Layout динамически вычисляет позиции и размеры всех view в иерархии на основе constraints — ограничений, заданных для всех view в иерархии.
                     
                     Самый большой и очевидный плюс для разработчика в использовании Auto Layout в том, что исчезает необходимость в подгонке размеров приложения под определенные устройства — Auto Layout делает это за вас, динамически изменяя интерфейс в зависимости от внешних или внутренних изменений.
                     
                     Примером внешних изменений может быть: Изменение размера окна в macOS, изменение ориентации экрана. Пример внутренних изменений: Изменение контента в окне, изменения в зависимости от языка и т.д.
                     """),
            
            Question(question: ["Если контент внутри view изменился, перерасчитает ли Auto Layout ваш интерфейс?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 848679801,
                     helpText: """
                     Да. Интерфейс будет перерасчитан. Когда контент вашего приложения изменяется, для нового содержимого может потребоваться другой размер view. Обычно это происходит в приложениях, отображающих текст или изображения.
                     
                     Например, новостному приложению необходимо настроить макет в зависимости от размера отдельных новостных статей.
                     
                     Точно так же фотопоток должен обрабатывать широкий диапазон размеров изображений и соотношений сторон.
                     """),
            
            Question(question: ["Autoresizing mask могут поддерживать внутренние изменения (например: изменение контента внутри view). Это правда?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     questionId: 453857944,
                     helpText: """
                     Нет. Вы можете использовать маски с автоизменением размеров (autoresizing mask), они определяют, как изменяется фрейм вашего view при изменении фрейма родительского view.
                     
                     Это упрощает создание макетов, которые адаптируются к внешним изменениям. Однако для сложных пользовательских интерфейсов вам обычно необходимо дополнять маски вашими собственными программными изменениями.
                     
                     Кроме того, маски адаптируются только к внешним изменениям, и не поддерживают внутренние.
                     """),
            
            Question(question: ["Какой из этих подходов может реагировать как на внутренние, так и на внешние изменения?"],
                     image: "",
                     optionA: "Auto Layout",
                     optionB: "Autoresizing mask",
                     optionC: "Никакой",
                     optionD: "",
                     questionId: 200521003,
                     helpText: "Auto Layout. Он определяет ваш пользовательский интерфейс с помощью ряда ограничений (constraints). Ограничения обычно представляют собой отношения между двумя view. Затем Auto Layout вычисляет размер и расположение каждого view на основе этих ограничений. Это создает интерфейсы, которые динамически реагируют как на внутренние, так и на внешние изменения."),
            
            Question(question: ["Обязательно ли нам самим, вручную расставлять элементы интерфейса внутри stack view?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     questionId: 402933862,
                     helpText: "Нет. stack views предоставляют простой способ использовать возможности Auto Layout без введения сложных ограничений (constraints). Один stack view представляет из себя либо строку, либо столбец элементов пользовательского интерфейса (то есть бывает и вертикальным, и горизонтальным)."),
            
            Question(question: ["Какие разновидности stack view бывают?"],
                     image: "",
                     optionA: "Горизонтальные и вертикальные",
                     optionB: "Горизонтальные",
                     optionC: "Вертикальные",
                     optionD: "",
                     questionId: 941057637,
                     helpText: "Горизонтальные и вертикальные. Stack views предоставляют простой способ использовать возможности Auto Layout без введения сложных ограничений (constraints). Один stack view представляет из себя либо строку, либо столбец элементов пользовательского интерфейса (то есть бывает и вертикальным, и горизонтальным)."),
            
            Question(question: ["Сколько основных свойств имеет UIStackView?"],
                     image: "",
                     optionA: "4",
                     optionB: "3",
                     optionC: "2",
                     optionD: "1",
                     questionId: 894853573,
                     helpText: """
                     4. Внутри stack view - все элементы располагаются на основе его свойств.
                     
                     Axis: (только UIStackView) определяет ориентацию представления стека (ось), вертикальную или горизонтальную.
                     Distribution: определяет расположение элементов по оси.
                     Alignment: определяет расположение элементов перпендикулярно оси.
                     Spacing: определяет расстояние между элементами стека.
                     """),
            
            Question(question: ["Какое свойство стек-вью отвечает за ориентацию, вертикальную или горизонтальную?"],
                     image: "",
                     optionA: "Axis",
                     optionB: "Distribution",
                     optionC: "Alignment",
                     optionD: "Spacing",
                     questionId: 356536231,
                     helpText: """
                     Axis. Внутри stack view - все элементы располагаются на основе его свойств.
                     
                     Axis: (только UIStackView) определяет ориентацию представления стека (ось), вертикальную или горизонтальную.
                     Distribution: определяет расположение элементов по оси.
                     Alignment: определяет расположение элементов перпендикулярно оси.
                     Spacing: определяет расстояние между элементами стека.
                     """),
            
            Question(question: ["Какое свойство стек-вью отвечает за расположение элементов по оси?"],
                     image: "",
                     optionA: "Distribution",
                     optionB: "Spacing",
                     optionC: "Axis",
                     optionD: "",
                     questionId: 697503329,
                     helpText: """
                     Distribution. Внутри stack view - все элементы располагаются на основе его свойств.
                     
                     Axis: (только UIStackView) определяет ориентацию представления стека (ось), вертикальную или горизонтальную.
                     Distribution: определяет расположение элементов по оси.
                     Alignment: определяет расположение элементов перпендикулярно оси.
                     Spacing: определяет расстояние между элементами стека.
                     """),
            
            Question(question: ["Какое свойство стек-вью отвечает за расположение элементов перпендикулярно выбранной оси?"],
                     image: "",
                     optionA: "Alignment",
                     optionB: "Spacing",
                     optionC: "Distribution",
                     optionD: "",
                     questionId: 833397952,
                     helpText: """
                     Alignment. Внутри stack view - все элементы располагаются на основе его свойств.
                     
                     Axis: (только UIStackView) определяет ориентацию представления стека (ось), вертикальную или горизонтальную.
                     Distribution: определяет расположение элементов по оси.
                     Alignment: определяет расположение элементов перпендикулярно оси.
                     Spacing: определяет расстояние между элементами стека.
                     """),
            
            Question(question: ["Какое свойство стек-вью определяет расстояние между элементами стека?"],
                     image: "",
                     optionA: "Spacing",
                     optionB: "Axis",
                     optionC: "Distribution",
                     optionD: "",
                     questionId: 222554240,
                     helpText: """
                     Spacing. Внутри stack view - все элементы располагаются на основе его свойств.
                     Axis: (только UIStackView) определяет ориентацию представления стека (ось), вертикальную или горизонтальную.
                     Distribution: определяет расположение элементов по оси.
                     Alignment: определяет расположение элементов перпендикулярно оси.
                     Spacing: определяет расстояние между элементами вашего стека.
                     """),
            
            Question(question: ["Зависит ли расположение элементов внутри stack view от content-hugging priorities?",
                               "Зависит ли расположение элементов внутри stack view от compression-resistance priorities?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 505206643,
                     helpText: """
                     Да. stack view также основывает свой макет на приоритетах упорядоченного содержимого (content-hugging priorities) и приоритетах сопротивления сжатию (compression-resistance priorities).
                     
                     Вы можете изменить их в size-инспекторе (правая панель Interface builder). Вы можете дополнительно изменить макет, добавив constraints непосредственно в stack view.
                     """),
            
            Question(question: ["Можем ли мы использовать constraints внутри stack view?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 460023123,
                     helpText: "Да. Для получения максимально удовлетворящих вас результатов, вы можете использовать constraints внутри самого stackView, либо вкладывать несколько stackView в stackView и затем использовать constraints, например: для выравнивания по центру экрана."),
            
            Question(question: ["Swift не поддерживает вложенные stack view, вы не можете поместить один в другой. Правда ли это?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     questionId: 961339359,
                     helpText: "Нет. Вы можете вкладывать несколько stack view один в другой, и затем даже использовать constraints, чтобы получить более сложные макеты, отвечающие вашим требованиям."),
            
            Question(question: ["Apple советует в своей верстке использовать максимально возможное количество stack views. Правда ли это?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 445353624,
                     helpText: """
                     Да. Согласно Apple Layout Guide: Используйте stack views, чтобы управлять как можно большей частью вашего макета.
                     
                     Прибегайте к созданию констрейнтов (ограничения / constraints) только тогда, когда вы не можете достичь своих целей с помощью одних стек-вью. Хотя креативное использование вложенных стеков поможет вам создавать сложные пользовательские интерфейсы, вы не можете полностью избежать использования ограничений (constraints).
                     
                     Как минимум, вам всегда нужны ограничения для определения позиции (и, возможно, размера) самого внешнего стека.
                     """),
            
            Question(question: ["Можем ли мы сверстать сложный пользовательский интерфейс, используя только stack view (совсем не используя constraints)?"],
                     image: "",
                     optionA: "Нет, не можем",
                     optionB: "Да, можем",
                     optionC: "",
                     optionD: "",
                     questionId: 389087092,
                     helpText: """
                     Нет, не можем. Хотя креативное использование вложенных стеков поможет вам создавать сложные пользовательские интерфейсы, вы не можете полностью избежать использования ограничений (constraints).
                     
                     Как минимум, вам всегда нужны ограничения для определения позиции (и, возможно, размера) самого внешнего стека (родительского, расположенного на главном view).
                     """),
            
            Question(question: ["Является ли каждое ограничение (constraint) линейным уравнением?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 391912939,
                     helpText: "Да. Макет (Layout) вашей иерархии view - определяется как серия линейных уравнений. Каждое ограничение (constraint) представляет собой одно линейное уравнение. Ваша цель - объявить серию уравнений, которая имеет одно и только одно возможное решение."),
            
            Question(question: ["Constraints определяют отношение между двумя элементами интерфейса. Могут ли они определять отношение между двумя атрибутами одного элемента?"],
                     image: "",
                     optionA: "Да, могут",
                     optionB: "Нет, не могут",
                     optionC: "",
                     optionD: "",
                     questionId: 648065252,
                     helpText: """
                     Да, могут. Большинство constraints определяют отношения между двумя элементами в нашем пользовательском интерфейсе. Эти элементы могут представлять собой view или руководства по макету (layout guides).
                     
                     Constraints также могут определять отношения между двумя различными атрибутами одного элемента, например, устанавливая соотношение сторон между высотой и шириной элемента (Aspect ratio).
                     """),
            
            Question(question: ["Выберите constraints, которые мы можем применить к краям объекта на нашем view?"],
                     image: "",
                     optionA: "leading, trailing, top, bottom",
                     optionB: "height, width",
                     optionC: "vertical, horizontal centers",
                     optionD: "",
                     questionId: 639595138,
                     helpText: """
                     leading, trailing, top, bottom. У нас есть несколько основных видов ограничений по атрибутам, например: по четырем краям (передний, задний, верхний и нижний: leading, trailing, top, and bottom), а также высота, ширина (height, width), а также центры по вертикали и горизонтали (vertical and horizontal centers).
                     
                     Текстовые элементы также имеют свои дополнительные атрибуты, например baseline (расположение текста относительно какой-либо базовой линии).
                     """),
            
            Question(question: ["Можем ли мы использовать атрибуты размера (Height и Width) для создания линейного уравнения ограничения (constraint), которое указывает местоположение view на экране?"],
                     image: "",
                     optionA: "Нет, они не совместимы",
                     optionB: "Да, можем использовать",
                     optionC: "",
                     optionD: "",
                     questionId: 703293211,
                     helpText: """
                     Нет, они не совместимы. Широкий диапазон параметров и атрибутов, доступных для этих линейных уравнений (ограничений), позволяет создавать множество различных типов ограничений. Вы можете определить расстояние между view, выровнять края view, определить относительный размер двух view или даже определить соотношение сторон view.
                     
                     Однако не все атрибуты совместимы. Есть два основных типа атрибутов. Атрибуты размера (например, высота и ширина) и атрибуты местоположения (например, слева и сверху).
                     
                     Атрибуты размера используются для указания размера элемента без указания его местоположения. Атрибуты местоположения используются для указания местоположения элемента относительно чего-либо еще, однако на них нет указания размера предмета.
                     """),
            
            Question(question: ["Что установит данное линейное уравнение (constraint): View.height = 0.0 * NotAnAttribute + 40.0?"],
                     image: "",
                     optionA: "Высоту view, равную 40",
                     optionB: "Положение view по Y",
                     optionC: "Высоту view, равную 0",
                     optionD: "",
                     questionId: 411419846,
                     helpText: """
                     Высоту view, равную 40. Данное ограничение устанавливает высоту view равную 40 единицам (Setting a constant height). Значение 0.0 - это Multiplier, другими словами, насколько мы умножаем конечное значение.
                     
                     Аттрибуты высоты или ширины, если мы устанавливаем их просто как определенную константу (без других атрибутов) - не имеют этого параметра, поэтому в этих уравнениях он выставляется как 0.0. Значение 40.0 - это constant, то есть сама величина нашего значения.
                     """),
            
            Question(question: ["Что установит данное линейное уравнение (constraint): Button_2.leading = 1.0 * Button_1.trailing + 8.0?"],
                     image: "",
                     optionA: "Расстояние между кнопками 1 и 2",
                     optionB: "Ширину кнопки 2",
                     optionC: "Расстояние от края до кнопки 2",
                     optionD: "",
                     questionId: 585910552,
                     helpText: """
                     Расстояние между кнопками 1 и 2. Данное ограничение устанавливает расстояние между кнопкой №1 и кнопкой №2 в 8 пунктов.
                     
                     Читается это как: \"Пусть положение левой границы кнопки №2 (leading) будет равно положению правой границы кнопки №1 (trailing), + константа (constant, floating-point offset, то есть \"сдвиг\") равная 8 единицам\".
                     """),
            
            Question(question: ["Чего мы достигаем с помощью этого линейного уравнения для двух кнопок: Button_1.leading = 1.0 * Button_2.leading + 0.0?"],
                     image: "",
                     optionA: "Выравнивания по левому краю",
                     optionB: "Кнопка 1 прилипает к кнопке 2",
                     optionC: "Устанавливаем ширину кнопки 2",
                     optionD: "",
                     questionId: 631310542,
                     helpText: """
                     Выравнивания по левому краю. В этом линейном уравнении мы устанавливаем местоположение, а точнее - мы устанавливаем выравнивание двух кнопок по левому краю (Aligning the leading edge of two buttons).
                     
                     Читается как: \"Пусть левый край кнопки №1 будет равняться левому краю кнопки №2 без смещения\".
                     """),
            
            Question(question: ["Будет ли считаться уравнение Button_2.leading = 1.0 * Button_1.trailing + 8.0 и уравнение Button_1.trailing = 1.0 * Button_2.leading - 8.0 идентичными?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 993025804,
                     helpText: """
                     Да. Когда Auto Layout решает эти уравнения, он не просто присваивает значение правой части левой.
                     
                     Вместо этого он вычисляет значение как для атрибута №1, так и для атрибута №2. Это означает, что мы часто можем свободно менять порядок элементов в уравнении. При изменении порядка элементов убедитесь, что вы инвертировали множитель и константу.
                     
                     Например, постоянная 8,0 становится -8,0. Множитель 2,0 становится 0,5. Константы 0,0 и множители 1,0 остаются без изменений.
                     """),
            
            Question(question: ["Будут ли все три данных макета (layouts) валидными по горизонтали?"],
                     image: "AutoLayout01",
                     optionA: "Да",
                     optionB: "Нет, только первый",
                     optionC: "Нет, только второй",
                     optionD: "Нет, только третий",
                     questionId: 393591405,
                     helpText: """
                     Да. Как правило, ограничения должны определять как размер, так и положение каждого view. Предполагая, что размер superview уже установлен (например, root view сцены в iOS). Однозначный, удовлетворительный макет требует двух ограничений на view для каждого измерения (вертикальное / горизонтальное).
                     
                     Однако у вас есть широкий спектр вариантов, когда дело доходит до выбора ограничений, которые вы хотите использовать. Например, все три наших макета создают однозначные и приемлемые связки ограничений (показаны только горизонтальные ограничения).
                     
                     Обратите внимание: каждый макет имеет один view и два горизонтальных ограничения. В каждом случае ограничения полностью определяют как ширину, так и горизонтальное положение view. Это означает, что все макеты создают однозначный, удовлетворительный макет по горизонтальной оси. Однако эти макеты не одинаково полезны (при изменении ширины superview).
                     """),
            
            Question(question: ["Какая связка констрейнтов (constraints) используется в первом макете?"],
                     image: "AutoLayout01",
                     optionA: "Leading, width",
                     optionB: "Trailing, width",
                     optionC: "Leading, trailing",
                     optionD: "",
                     questionId: 813249702,
                     helpText: """
                     Leading, width. Первый макет ограничивает левый край (leading) view относительно левого края superview (leading), а также устанавливает view фиксированную ширину (width).
                     
                     В таком случае положение по правому краю может быть вычислено на основе размера superview и установленных нами ограничений.
                     
                     При такой связке ограничений, если ширина superview изменится в большую сторону - мы получим уменьшение нашего view относительно superview, так как его ширина останется неизменной, а если в меньшую - есть опасность что ширина нашего view окажется больше, чем superview, и оно вылезет за его пределы. Таких связок ограничений лучше избегать, потому что они не являются гибкими.
                     """),
            
            Question(question: ["Какая связка констрейнтов (constraints) используется во втором макете?"],
                     image: "AutoLayout01",
                     optionA: "Leading, trailing",
                     optionB: "Leading, center vertically",
                     optionC: "Leading, width",
                     optionD: "",
                     questionId: 299860116,
                     helpText: """
                     Leading, trailing. Второй макет ограничивает левый край view (leading) относительно левого края superview (leading). Он также ограничивает правый край view (trailing) относительно правого края superview (trailing).
                     
                     На основе этих ограничений можно рассчитать ширину нашего view - зная размер superview. При такой связке ограничений, если ширина superview изменится в большую или меньшую сторону - мы получим адекватное изменение ширины view относительно его superview, поскольку у нас нет константной ширины, а есть привязка к краям superview.
                     """),
            
            Question(question: ["Какая связка констрейнтов (constraints) используется в третьем макете?"],
                     image: "AutoLayout01",
                     optionA: "Leading, center horizontally",
                     optionB: "Trailing, width",
                     optionC: "Leading, width",
                     optionD: "",
                     questionId: 318886353,
                     helpText: """
                     Leading, center horizontally. Третий макет ограничивает левый край view (leading) относительно левого края superview (leading). Он также выравнивает по центру view и superview (center horizontally in superview).
                     
                     Это позволяет рассчитать как ширину, так и положение правого края нашей view (trailing) на основе размера superview и установленных ограничений.
                     
                     При такой связке ограничений, если ширина superview изменится в большую или меньшую сторону - мы получим адекватное изменение ширины view относительно его superview, поскольку у нас нет константной ширины, а есть привязка к краю superview и выравнивание по центру (другими словами, в таком случае правый край view займет такой же отступ от правого края superview, как и левый, которому мы установили явное ограничение).
                     """),
            
            Question(question: ["Можем ли мы устанавливать опциональные ограничения?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 686980110,
                     helpText: """
                     Да. Вы также можете создать опциональные ограничения. Все ограничения имеют приоритет от 1 до 1000. Ограничения с приоритетом 1000 являются обязательными. Все остальные ограничения опциональны.
                     
                     При вычислении решений Auto Layout пытается удовлетворить все ограничения в порядке приоритета от самого высокого до самого низкого.
                     
                     Если он не может удовлетворить опциональное ограничение, это ограничение пропускается и переходит к следующему ограничению. Даже если опциональное ограничение не может быть выполнено, оно все равно может повлиять на макет. Если после пропуска ограничения в макете возникает какая-либо двусмысленность, система выбирает решение, которое ближе всего к ограничению.
                     """),
            
            Question(question: ["Есть ли в Swift разновидности view, у которых есть свой минимальный размер?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 944853746,
                     helpText: """
                     Да. Некоторые view имеют естественный размер, опирающийся на их внутренний контент. Это называется их внутренним размером содержимого (intrinsic content size).
                     
                     Например, внутренний размер содержимого кнопки - это размер ее заголовка (title) плюс небольшие отступы (margin).
                     
                     Не все view имеют внутренний размер содержимого (intrinsic size). Для view, у которых этот размер есть, он может определять высоту view, его ширину или и то, и другое.
                     """),
            
            Question(question: ["Для view, у которых есть внутренний размер содержимого (intrinsic content size), он может определять высоту, ширину или и то, и другое. Правда ли это?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 973618276,
                     helpText: """
                     Да. Некоторые view имеют естественный размер, опирающийся на их внутренний контент. Это называется их внутренним размером содержимого (intrinsic content size). Например, внутренний размер содержимого кнопки - это размер ее заголовка (title) плюс небольшие отступы (margin).
                     
                     Не все view имеют внутренний размер содержимого (intrinsic content size). Для view, у которых этот размер есть, он может определять высоту view, его ширину или и то, и другое.
                     """),
            
            Question(question: ["Выберите, для каких нативных элементов intrinsic content size (внутренний размер содержимого) может влиять и на ширину, и на высоту элемента"],
                     image: "",
                     optionA: "Labels",
                     optionB: "Sliders",
                     optionC: "UIView",
                     optionD: "",
                     questionId: 843886953,
                     helpText: """
                     Labels. Внутренний размер содержимого (intrinsic content size) может определять и высоту и ширину для следующих элементов: Labels, buttons, switches, and text fields.
                     
                     UIView and NSView не имеют внутреннего размера, влияющего на внешний. Внутренний размер для Sliders (слайдер) - может влиять только на ширину, и Text views с image views - вариативно.
                     """),
            
            Question(question: ["Выберите, для каких нативных элементов intrinsic content size (внутренний размер содержимого) может влиять и на ширину, и на высоту элемента"],
                     image: "",
                     optionA: "Buttons",
                     optionB: "NSView",
                     optionC: "",
                     optionD: "",
                     questionId: 109278998,
                     helpText: """
                     Buttons. Внутренний размер содержимого (intrinsic content size) может определять и высоту и ширину для следующих элементов: Labels, buttons, switches, and text fields. UIView and NSView не имеют внутреннего размера, влияющего на внешний.
                     
                     Внутренний размер для Sliders (слайдер) - может влиять только на ширину, и Text views с image views - вариативно.
                     """),
            
            Question(question: ["Выберите, для каких нативных элементов intrinsic content size (внутренний размер содержимого) может влиять и на ширину, и на высоту элемента"],
                     image: "",
                     optionA: "Text fields",
                     optionB: "UIView",
                     optionC: "Sliders",
                     optionD: "",
                     questionId: 163949451,
                     helpText: """
                     Text fields. Внутренний размер содержимого (intrinsic content size) может определять и высоту и ширину для следующих элементов: Labels, buttons, switches, and text fields. UIView and NSView не имеют внутреннего размера, влияющего на внешний.
                     
                     Внутренний размер для Sliders (слайдер) - может влиять только на ширину, и для Text views с image views - view пустого изображения не имеет внутреннего размера содержимого.
                     
                     Однако как только вы добавляете изображение, его внутренний размер содержимого устанавливается равным размеру изображения.
                     """),
            
            Question(question: ["Есть ли у пустого Image view свой внутренний размер содержимого (intrinsic content size)?"],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     questionId: 561312641,
                     helpText: "Нет. Для Text views с image views - view без текста или изображения не имеет внутреннего размера содержимого. Однако как только вы добавляете изображение, его внутренний размер содержимого устанавливается равным размеру изображения."),
            
            Question(question: ["Имеет ли Image view с изображением свой внутренний размер содержимого (intrinsic content size)?"],
                     image: "",
                     optionA: "Да, равный размеру изображения",
                     optionB: "Нет, не имеет",
                     optionC: "",
                     optionD: "",
                     questionId: 922447739,
                     helpText: "Да, равный размеру изображения. Для Text views с image views - view без текста или изображения не имеет внутреннего размера содержимого. Однако как только вы добавляете изображение, его внутренний размер содержимого устанавливается равным размеру изображения."),
            
            Question(question: ["При включенном скролле text view не имеет внутреннего размера содержимого. Правда ли это?"],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 794849911,
                     helpText: """
                     Да. Внутренний размер содержимого text view зависит от контента (текста), от того, включен ли в нем скролл, а также от других ограничений, применяемых к нему.
                     
                     Например, при включенном скролле text view не имеет внутреннего размера содержимого. Если скролл отключен, по умолчанию внутренний размер содержимого text view рассчитывается на основе размера текста без переноса строк.
                     
                     Например, если в тексте нет возврата (\n), он вычисляет высоту и ширину, необходимые для размещения содержимого в виде одной строки текста. Если вы добавляете ограничения для указания ширины представления, внутренний размер содержимого определяет высоту, необходимую для отображения текста с учетом его ширины.
                     """),
            
            Question(question: ["Content hugging priorities отталкивают края view или наоборот притягивает их к содержимому?"],
                     image: "",
                     optionA: "Притягивают",
                     optionB: "Отталкивают",
                     optionC: "Ни то, ни другое",
                     optionD: "",
                     questionId: 722296939,
                     helpText: """
                     Притягивают. Auto Layout представляет внутренний размер содержимого view с использованием пары ограничений для каждого измерения (вертикального и горизонтального).
                     
                     Обхват содержимого (content hugging priorities) притягивает края view внутрь, так чтобы они плотно прилегали к содержимому.
                     
                     Сопротивление сжатию (compression resistance priorities) отталкивает края view наружу, чтобы контент нигде не был \"обрезан\".
                     """),
            
            Question(question: ["Compression resistance priorities отталкивают края view или наоборот притягивает их к содержимому?"],
                     image: "",
                     optionA: "Отталкивают",
                     optionB: "Притягивают",
                     optionC: "Ни то, ни другое",
                     optionD: "",
                     questionId: 722296939,
                     helpText: """
                     Отталкивают. Auto Layout представляет внутренний размер содержимого view с использованием пары ограничений для каждого измерения (вертикального и горизонтального).
                     
                     Обхват содержимого (content hugging priorities) притягивает края view внутрь, так чтобы они плотно прилегали к содержимому.
                     
                     Сопротивление сжатию (compression resistance priorities) отталкивает края view наружу, чтобы контент нигде не был \"обрезан\".
                     """),
        ]
    }
}
