
//  Created by Евгений Никитин on 09.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class InitialViewController: UIViewController {
    
    let newGameSession = GameSession()
    @IBOutlet weak var lastScore: UILabel!
    @IBOutlet weak var totalQuestions: UILabel!
    
    @IBAction func startGame(_ sender: UIButton) {
        Game.gameSession = newGameSession
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gameView = GameViewController()
        gameView.delegate = self
    }
}

extension InitialViewController: GameViewControllerDelegate {
    func didEndGame(_ result: Int, _ totalQuestion: Int) {
       print("FINALLY")
       newGameSession.correctAnswers = result
       newGameSession.totalQuestions = totalQuestion
       lastScore.text = "Ваш последний счет: \(result)"
       totalQuestions.text = "Общее количество вопросов: \(totalQuestion)"
    }
}
