
//  Created by Евгений Никитин on 22.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol HelpViewControllerDelegate: class {
    /// Дописать функцию
    /// Если нужно будет передавать что-нибудь из подсказки обратно в игру
}

class HelpViewController: UIViewController {
    
    @IBOutlet weak var helpTextLabel: UILabel!
    weak var delegate: HelpViewControllerDelegate?
    var questionID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHelpLabelText()
    }
    
    // Поиск нужной подсказки
    func setHelpLabelText() {
        for question in SelectedTopic.shared.questions {
            if question.questionId == questionID {
                helpTextLabel.text = question.helpText
            }
        }
    }
    
    @IBAction func backInGameButton(_ sender: HalfRoundButton) {
        dismiss(animated: true)
    }
}
