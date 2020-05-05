
//  Created by Евгений Никитин on 22.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol HelpViewControllerDelegate: class {
    func updateAfterHelp()
}

class HelpViewController: UIViewController {
    
    @IBOutlet weak var helpTextLabel: UILabel!
    weak var delegate: HelpViewControllerDelegate?
    var questionID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHelpLabelText()
        dismissOnClick()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.updateAfterHelp()
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
