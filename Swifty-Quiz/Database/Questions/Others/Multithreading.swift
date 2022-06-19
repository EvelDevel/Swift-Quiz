//
//  Multithreading.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 13.09.2021.
//  Copyright © 2021 Evel-Devel. All rights reserved.
//

import Foundation

class Multithreading {
    static func getQuestions() -> [Question] {
        return [
            Question(question: [
                "Можете ли вы сами вручную создать нужное количество потоков для всех ядер процессора и ожидать от них эффективной работы?"
            ],
                     image: "",
                     optionA: "Нет",
                     optionB: "Да",
                     optionC: "",
                     optionD: "",
                     questionId: 913002116,
                     helpText: """
                     Нет. Вы не можете создать столько потоков, сколько ядер, и ожидать, что программа будет хорошо работать. Вам нужно знать количество ядер, которые можно эффективно использовать, что является сложной задачей. Необходимо, чтобы приложения могли использовать преимущества переменного числа ядер компьютера.
                     
                     Объем работы, выполняемой одним приложением, также должен иметь возможность динамического масштабирования в соответствии с изменяющимися условиями системы. И решение должно быть достаточно простым, чтобы не увеличивать объем работы, необходимой для использования преимуществ этих ядер.
                     
                     Хорошая новость в том, что ОС Apple предоставляют решение всех этих проблем.
                     """),
            
            Question(question: [
                "Можем ли мы использовать многопоточность для разграничение групп задач, изолируя их друг от друга на разные потоки по типу задачи?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 471689340,
                     helpText: """
                     Да. Есть несколько общих обстоятельств, которые делают использование нескольких потоков полезным, одно из таких: разграничение групп задач - потоки могут использоваться для обеспечения модульности приложения.
                     
                     Различные потоки могут использоваться для выполнения группы задач одного и того же типа, изолируя их от потоков выполнения других частей вашей программы, что упрощает представление о текущем состоянии приложения.
                     """),
            
            Question(question: [
                "Могут ли несколько потоков быть использованы для параллельного выполнения копий одной и той же задачи?"
            ],
                     image: "",
                     optionA: "Да",
                     optionB: "Нет",
                     optionC: "",
                     optionD: "",
                     questionId: 417171171,
                     helpText: """
                     Да. Есть несколько общих обстоятельств, которые делают использование нескольких потоков полезным,  один из таких: распараллеливание вычислений - несколько потоков могут быть использованы для параллельного выполнения копий одной и той же задачи на подмножестве исходных данных.
                     """),
            
            Question(question: [
                "Как называется проблема многопоточности, когда несколько потоков одновременно пытаются записывать или читать один участок памяти?"
            ],
                     image: "",
                     optionA: "Race conditions",
                     optionB: "Deadlock",
                     optionC: "Resource contention",
                     optionD: "",
                     questionId: 438084199,
                     helpText: """
                     Race conditions. Несколько потоков работают с одними и теми же данными (с одним адресом в памяти), например, одновременно читают и записывают в одну переменную (или записывают с нескольких потоков одновременно), результат выполнения серии операций может стать непредсказуемым и зависеть от порядка выполнения потоков.
                     """),
            
            Question(question: [
                "Несколько потоков, выполняющие разные задачи, пытаясь получить доступ к одним и тем же ресурсам, увеличивают количество времени, необходимое для безопасного получения требуемых ресурсов. Это?"
            ],
                     image: "",
                     optionA: "Resource contention",
                     optionB: "Deadlock",
                     optionC: "Starvation",
                     optionD: "",
                     questionId: 471891603,
                     helpText: """
                     Resource contention. Конфликт за ресурсы (Resources contention): несколько потоков, которые могут выполнять разные задачи, пытаясь получить доступ к одним и тем же ресурсам, увеличивают количество времени, необходимое для безопасного получения требуемых ресурсов.
                     
                     Эти задержки, необходимые для получения необходимых ресурсов, могут привести к неожиданному поведению или могут потребовать структурирования вашей программы для регулирования доступа к этим ресурсам.
                     """),
            
            Question(question: [
                "Проблема многопоточности, когда возникает ситуация, что поток блокирует критическую часть кода и может полностью остановить цикл выполнения приложения (Run loop)"
            ],
                     image: "",
                     optionA: "Deadlock",
                     optionB: "Starvation",
                     optionC: "Resource contention",
                     optionD: "",
                     questionId: 979231211,
                     helpText: """
                     Deadlock. Ситуация, когда поток блокирует критическую часть кода и может полностью остановить цикл выполнения приложения (Run loop).
                     
                     В контексте GCD вы должны быть очень осторожны при использовании вызовов dispatchQueue.sync {}, так как вы легко можете попасть в ситуации, когда две синхронные операции могут застрять в ожидании друг друга.
                     """),
            
            Question(question: [
                "Проблема многопоточности, при которой поток никогда не сможет получить доступ к ресурсу или набору ресурсов в определенном порядке, и будет пытаться снова и снова"
            ],
                     image: "",
                     optionA: "Starvation",
                     optionB: "Deadlock",
                     optionC: "Non-deterministic and Fairness",
                     optionD: "",
                     questionId: 810946621,
                     helpText: """
                     Starvation. Поток никогда не сможет получить доступ к ресурсу или набору ресурсов в определенном порядке, в котором он нуждается по разным причинам, и пытается получить этот доступ снова и снова.
                     """),
            
            Question(question: [
                "Как называется проблема многопоточности, при которой поток с низким приоритетом удерживает ресурс, который требуется другому потоку с более высоким приоритетом?"
            ],
                     image: "",
                     optionA: "Priority Inversion",
                     optionB: "Starvation",
                     optionC: "Race conditions",
                     optionD: "",
                     questionId: 336150198,
                     helpText: """
                     Priority Inversion. Поток с низким приоритетом удерживает ресурс, который требуется другому потоку с более высоким приоритетом.
                     """),
            
            Question(question: [
                "Выберите, что из перечисленного инициализируется атомарно?"
            ],
                     image: "",
                     optionA: "Глобальные переменные",
                     optionB: "Ленивые свойства",
                     optionC: "",
                     optionD: "",
                     questionId: 144267610,
                     helpText: """
                     Глобальные переменные. Они инициализируются атомарно (Атомарная операция — операция, которая либо выполняется целиком, либо не выполняется вовсе), нам никогда не потребуется обрабатывать вручную случай, когда несколько потоков пытаются инициализировать одну и ту же глобальную переменную одновременно или беспокоиться о том, что кто-то может увидеть частично инициализированную переменную, пока инициализация все еще продолжается.
                     
                     Но важно помнить, что ленивая инициализация свойств не выполняется атомарно, и Swift на данный момент не предоставляет аннотаций или модификаторов для изменения этого поведения.
                     """),
        ]
    }
}
