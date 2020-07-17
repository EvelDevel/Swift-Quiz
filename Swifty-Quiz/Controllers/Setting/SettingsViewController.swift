
//  Created by Евгений Никитин on 19.04.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol SettingsViewControllerDelegate: class {
    func updateInitialView()
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    weak var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegistration()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        delegate?.updateInitialView()
    }
    
    func showAlertIfNeeded() {
        /// Показываем алерт о том, что есть незавершенная игра, чтобы пользователь не сбросил ее
        /// Проверяем, что у нас есть незавершенная игра, проверяем, что алерт еще не был показан
        if Game.shared.records.count != 0 && Game.shared.records[0].continueGameStatus == true {
            if Game.shared.showSettingsAlertStatus() != true {
                let alert = UIAlertController(title: "Есть незавершенная игра", message: "Если вы измените настройки, выберете другую тему, или ответите хотя бы на один вопрос новой игры, вы потеряете возможность закончить незавершенную игру", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Продолжить", style: .default, handler: { action in })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
            /// Выставляем что показали алерт, и больше не показываем до перезапуска приложения
            Game.shared.setThatWeShowedAlert()
        }
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
        tableView.separatorColor = #colorLiteral(red: 0.9432304886, green: 0.9432304886, blue: 0.9432304886, alpha: 1)
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
    
    func showAlert() {
        self.showAlertIfNeeded()
    }
}
