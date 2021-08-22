
//  Created by Евгений Никитин on 22.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol HelpViewControllerDelegate: AnyObject {
    func updateAfterHelp()
    func refreshTappedAnswerStatus()
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
        setHelp()
        addDismissOnClick()
        addShadows()
        setFontSize()
        makeThinSeparator()
    }
    
    /// Переход к следующему вопросу
    /// Или обновление статуса нажатого ответа
    override func viewWillDisappear(_ animated: Bool) {
        if Game.shared.settings.changeAfterHelp == 1 {
            delegate?.updateAfterHelp()
        } else {
            delegate?.refreshTappedAnswerStatus()
        }
    }
    
    /// Устанавливаем корректную теорию в подсказку
    private func setHelp() {
        for question in SelectedTopic.shared.topic.questionSet {
            if question.questionId == questionID {
                helpTextLabel.text = question.helpText
            }
        }
    }
}


// MARK: Dismissing 
extension HelpViewController {
    
    /// Сворачиваем подсказку по клику на пустое место контроллера
    private  func addDismissOnClick() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(close))
        gestureRecognizer.cancelsTouchesInView = false
        gestureRecognizer.delegate = self as? UIGestureRecognizerDelegate
        view.addGestureRecognizer(gestureRecognizer)
    }
    @objc func close() {
        dismissing()
    }
    
    private func dismissing() {
        dismiss(animated: true)
    }
    
    /// Нажали на кнопку "вернуться в игру"
    @IBAction func backInGameButton(_ sender: UIButton) {
        SoundPlayer.shared.playSound(sound: .menuMainButton)
        dismissing()
    }
}


// MARK: User Interface
extension HelpViewController {
    
    private func makeThinSeparator() {
        separatorHeight.constant = 1.0 / UIScreen.main.scale
    }
    
    private func setFontSize() {
		let width = UIScreen.main.bounds.size.width
        
		if width <= 320 {
            helpTextLabel.font = UIFont.systemFont(ofSize: 12.0, weight: .light)
        } else {
            helpTextLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        }
    }
    
    private func addShadows() {
        let shadows = ShadowsHelper()
        shadows.addHelpShadows(button: backInGameButton, view: helpView)
    }
}
