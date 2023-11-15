
//  Created by Евгений Никитин on 20.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

final class RecordCell: UITableViewCell {
    @IBOutlet private weak var percentOfCorrect: UILabel!
    @IBOutlet private weak var colorBackground: UIView!
    @IBOutlet private weak var topicLabel: UILabel!
    @IBOutlet private weak var totalQuestionLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    
    struct CellModel {
        let percent: String
        let color: UIColor
        let topic: String
        let totalQuestions: String
        let score: String
    }
    
    func fill(_ data: CellModel) {
        percentOfCorrect.text = data.percent
        colorBackground.backgroundColor = data.color
        topicLabel.text = data.topic
        totalQuestionLabel.text = data.totalQuestions
        scoreLabel.text = data.score
    }
    
    func setCompleteBackground() {
        // TODO: -
        // Перенести цвет в палитру
        backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 0.2)
    }
    
    override func prepareForReuse() {
        // TODO: -
        // Создать в константах все цвета статиком
        backgroundColor = UIColor(named: "MainBackground")
    }
}
