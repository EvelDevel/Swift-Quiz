
//  Created by Евгений Никитин on 25.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class SettingCell: UITableViewCell {

    @IBOutlet weak var questionOrderControl: UISegmentedControl!
    @IBOutlet weak var questionTextControl: UISegmentedControl!
    @IBOutlet weak var helpAfterWrongAnswerControl: UISegmentedControl!
    @IBOutlet weak var changeAfterHelpControl: UISegmentedControl!
    @IBOutlet weak var saveRecordControl: UISegmentedControl!
    @IBOutlet weak var soundControl: UISegmentedControl!
    
    
    @IBOutlet var allControls: [UISegmentedControl]!
    
    @IBAction func settingSwitchSound(_ sender: Any) {
        SoundPlayer.shared.playSound(sound: .topicAndSettingsButton)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setControlsTintColors()
        addingTargets()
        settingsInitialValues()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
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
        saveRecordControl.addTarget(self, action: #selector(saveRecordValue), for: .valueChanged)
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
        // Настройка поведения при досрочном выходе из игры
        if Game.shared.settings.saveRecord == 0 {
            saveRecordControl.selectedSegmentIndex = 0
        } else {
            saveRecordControl.selectedSegmentIndex = 1
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
    
    /// Меняем настройку сохранения рекорда при досрочном выходе
    @objc func saveRecordValue(target: UISegmentedControl) {
        if target == self.saveRecordControl {
            let segmentIndex = target.selectedSegmentIndex
            if segmentIndex == 0 {
                Game.shared.setSaveRecord(setting: .dontSave)
            } else {
                Game.shared.setSaveRecord(setting: .save)
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
                Game.shared.setChangeAfterHelp(setting: .change)
            } else {
                Game.shared.setChangeAfterHelp(setting: .dontChange)
            }
        }
    }
}
