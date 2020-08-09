
//  Created by Евгений Никитин on 20.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class RecordCell: UITableViewCell {

    @IBOutlet weak var percentOfCorrect: UILabel!
    @IBOutlet weak var colorBackground: UIView!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var totalQuestionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var helpCounterLabel: UILabel!
    @IBOutlet weak var graySeparatorHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        graySeparatorHeight.constant = 1.0 / UIScreen.main.scale
    }
}
