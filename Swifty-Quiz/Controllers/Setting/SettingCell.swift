
//  Created by Евгений Никитин on 25.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol SettingCellDelegate: AnyObject {
    func showInformationAlert(_ title: String, _ message: String)
}

class SettingCell: UITableViewCell {

    @IBOutlet weak var questionOrderControl: UISegmentedControl!
    @IBOutlet weak var questionTextControl: UISegmentedControl!
    @IBOutlet weak var helpAfterWrongAnswerControl: UISegmentedControl!
    @IBOutlet weak var changeAfterHelpControl: UISegmentedControl!
    @IBOutlet weak var soundControl: UISegmentedControl!
    @IBOutlet var allControls: [UISegmentedControl]!
    weak var delegate: SettingCellDelegate?
    
    @IBAction func settingSwitchSound(_ sender: Any) {
        SoundPlayer.shared.playSound(sound: .topicAndSettingsButton)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setControlsTintColors()
        addingTargets()
        settingsInitialValues()
    }
}


// MARK: Добавляем таргеты и определяем дефолтное состояние
extension SettingCell {
    
    func setControlsTintColors() {
        let inactive: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.5)
        let active: UIColor = #colorLiteral(red: 0.2377000451, green: 0.2814793885, blue: 0.335570693, alpha: 1)
        let normalColor = [NSAttributedString.Key.foregroundColor: inactive]
        let selectedColor = [NSAttributedString.Key.foregroundColor: active]
        
        for control in allControls {
            control.setTitleTextAttributes(normalColor, for: .normal)
            control.setTitleTextAttributes(selectedColor, for: .selected)
        }
    }
    
    func addingTargets() {
        questionOrderControl.addTarget(self, action: #selector(questionOrderValue), for: .valueChanged)
        questionTextControl.addTarget(self, action: #selector(questionTextShuffleValue), for: .valueChanged)
        soundControl.addTarget(self, action: #selector(soundValue), for: .valueChanged)
        changeAfterHelpControl.addTarget(self, action: #selector(changeAfterHelpValue), for: .valueChanged)
        helpAfterWrongAnswerControl.addTarget(self, action: #selector(helpAfterWrongValue), for: .valueChanged)
    }

    /// Определяем текущее состояние (если меняли настройку последовательности)
    func settingsInitialValues() {
        // Настройка порядка вопросов
        if Game.shared.settings.questionOrder == 0 {
            questionOrderControl.selectedSegmentIndex = 0
        } else {
            questionOrderControl.selectedSegmentIndex = 1
        }
        // Настройка формулировок вопроса
        if Game.shared.settings.questionTextShuffeling == 0 {
            questionTextControl.selectedSegmentIndex = 0
        } else {
            questionTextControl.selectedSegmentIndex = 1
        }
        // Настройка поведения подсказки при неправильном ответе
        if Game.shared.settings.helpAfterWrong == 0 {
            helpAfterWrongAnswerControl.selectedSegmentIndex = 0
        } else {
            helpAfterWrongAnswerControl.selectedSegmentIndex = 1
        }
        // Настройка звука
        if Game.shared.settings.sound == 0 {
            soundControl.selectedSegmentIndex = 0
        } else {
            soundControl.selectedSegmentIndex = 1
        }
        // Смена вопроса после подсказки
        if Game.shared.settings.changeAfterHelp == 0 {
            changeAfterHelpControl.selectedSegmentIndex = 0
        } else {
            changeAfterHelpControl.selectedSegmentIndex = 1
        }
    }
}


// MARK: Отслеживание изменений и настройка
extension SettingCell {
    
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
    
    /// Меняем настройку поведения подсказки при неправильном ответе
    @objc func helpAfterWrongValue(target: UISegmentedControl) {
        if target == self.helpAfterWrongAnswerControl {
            let segmentIndex = target.selectedSegmentIndex
            if segmentIndex == 0 {
                Game.shared.setHelpAfterWrong(setting: .proceed)
            } else {
                Game.shared.setHelpAfterWrong(setting: .help)
            }
        }
    }
    
    /// Меняем настройку звука
    @objc func soundValue(target: UISegmentedControl) {
        if target == self.soundControl {
            let segmentIndex = target.selectedSegmentIndex
            if segmentIndex == 0 {
                Game.shared.setSound(setting: .on)
            } else {
                Game.shared.setSound(setting: .off)
            }
        }
    }
    
    /// Меняем настройку смены вопроса после подсказки
    @objc func changeAfterHelpValue(target: UISegmentedControl) {
        if target == self.changeAfterHelpControl {
            let segmentIndex = target.selectedSegmentIndex
            if segmentIndex == 0 {
                Game.shared.setChangeAfterHelp(setting: .dontChange)
            } else {
                Game.shared.setChangeAfterHelp(setting: .change)
            }
        }
    }
}


// MARK: Работа с подсказками по настройкам
extension SettingCell {
    
    @IBAction func informationAboutSettingPressed(_ sender: UIButton) {
        var title = ""
        var message = ""
        SoundPlayer.shared.playSound(sound: .infoAboutSetting)
        
        switch sender.tag {
        case 1:
            title = "Последовательность вопросов"
            message = "В случае прямой последовательности вопросы каждую игру будут идти в одном порядке. Если вы выберете случайную последовательность, порядок вопросов никогда не повторится дважды."
        case 2:
            title = "Формулировка текста вопроса"
            message = "У каждого вопроса в игре есть несколько формулировок вопроса - от одной до трех. Если вы хотите сделать игру сложнее, включите изменение формулировок, тогда глазу будет труднее вспомнить вопрос."
        case 3:
            title = "При неправильном ответе"
            message = "После неправильного ответа вы можете просто идти дальше или получать теоретическую подсказку, которая поможет понимать сразу, какой ответ был правильным. Это замедляет ход игры, но делает ее более информативной."
        case 4:
            title = "Переход после подсказки"
            message = "После каждой подсказки вы можете автоматически переходить к следующему вопросу, а можете оставаться, чтобы еще раз внимательно прочитать вопрос и выбрать правильный ответ. После использования подсказки вам не будут засчитаны очки."
        default:
            print("Error with information about setting")
        }
        delegate?.showInformationAlert(title, message)
    }
}


// Последовательность вопросов
enum QuestionOrder {
	case straight
	case random
}
// Смена формулировок вопроса
enum QuestionText {
	case same
	case random
}
// Подсказка после неправильного ответа
enum HelpAfterWrong {
	case proceed
	case help
}
// Звук
enum Sound {
	case on
	case off
}
// Смена после подсказки
enum ChangeAfterHelp {
	case change
	case dontChange
}

