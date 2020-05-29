
//  Created by Евгений Никитин on 19.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol SettingsViewControllerDelegate: class {
    func updateInitialFromSettingView()
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    weak var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegistration()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.updateInitialFromSettingView()
    }
}


// MARK: Настройка таблицы
extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func cellRegistration() {
        tableView.register(UINib(nibName: "SettingCell", bundle: nil), forCellReuseIdentifier: "SettingCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as? SettingCell else { return UITableViewCell() }
        cell.delegate = self
        return cell
    }
}


// MARK: Работа с делегатом SettingCellDelegate
extension SettingsViewController: SettingCellDelegate {
    func showInformationAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: .alert)
        let quitAction = UIAlertAction(title: "Вернуться", style: .default, handler: { action in })
        alert.addAction(quitAction)
        present(alert, animated: true, completion: nil)
    }
}
