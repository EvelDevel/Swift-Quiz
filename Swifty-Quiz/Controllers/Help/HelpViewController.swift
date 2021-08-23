
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
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var separatorHeight: NSLayoutConstraint!
    
    weak var delegate: HelpViewControllerDelegate?
    var questionID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHelpText()
        setShadows()
        setBlur()
        setFontSize()
        setThinSeparator()
        setAlpha()
    }
    
    /// Переход к следующему вопросу, обновление статуса нажатого ответа
    override func viewWillDisappear(_ animated: Bool) {
        if Game.shared.settings.changeAfterHelp == 1 {
            delegate?.updateAfterHelp()
        } else {
            delegate?.refreshTappedAnswerStatus()
        }
    }
    
    private func setHelpText() {
        for question in SelectedTopic.shared.topic.questionSet {
            if question.questionId == questionID {
                helpTextLabel.text = question.helpText
            }
        }
    }
    
    private func setAlpha() {
        view.alpha = 1
    }
    
    private func setBlur() {
        let effect = UIBlurEffect(style: .regular)
        let blur = UIVisualEffectView(effect: effect)
        blur.frame = self.view.bounds
        blur.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(blur, at: 0)
    }
    
    private func setShadows() {
        let shadows = Shadow()
        shadows.addHalfButtonShadows([dismissButton])
    }
    
    private func setThinSeparator() {
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
}


// MARK: Dismissing 
extension HelpViewController {

    @IBAction func backInGameButton(_ sender: UIButton) {
        SoundPlayer.shared.playSound(sound: .menuMainButton)
        dismissing()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         let touch = touches.first
         if touch?.view != self.helpView {
            dismissing()
        }
    }
    
    private func dismissing() {
        dismiss(animated: true)
        
        UIView.animate(withDuration: 0.22) {
            self.view.alpha = 0
        }
    }
}
