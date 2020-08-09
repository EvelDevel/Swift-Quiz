
//  Created by Евгений Никитин on 20.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class AnswerButtonsView: UIView {
    
    private var correctAnswerNewPosition = 0
    private var finalButtonsSetToSend: [String] = []
    
    /// Восстановление видимости всех кнопок
    func refreshButtonsVisibility(_ index: Int, _ count: Int, _ buttons: [UIButton]) {
        if index < count {
            for button in buttons {
                animationChanging(true, button)
            }
        }
    }
    
    /// Установка дефолтного цвета
    func setDefaultButtonsColor(_ buttons: [UIButton]) {
        for button in buttons {
            button.setTitleColor(#colorLiteral(red: 0.2377000451, green: 0.2814793885, blue: 0.335570693, alpha: 1), for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9964529872, green: 0.8487327695, blue: 0.225723803, alpha: 1)
        }
    }
    
    // MARK: Основная работа по формированию блока с кнопоками
    /// Фиксируем правильный ответ
    /// Шафлим положение всех ответов
    /// Устанавливаем на новые места
    func makeCorrectButtonsSet(_ index: Int,
                              _ array: [Question],
                              _ optionA: UIButton,
                              _ optionB: UIButton,
                              _ optionC: UIButton,
                              _ optionD: UIButton) {
        
        var tempArrayForShuffeling: [String] = []
        var arrayWithShuffledAnswers: [String] = []
        var finalAnswersSet: [String] = []
        var correctAnswer: String = ""
        
        /// Фиксируем текст правильного ответа (всегда первый)
        if array.count != 0 {
            correctAnswer = array[index].optionA
        }
        
        /// Перемешиваем позиции ответов
        tempArrayForShuffeling.append(array[index].optionA)
        tempArrayForShuffeling.append(array[index].optionB)
        tempArrayForShuffeling.append(array[index].optionC)
        tempArrayForShuffeling.append(array[index].optionD)
        arrayWithShuffledAnswers = tempArrayForShuffeling.shuffled()
        
        /// Сдвигаем все "непустые" варианты вверх (для красивой анимации)
        for index in 0...3 {
            if arrayWithShuffledAnswers[index] != "" {
                finalAnswersSet.insert(arrayWithShuffledAnswers[index], at: 0)
            } else {
                finalAnswersSet.append(arrayWithShuffledAnswers[index])
            }
        }
        
        /// Находим актуальный индекс правильного ответа
        for i in 0..<finalAnswersSet.count {
            if finalAnswersSet[i] == correctAnswer {
                correctAnswerNewPosition = i + 1
            }
        }
    
        /// Устанавливаем все перемешанные ответы на новые позиции
        func putShuffledAnswersToNewPositions(_ button: UIButton,
                                              _ index: Int) {
            button.titleLabel?.text = finalAnswersSet[index]
            button.setTitle(finalAnswersSet[index], for: .normal)
            if finalAnswersSet[index] == "" {
                animationChanging(false, button)
            }
        }
        putShuffledAnswersToNewPositions(optionA, 0)
        putShuffledAnswersToNewPositions(optionB, 1)
        putShuffledAnswersToNewPositions(optionC, 2)
        putShuffledAnswersToNewPositions(optionD, 3)
        
        finalButtonsSetToSend = finalAnswersSet
    }
    
    /// Запрос на новое корректное положение ответа
    func showCorrectPosition() -> Int {
        return correctAnswerNewPosition
    }
    
    /// Запрос на финальный questionSet
    func showFinalButtonsSet() -> [String] {
        return finalButtonsSetToSend
    }
    
    
    // MARK: Анимация кнопок
    /// Работает как на сокращение количества, так и на увеличение
    func animationChanging(_ returnVisibility: Bool, _ button: UIButton) {
        if returnVisibility {
            UIView.animate( withDuration: 0.2, delay: 0, usingSpringWithDamping: 1,
                            initialSpringVelocity: 0, options: [], animations: {
                                button.isHidden = false
            })
        } else {
            UIView.animate( withDuration: 0.2, delay: 0, usingSpringWithDamping: 1,
                            initialSpringVelocity: 0, options: [], animations: {
                                button.isHidden = true
            })
        }
    }
    
    
    // MARK: Изменение цвета кнопки при ответе
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

