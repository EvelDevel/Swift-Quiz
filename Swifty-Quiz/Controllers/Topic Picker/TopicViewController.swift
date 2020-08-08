
//  Created by Евгений Никитин on 14.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol TopicViewControllerDelegate: class {
    func selectedCategory()
    func updateInitialView()
}

class TopicViewController: UIViewController {
    
    @IBOutlet weak var numberOfQuestions: UILabel!
    @IBOutlet weak var tableView: UITableView!
    weak var delegate: TopicViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegistration()
        setDefaultNumberOfQuestions()
    }
    
    /// Обновляем выбранную категорию моментально
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.selectedCategory()
        /// Сохраняем текущую версию при смене категории (на всякий случай, для отслеживания обновлений)
        let currentAppVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
        Game.shared.saveAppVersion(version: currentAppVersion)
    }
    
    /// Обновляем (убираем) кнопку "продолжить" при смене темы с задержкой
    override func viewDidDisappear(_ animated: Bool) {
        delegate?.updateInitialView()
    }
    
    func setDefaultNumberOfQuestions() {
        if SelectedTopic.shared.topic.topicTag < 10 {
            numberOfQuestions.text = SelectedTopic.shared.topic.topicName
        } else {
            numberOfQuestions.text = "\(SelectedTopic.shared.topic.topicName) (\(SelectedTopic.shared.topic.questionSet.count))"
        }
    }
    
    func showAlertIfNeeded() {
        /// Показываем алерт о том, что есть незавершенная игра, чтобы пользователь не сбросил ее
        /// Проверяем, что у нас есть незавершенная игра, проверяем, что алерт еще не был показан
        if Game.shared.records.count != 0 && Game.shared.records[0].continueGameStatus == true {
            if Game.shared.showTopicAlertStatus() != true {
                let alert = UIAlertController(title: "Есть незавершенная игра", message: "Если вы выберете другую тему, ответите хотя бы на один вопрос новой игры или измените настройки, вы потеряете возможность закончить незавершенную игру", preferredStyle: .alert)
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
extension TopicViewController: UITableViewDataSource, UITableViewDelegate {
    
    func cellRegistration() {
        tableView.register(UINib(nibName: "CategoriesCell", bundle: nil), forCellReuseIdentifier: "CategoriesCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath) as? CategoriesCell else { return UITableViewCell() }
        cell.delegate = self
        return cell
    }
}


// MARK: Работа с делегатом CategoriesCell
extension TopicViewController: CategoriesCellDelegate {
    
    func updateNumberOfQuestions() {
        if SelectedTopic.shared.topic.topicTag < 10 {
            numberOfQuestions.text = SelectedTopic.shared.topic.topicName
        } else {
            numberOfQuestions.text = "\(SelectedTopic.shared.topic.topicName) (\(SelectedTopic.shared.topic.questionSet.count))"
        }
    }
    
    func showAlert() {
        self.showAlertIfNeeded()
    }
}
