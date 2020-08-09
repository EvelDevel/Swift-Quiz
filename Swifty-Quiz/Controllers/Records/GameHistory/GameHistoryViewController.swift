
//  Created by Евгений Никитин on 09.08.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class GameHistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var gameDate: UILabel!
    @IBOutlet weak var gameTopic: UILabel!
    @IBOutlet weak var gameProgress: UILabel!
    @IBOutlet weak var gameResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegistration()
    }
}


extension GameHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func cellRegistration() {
        tableView.register(UINib(nibName: "GameHistoryCell", bundle: nil), forCellReuseIdentifier: "GameHistoryCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameHistoryCell", for: indexPath) as? GameHistoryCell
        else {
            return UITableViewCell()
        }
        
        return cell
    }
}
