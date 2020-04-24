
//  Created by Евгений Никитин on 19.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.


import UIKit

// MARK: Настройка последовательности вопросов
enum QuestionOrder {
    case straight
    case random
}

// MARK: Настройка смены формулировок вопроса
enum QuestionText {
    case same
    case random
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var questionOrderControl: UISegmentedControl!
    @IBOutlet weak var questionTextControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsInitialValues()
        questionOrderControl.addTarget(self, action: #selector(selectedOrderValue), for: .valueChanged)
        questionTextControl.addTarget(self, action: #selector(selectedQuestionTextValue), for: .valueChanged)
    }
    
    /// Определяем текущее состояние (если меняли настройку последовательности)
    func settingsInitialValues() {
        /// Настройка порядка вопросов
        if Game.shared.getQuestionOrderSatus() == QuestionOrder.straight {
            questionOrderControl.selectedSegmentIndex = 0
        } else {
            questionOrderControl.selectedSegmentIndex = 1
        }
        /// Настройка формулировок вопроса
        if Game.shared.getQuestionTextShuffelingStatus() == QuestionText.same {
            questionTextControl.selectedSegmentIndex = 0
        } else {
            questionTextControl.selectedSegmentIndex = 1
        }
    }
    
    /// Меняем настройку последовательности при переключении
    @objc func selectedOrderValue(target: UISegmentedControl) {
        if target == self.questionOrderControl {
            let segmentIndex = target.selectedSegmentIndex
            if segmentIndex == 0 {
                Game.shared.setQuestionOrder(order: .straight)
            } else {
                Game.shared.setQuestionOrder(order: .random)
            }
        }
    }
    
    /// Меняем настройку последовательности при переключении
    @objc func selectedQuestionTextValue(target: UISegmentedControl) {
        if target == self.questionTextControl {
            let segmentIndex = target.selectedSegmentIndex
            if segmentIndex == 0 {
                Game.shared.setQuestionTextShuffeling(flag: .same)
            } else {
                Game.shared.setQuestionTextShuffeling(flag: .random)
            }
        }
    }
}
