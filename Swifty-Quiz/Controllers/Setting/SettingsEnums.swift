//
//  SettingsEnums.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 09.04.2022.
//  Copyright © 2022 Evel-Devel. All rights reserved.
//

import Foundation

enum QuestionOrder {
    case straight
    case random
}

enum QuestionText {
    case same
    case random
}

enum HelpAfterWrong {
    case proceed
    case help
}

enum Sound {
    case on
    case off
}

enum ChangeAfterHelp {
    case change
    case dontChange
}
