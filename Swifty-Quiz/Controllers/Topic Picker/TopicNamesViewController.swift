//
//  TopicNamesViewController.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 14.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.
//

import UIKit

class TopicNamesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegistration()
    }
}



// MARK: Настройка таблицы
extension TopicNamesViewController: UITableViewDataSource {
    
    /// Регистрация ячейки
    func cellRegistration() {
        tableView.register(UINib(nibName: "TopicCategoryCell", bundle: nil), forCellReuseIdentifier: "TopicCategoryCell")
    }
    /// Количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    /// Настройка ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCategoryCell", for: indexPath) as? TopicCategoryCell
            else { return UITableViewCell() }
        
        return cell
    }
}
