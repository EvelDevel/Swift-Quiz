
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
    }
}

extension RecordsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell", for: indexPath)
        let record = Game.shared.records[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        cell.textLabel?.font = UIFont(name:"Avenir", size:16)
        cell.textLabel?.text =  "\(dateFormatter.string(from: record.date ?? Date())). " +
                                "Вопросов: \(record.totalQuestion ?? 0). " +
                                "Набрано очков: \(record.score ?? 0)"
        return cell
    }
}
