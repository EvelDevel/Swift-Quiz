
//  Created by Евгений Никитин on 20.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class AnswerButtonsView: UIView {

    private var correctAnswer: String = ""
    private var shuffledAnswersArray: [String] = []
    private var correctAnswerNewPosition = 0
    
    func refreshButtonsVisibility(_ index: Int, _ count: Int, _ buttons: [HalfRoundButton]) {
        if index < count {
            for button in buttons {
                button.isHidden = false
            }
        }
    }
    
    func setDefaultButtonsColor(_ buttons: [HalfRoundButton]) {
        for button in buttons {
            button.setTitleColor(#colorLiteral(red: 0.2377000451, green: 0.2814793885, blue: 0.335570693, alpha: 1), for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9964529872, green: 0.8487327695, blue: 0.225723803, alpha: 1)
        }
    }
    
    func saveCorrectAnswerText(_ index: Int, _ array: [Question]) {
        switch array[index].correctAnswer {
        case 1: correctAnswer = array[index].optionA
        case 2: correctAnswer = array[index].optionB
        case 3: correctAnswer = array[index].optionC
        case 4: correctAnswer = array[index].optionD
        default: print("Error with correct placing answers")
        }
    }
    
    func shuffleAnswersPositions(_ index: Int, _ array: [Question]) {
        var tempAnswersArray: [String] = []
        tempAnswersArray.append(array[index].optionA)
        tempAnswersArray.append(array[index].optionB)
        tempAnswersArray.append(array[index].optionC)
        tempAnswersArray.append(array[index].optionD)
        shuffledAnswersArray = tempAnswersArray.shuffled()
        
        for i in 0..<shuffledAnswersArray.count {
            if shuffledAnswersArray[i] == correctAnswer {
                correctAnswerNewPosition = i + 1
            }
        }
    }
    
    func showCorrectPosition() -> Int {
        return correctAnswerNewPosition
    }
    
    func settingShuffledAnswers(_ optionA: UIButton, _ optionB: UIButton, _ optionC: UIButton, _ optionD: UIButton) {
        
        /// Установка ответов без анимации и скрытие пустых кнопок
        
        optionA.titleLabel?.text = shuffledAnswersArray[0]
        optionA.setTitle(shuffledAnswersArray[0], for: .normal)
        if shuffledAnswersArray[0] == "" { optionA.isHidden = true }
        
        optionB.titleLabel?.text = shuffledAnswersArray[1]
        optionB.setTitle(shuffledAnswersArray[1], for: .normal)
        if shuffledAnswersArray[1] == "" { optionB.isHidden = true }
        
        optionC.titleLabel?.text = shuffledAnswersArray[2]
        optionC.setTitle(shuffledAnswersArray[2], for: .normal)
        if shuffledAnswersArray[2] == "" { optionC.isHidden = true }
        
        optionD.titleLabel?.text = shuffledAnswersArray[3]
        optionD.setTitle(shuffledAnswersArray[3], for: .normal)
        if shuffledAnswersArray[3] == "" { optionD.isHidden = true }
    }
    
    func changeButtonColor(sender: UIButton, _ answerIsCorrect: Bool,
                           _ optionA: UIButton, _ optionB: UIButton, _ optionC: UIButton, _ optionD: UIButton) {
        switch sender.tag {
        case 1:
            optionA.backgroundColor = answerIsCorrect ? #colorLiteral(red: 0.1451225281, green: 0.7943774462, blue: 0.4165494442, alpha: 1) : #colorLiteral(red: 0.9865071177, green: 0.3565812409, blue: 0.2555966675, alpha: 1)
            optionA.setTitleColor(.white, for: .normal)
        case 2:
            optionB.backgroundColor = answerIsCorrect ? #colorLiteral(red: 0.1451225281, green: 0.7943774462, blue: 0.4165494442, alpha: 1) : #colorLiteral(red: 0.9865071177, green: 0.3565812409, blue: 0.2555966675, alpha: 1)
            optionB.setTitleColor(.white, for: .normal)
        case 3:
            optionC.backgroundColor = answerIsCorrect ? #colorLiteral(red: 0.1451225281, green: 0.7943774462, blue: 0.4165494442, alpha: 1) : #colorLiteral(red: 0.9865071177, green: 0.3565812409, blue: 0.2555966675, alpha: 1)
            optionC.setTitleColor(.white, for: .normal)
        case 4:
            optionD.backgroundColor = answerIsCorrect ? #colorLiteral(red: 0.1451225281, green: 0.7943774462, blue: 0.4165494442, alpha: 1) : #colorLiteral(red: 0.9865071177, green: 0.3565812409, blue: 0.2555966675, alpha: 1)
            optionD.setTitleColor(.white, for: .normal)
        default:
            print("We have error with answer button tags")
        }
    }
}


// MARK: Настройка теней и скруглений
extension AnswerButtonsView {
    
    func addButtonShadows(_ buttons: [HalfRoundButton]) {
        for button in buttons {
            /// Тень
            button.layer.shadowColor = UIColor(red: 0.239, green: 0.282, blue: 0.341, alpha: 0.1).cgColor
            button.layer.shadowOpacity = 1
            button.layer.shadowRadius = 5
            button.layer.shadowOffset = CGSize(width: 0, height: 5)
            button.layer.position = button.center
            
            /// Задротское скругление
            button.layer.cornerCurve = .continuous
        }
    }
    
    /// Цветные тени
    func addRedShadow(button: UIButton) {
        button.layer.shadowColor = UIColor(red: 0.996, green: 0.353, blue: 0.224, alpha: 0.5).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 5
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.position = button.center
    }
    func addGreenShadow(button: UIButton) {
        button.layer.shadowColor = UIColor(red: 0.055, green: 0.8, blue: 0.404, alpha: 0.5).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 5
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.position = button.center
    }
}
