
//  Created by Евгений Никитин on 19.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit
import AVFoundation

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var questionOrderControl: UISegmentedControl!
    @IBOutlet weak var questionTextControl: UISegmentedControl!
    @IBOutlet weak var endGameControl: UISegmentedControl!
    @IBOutlet weak var saveRecordControl: UISegmentedControl!
    
    private var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addingTargets()
        settingsInitialValues()
    }
    
    /// Звуки смены положения пикеров
    @IBAction func settingSwitchSound(_ sender: Any) {
        guard let url = Bundle.main.url(forResource: "button2", withExtension: "wav") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch { print("Error witn button sound on settings view") }
    }
    
    func addingTargets() {
        questionOrderControl.addTarget(self, action: #selector(questionOrderValue), for: .valueChanged)
        questionTextControl.addTarget(self, action: #selector(questionTextShuffleValue), for: .valueChanged)
        endGameControl.addTarget(self, action: #selector(endGameValue), for: .valueChanged)
        saveRecordControl.addTarget(self, action: #selector(saveRecordValue), for: .valueChanged)
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
        // Настройка поведения при неправильном ответе
        if Game.shared.settings.endGame == 0 {
            endGameControl.selectedSegmentIndex = 0
        } else {
            endGameControl.selectedSegmentIndex = 1
        }
        // Настройка поведения при досрочном выходе из игры
        if Game.shared.settings.saveRecord == 0 {
            saveRecordControl.selectedSegmentIndex = 0
        } else {
            saveRecordControl.selectedSegmentIndex = 1
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
    
}
