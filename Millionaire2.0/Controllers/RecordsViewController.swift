
//  Created by Евгений Никитин on 12.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class RecordsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cleanRecords: UIButton!
    
    @IBAction func cleanRecords(_ sender: UIButton) {
        Game.shared.clearRecords()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegistration()
    }
    
    func cellRegistration() {
        tableView.register(UINib(nibName: "RecordCell", bundle: nil), forCellReuseIdentifier: "RecordCell")
    }
}

///

// MARK: Настройка таблицы
extension RecordsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath) as? RecordCell
            else { return UITableViewCell() }
        
        let record = Game.shared.records[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        
        if record.percentOfCorrectAnswer! < 30 {
            cell.colorBackground.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        } else if record.percentOfCorrectAnswer! < 70 {
            cell.colorBackground.backgroundColor = #colorLiteral(red: 1, green: 0.8070752121, blue: 0.1738902499, alpha: 1)
        } else {
            cell.colorBackground.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }
            
        cell.playedCounterLabel.text = "Пройдено вопросов: \(record.playedNum ?? 0)"
        cell.helpCounterLabel.text = "Подсказки: \(record.helpCounter ?? 0)"
        cell.percentOfCorrect.text = "\(record.percentOfCorrectAnswer ?? 0)%"
        cell.topicLabel.text = "\(record.topic ?? "")"
        cell.dateLabel.text = "Дата: \(dateFormatter.string(from: record.date ?? Date()))"
        cell.totalQuestionLabel.text = "Всего вопросов: \(record.totalQuestion ?? 0)"
        cell.scoreLabel.text = "Очки: \(record.score ?? 0)"
        
        return cell
    }
}
