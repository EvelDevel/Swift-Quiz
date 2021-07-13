
//  Created by Евгений Никитин on 12.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class NestedTypesSet {
	static func getQuestions() -> [Question] {
		return [
			Question(question: ["Как \"Вложенные типы\" будут по английски?"],
					 image: "",
					 optionA: "Nested Types",
					 optionB: "Type Casting",
					 optionC: "Typing",
					 optionD: "Opaque Types",
					 questionId: 1901,
					 helpText: "Правильный ответ: Nested Types."),
			
			Question(question: ["Где вам нужно написать свое определение типа, чтобы вложить один тип в другой?"],
					 image: "",
					 optionA: "Во внешних {}",
					 optionB: "Внутри ()",
					 optionC: "Перед {}",
					 optionD: "После ()",
					 questionId: 1902,
					 helpText: "Чтобы вложить тип в другой тип, вам нужно написать свое определение во внешних фигурных скобках типа, который он поддерживает."),
			
			Question(question: ["На сколько уровней могут быть вложены типы?",
								"Типы могут быть вложены на столько уровней"],
					 image: "",
					 optionA: "На сколько нужно",
					 optionB: "На 2",
					 optionC: "На 1",
					 optionD: "На 3",
					 questionId: 1903,
					 helpText: "Типы могут быть вложены на столько уровней, на сколько это необходимо."),
			
			Question(question: ["Можем ли мы использовать вложенные типы снаружи определяющего их контекста?"],
					 image: "",
					 optionA: "Да",
					 optionB: "Нет",
					 optionC: "",
					 optionD: "",
					 questionId: 1904,
					 helpText: "Для того, чтобы использовать вложенные типы снаружи определяющего их контекста, нужно поставить префикс имени типа, внутри которого он вложен, затем его имя.")
		]
	}
}
