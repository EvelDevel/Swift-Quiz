//
//  StatsViewController.swift
//  Swifty-Quiz
//
//  Created by Евгений Никитин on 22.07.2023.
//  Copyright © 2023 Evel-Devel. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension StatsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
