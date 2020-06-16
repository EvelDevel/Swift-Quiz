
//  Created by Евгений Никитин on 16.06.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import Foundation

class AllPatternsSet {
    static func getQuestions() -> [Question] {
        
        var allGuideQuestions: [Question] = []
        
        ///
        allGuideQuestions.append(contentsOf: BasicPatternsSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: AdvancedPatternsSet.getQuestions().shuffled())
        ///
        allGuideQuestions.append(contentsOf: ArchitecturalPatternsSet.getQuestions().shuffled())
        allGuideQuestions.append(contentsOf: AntipatternsSet.getQuestions().shuffled())
        
        return allGuideQuestions.shuffled()
    }
}
