
//  Created by Евгений Никитин on 19.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func updateInitialView()
}

class SettingsViewController: UIViewController {
    
    @IBOutlet private var settingsView: UIView!
    
    @IBOutlet private weak var dismissButton: RoundCornerButton!
    @IBOutlet private weak var questionOrderControl: UISegmentedControl!
    @IBOutlet private weak var questionTextControl: UISegmentedControl!
    @IBOutlet private weak var helpAfterWrongAnswerControl: UISegmentedControl!
    @IBOutlet private weak var changeAfterHelpControl: UISegmentedControl!
    @IBOutlet private weak var soundControl: UISegmentedControl!
    @IBOutlet private weak var separatorHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet private var allControls: [UISegmentedControl]!
    
    @IBAction func settingSwitchSound(_ sender: Any) {
        SoundPlayer.shared.playSound(sound: .topicAndSettingsButton)
    }
    
    weak var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        delegate?.updateInitialView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.alpha = 0
        
        UIView.animate(
            withDuration: 0.2,
            animations: ({
                self.view.alpha = 1
            })
        )
    }
    
    private func setup() {
        setupViewCornerCurve()
        setupControlsTintColors()
        setupTargets()
        setupInitialControlsState()
        setupSeparator()
    }
    
    private func setupViewCornerCurve() {
        if #available(iOS 13.0, *) {
            settingsView.layer.cornerCurve = .continuous
        } else {}
    }
    
    private func setupSeparator() {
        separatorHeightConstraint.constant = 1 / UIScreen.main.scale
    }
}

// MARK: Dismissing
extension SettingsViewController {
    
    @IBAction private func backInGameButton(_ sender: UIButton) {
        SoundPlayer.shared.playSound(
            sound: .buttonTapped
        )
        
        dismissView()
    }
    
    override func touchesBegan(
        _ touches: Set<UITouch>,
        with event: UIEvent?
    ) {
        let touch = touches.first
        
        if touch?.view != self.settingsView {
            dismissView()
        }
    }
    
    private func dismissView() {
        UIView.animate(
            withDuration: 0.3,
            animations: ({
                self.view.alpha = 0
            }),
            completion: ({ _ in
                self.dismiss(animated: false)
            })
        )
    }
}


// MARK: Controls handler
extension SettingsViewController {
    
    func setupControlsTintColors() {
        let inactive: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.5)
        let active: UIColor = #colorLiteral(red: 0.2377000451, green: 0.2814793885, blue: 0.335570693, alpha: 1)
        
        let normalColor = [NSAttributedString.Key.foregroundColor: inactive]
        let selectedColor = [NSAttributedString.Key.foregroundColor: active]
        
        for control in allControls {
            control.setTitleTextAttributes(
                normalColor,
                for: .normal
            )
            control.setTitleTextAttributes(
                selectedColor,
                for: .selected
            )
        }
    }
    
    func setupTargets() {
        questionOrderControl.addTarget(
            self,
            action: #selector(questionOrderValue),
            for: .valueChanged
        )
        
        questionTextControl.addTarget(
            self,
            action: #selector(questionTextShuffleValue),
            for: .valueChanged
        )
        
        soundControl.addTarget(
            self,
            action: #selector(soundValue),
            for: .valueChanged
        )
        
        changeAfterHelpControl.addTarget(
            self,
            action: #selector(changeAfterHelpValue),
            for: .valueChanged
        )
        
        helpAfterWrongAnswerControl.addTarget(
            self,
            action: #selector(helpAfterWrongValue),
            for: .valueChanged
        )
    }

    func setupInitialControlsState() {
        
        // Question order
        if Game.shared.settings.questionOrder == 0 {
            questionOrderControl.selectedSegmentIndex = 0
        } else {
            questionOrderControl.selectedSegmentIndex = 1
        }
        
        // Text shuffling
        if Game.shared.settings.questionTextShuffling == 0 {
            questionTextControl.selectedSegmentIndex = 0
        } else {
            questionTextControl.selectedSegmentIndex = 1
        }
        
        // Hints
        if Game.shared.settings.helpAfterWrong == 0 {
            helpAfterWrongAnswerControl.selectedSegmentIndex = 0
        } else {
            helpAfterWrongAnswerControl.selectedSegmentIndex = 1
        }
        
        // Sound
        if Game.shared.settings.sound == 0 {
            soundControl.selectedSegmentIndex = 0
        } else {
            soundControl.selectedSegmentIndex = 1
        }
        
        // Change after help
        if Game.shared.settings.changeAfterHelp == 0 {
            changeAfterHelpControl.selectedSegmentIndex = 0
        } else {
            changeAfterHelpControl.selectedSegmentIndex = 1
        }
    }
}


// MARK: Detect changes
extension SettingsViewController {
    
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


// MARK: Help text
extension SettingsViewController {
    
    func showInformationAlert(
        _ title: String,
        _ message: String
    ) {
        let alert = UIAlertController(
            title: "\(title)",
            message: "\(message)",
            preferredStyle: .alert
        )
        
        let quitAction = UIAlertAction(
            title: "Вернуться в игру",
            style: .default,
            handler: nil
        )
        
        alert.addAction(quitAction)
        
        present(
            alert,
            animated: true,
            completion: nil
        )
    }
    
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
        
        showInformationAlert(title, message)
    }
}
