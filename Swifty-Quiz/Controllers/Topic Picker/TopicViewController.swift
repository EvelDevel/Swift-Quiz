
//  Created by Евгений Никитин on 14.05.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

protocol TopicViewControllerDelegate: class {
    func selectedCategory()
    func updateInitialFromTopicView()
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
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.selectedCategory()
        delegate?.updateInitialFromTopicView()
    }
    
    func setDefaultNumberOfQuestions() {
        numberOfQuestions.text = "\(SelectedTopic.shared.topic.topicName) (\(SelectedTopic.shared.topic.questionSet.count))"
    }
    
    func showAlertIfNeeded() {
        if Game.shared.records.count != 0 && Game.shared.records[0].continueGameStatus == true {
            let alert = UIAlertController(title: "Есть незавершенная игра!", message: "Если вы поменяете тему игры, вы потеряете возможность завершить последнюю игру по предыдущей теме до конца", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Продолжить", style: .default, handler: { action in })
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
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
        numberOfQuestions.text = "\(SelectedTopic.shared.topic.topicName) (\(SelectedTopic.shared.topic.questionSet.count))"
    }
    
    func showAlert() {
        self.showAlertIfNeeded()
    }
}
