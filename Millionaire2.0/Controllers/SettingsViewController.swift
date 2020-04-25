
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

// MARK: Настройка поведения при неправильном ответе
enum EndGame {
    case proceed
    case endGame
}


class SettingsViewController: UIViewController {
    
    @IBOutlet weak var questionOrderControl: UISegmentedControl!
    @IBOutlet weak var questionTextControl: UISegmentedControl!
    @IBOutlet weak var endGameControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addingTargets()
        settingsInitialValues()
    }
    
    func addingTargets() {
        questionOrderControl.addTarget(self, action: #selector(questionOrderValue), for: .valueChanged)
        questionTextControl.addTarget(self, action: #selector(questionTextShuffleValue), for: .valueChanged)
        endGameControl.addTarget(self, action: #selector(endGameValue), for: .valueChanged)
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
        /// Настройка поведения при неправильном ответе
        if Game.shared.getEndGameStatus() == EndGame.proceed {
            endGameControl.selectedSegmentIndex = 0
        } else {
            endGameControl.selectedSegmentIndex = 1
        }
    }
    
    /// Меняем настройку последовательности при переключении
    @objc func questionOrderValue(target: UISegmentedControl) {
        if target == self.questionOrderControl {
            let segmentIndex = target.selectedSegmentIndex
            if segmentIndex == 0 {
                Game.shared.setQuestionOrder(setting: .straight)
            } else {
                Game.shared.setQuestionOrder(setting: .random)
            }
        }
    }
    
    /// Меняем настройку последовательности при переключении
    @objc func questionTextShuffleValue(target: UISegmentedControl) {
        if target == self.questionTextControl {
            let segmentIndex = target.selectedSegmentIndex
            if segmentIndex == 0 {
                Game.shared.setQuestionTextShuffeling(setting: .same)
            } else {
                Game.shared.setQuestionTextShuffeling(setting: .random)
            }
        }
    }
    
    /// Меняем настройку поведения при неправильном ответе
    @objc func endGameValue(target: UISegmentedControl) {
        if target == self.endGameControl {
            let segmentIndex = target.selectedSegmentIndex
            if segmentIndex == 0 {
                Game.shared.setEndGame(setting: .proceed)
            } else {
                Game.shared.setEndGame(setting: .endGame)
            }
        }
    }
}
