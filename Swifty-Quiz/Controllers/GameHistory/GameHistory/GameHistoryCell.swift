
//  Created by Евгений Никитин on 09.08.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol GameHistoryCellDelegate: class {
    func reportButtonPressed(id: Int)
}

class GameHistoryCell: UITableViewCell {

    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var colorBack: UIView!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var userAnswer: UILabel!
    @IBOutlet weak var correctAnswer: UILabel!
    @IBOutlet weak var separatorHeight: NSLayoutConstraint!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var stackTopMargin: NSLayoutConstraint!
    
    weak var delegate: GameHistoryCellDelegate?
    var questionId = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        separatorHeight.constant = 1.0 / UIScreen.main.scale
    }
    
    /// Нажатие на "репорт" о вопросе
    @IBAction func reportButtonTapped(_ sender: Any) {
        delegate?.reportButtonPressed(id: questionId)
    }
}
