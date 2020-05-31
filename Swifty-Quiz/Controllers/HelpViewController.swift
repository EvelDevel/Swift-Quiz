
//  Created by Евгений Никитин on 22.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol HelpViewControllerDelegate: class {
    func updateAfterHelp()
}

class HelpViewController: UIViewController {
    
    @IBOutlet weak var helpView: UIView!
    @IBOutlet weak var helpTextLabel: UILabel!
    @IBOutlet weak var backInGameButton: UIButton!
    @IBOutlet weak var separatorHeight: NSLayoutConstraint!
    
    weak var delegate: HelpViewControllerDelegate?
    var questionID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHelpLabelText()
        dismissOnClick()
        addShadows()
        setFontSize()
        makeThinSeparator()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        /// Обновляем вопрос в игре
        /// Если выбрана опция "переходить после подсказки"
        if Game.shared.settings.changeAfterHelp == 0 {
            delegate?.updateAfterHelp()
        }
    }
}


// MARK: Поиск нужной подсказки
extension HelpViewController {
    
    func setHelpLabelText() {
        for question in SelectedTopic.shared.topic.questionSet {
            if question.questionId == questionID {
                helpTextLabel.text = question.helpText
            }
        }
    }
}


// MARK: Обработка ухода с экрана
extension HelpViewController {
    
    func dismissOnClick() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(close))
        gestureRecognizer.cancelsTouchesInView = false
        gestureRecognizer.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(gestureRecognizer)
    }
    func dismissing() {
        dismiss(animated: true)
    }
    @objc func close() {
        dismissing()
    }
    /// Нажали на кнопку "вернуться в игру"
    @IBAction func backInGameButton(_ sender: HalfRoundButton) {
        SoundPlayer.shared.playSound(sound: .menuMainButton)
        dismissing()
    }
}


// MARK: Настройка теней и размера шрифта
extension HelpViewController {
    
    func makeThinSeparator() {
        separatorHeight.constant = 1.0 / UIScreen.main.scale
    }
    
    func setFontSize() {
        if view.frame.size.width <= 320 {
            helpTextLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .light)
        } else {
            helpTextLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        }
    }
    
    func addShadows() {
        /// Вьюшка с подсказкой
        helpView.layer.shadowColor = UIColor(red: 0.239, green: 0.282, blue: 0.341, alpha: 0.1).cgColor
        helpView.layer.shadowOpacity = 1
        helpView.layer.shadowRadius = 5
        helpView.layer.shadowOffset = CGSize(width: 0, height: 5)
        helpView.layer.position = helpView.center
        
        /// Кнопка "назад в игру"
        backInGameButton.layer.shadowColor = UIColor(red: 0.239, green: 0.282, blue: 0.341, alpha: 0.1).cgColor
        backInGameButton.layer.shadowOpacity = 1
        backInGameButton.layer.shadowRadius = 5
        backInGameButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        backInGameButton.layer.position = backInGameButton.center
    }
}
