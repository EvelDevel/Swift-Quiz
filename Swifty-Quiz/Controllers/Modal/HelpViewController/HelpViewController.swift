
//  Created by Евгений Никитин on 22.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol HelpViewControllerDelegate: AnyObject {
    func updateAfterHelp()
    func refreshTappedAnswerStatus()
}

class HelpViewController: UIViewController {

    @IBOutlet private weak var helpView: UIView!
    @IBOutlet private weak var helpTextLabel: UILabel!
    @IBOutlet private weak var dismissButton: UIButton!
    @IBOutlet private weak var separatorHeight: NSLayoutConstraint!
    
    private var boldTextService = BoldTextService()
    
    weak var delegate: HelpViewControllerDelegate?
    var questionID: Int = 0
    var fontSize: CGFloat = 12
    var helpText: String = ""
    var isFromHistory: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
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

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if Game.shared.settings.changeAfterHelp == 1 {
            /// Если после подсказки переходим
            delegate?.updateAfterHelp()
        } else {
            /// Если после подсказки мы остаемся на вопросе
            /// Даем пользователю нажать второй ответ
            delegate?.refreshTappedAnswerStatus()
        }
    }
}


// MARK: Main
extension HelpViewController {
    
    private func setup() {
        setupFontSize()
        setupViewCornerCurve()
        setupHelpText()
        setupThinSeparator()
    }
    
    private func setupViewCornerCurve() {
        if #available(iOS 13.0, *) {
            helpView.layer.cornerCurve = .continuous
        } else {}
    }
    
    private func setupHelpText() {
        if isFromHistory {
            helpTextLabel.attributedText = boldTextService.createBoldTextAnswer(
                helpText,
                fontSize: fontSize
            )
        } else {
            for question in SelectedTopic.shared.topic.questionSet {
                if question.questionId == questionID {
                    helpTextLabel.attributedText = boldTextService.createBoldTextAnswer(
                        question.helpText,
                        fontSize: fontSize
                    )
                }
            }
        }
    }
    
    private func setupThinSeparator() {
        separatorHeight.constant = 1.0 / UIScreen.main.scale
    }
    
    private func setupFontSize() {
        let width = UIScreen.main.bounds.size.width
        
        if width <= 320 {
            fontSize = 12
            
            helpTextLabel.font = UIFont.systemFont(
                ofSize: 12.0,
                weight: .light
            )
        } else {
            fontSize = 14
            
            helpTextLabel.font = UIFont.systemFont(
                ofSize: 14.0,
                weight: .light
            )
        }
    }
}


// MARK: Dismissing 
extension HelpViewController {

    @IBAction private func backInGameButton(_ sender: UIButton) {
        SoundPlayer.shared.playSound(sound: .buttonTapped)
        dismissView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         let touch = touches.first
         
        if touch?.view != self.helpView {
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
