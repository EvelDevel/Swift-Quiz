
//  Created by Евгений Никитин on 19.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.


import UIKit

// MARK: Настройка последовательности вопросов
enum QuestionOrder {
    case straight
    case random
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var questionOrderControl: UISegmentedControl!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        questionOrderInitialValue()
        questionOrderControl.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
    }
    
    /// Определяем текущее состояние (если меняли настройку последовательности)
    func questionOrderInitialValue() {
        if Game.shared.getQuestionOrderSatus() == QuestionOrder.straight {
            questionOrderControl.selectedSegmentIndex = 0
        } else {
            questionOrderControl.selectedSegmentIndex = 1
        }
    }
    
    /// Меняем настройку последовательности при переключении
    @objc func selectedValue(target: UISegmentedControl) {
        if target == self.questionOrderControl {
            let segmentIndex = target.selectedSegmentIndex
            
            if segmentIndex == 0 {
                print("Saving .straight")
                Game.shared.setQuestionOrder(order: .straight)
            } else {
                print("Saving .random")
                Game.shared.setQuestionOrder(order: .random)
            }
        }
    }
}
