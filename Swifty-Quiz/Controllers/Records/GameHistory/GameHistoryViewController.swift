
//  Created by Евгений Никитин on 09.08.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class GameHistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var history: [GameHistory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegistration()
    }
}


// MARK: Работа с таблицей
extension GameHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func cellRegistration() {
        tableView.register(UINib(nibName: "GameHistoryCell", bundle: nil), forCellReuseIdentifier: "GameHistoryCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameHistoryCell", for: indexPath) as? GameHistoryCell else {
            return UITableViewCell()
        }
        
        /// Настройка изображений
        cell.questionImage.image = nil
        cell.imageHeight.constant = 0
        cell.stackTopMargin.constant = 14
        
        if history[indexPath.row].image != "" {
            if let image = UIImage(named: "\(history[indexPath.row].image)") {
                cell.questionImage.image = UIImage(named: "\(history[indexPath.row].image)")
                let ratio = image.size.width / image.size.height
                let newHeight = cell.frame.width / (ratio + 0.1)
                cell.imageHeight.constant = newHeight - 55
                cell.stackTopMargin.constant = 20
            }
        }
        
        cell.questionNumber.text = "\(indexPath.row + 1)"
        cell.questionText.text = history[indexPath.row].question
        cell.correctAnswer.text = "Ответ: \(history[indexPath.row].correctAnswer)"
        cell.userAnswer.text = ""
        
        /// Цвет: Правильный или неправильный ответ
        if history[indexPath.row].correctAnswer == history[indexPath.row].userAnswer {
            cell.colorBack.backgroundColor = #colorLiteral(red: 0.1451225281, green: 0.7943774462, blue: 0.4165494442, alpha: 1)
        } else {
            cell.colorBack.backgroundColor = #colorLiteral(red: 0.9865071177, green: 0.3565812409, blue: 0.2555966675, alpha: 1)
            cell.userAnswer.text = "Ваш ответ: \(history[indexPath.row].userAnswer)"
        }
        
        return cell
    }
}
