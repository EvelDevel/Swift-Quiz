
//  Created by Евгений Никитин on 25.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

/// Все в Int - 0 (default) - 1 (changed)

struct Settings: Codable {
    var questionOrder: Int
    var questionTextShuffeling: Int
    var endGame: Int
    var saveRecord: Int
    var sound: Int
    var changeAfterHelp: Int
}
