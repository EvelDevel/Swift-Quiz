
//  Created by Евгений Никитин on 30.06.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Маленькая, но приятная деталь:
        /// С лаунч-скрина мы попадаем на вьюшку
        /// С которой потом уходим на главную - через анимацию
        /// Задержка выставлена оптимальная, но при желании - можно поменять
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initial = mainStoryboard.instantiateViewController(withIdentifier: "InitialViewController") as! InitialViewController
            initial.modalPresentationStyle = .fullScreen
            self.present(initial, animated: true, completion: nil)
        }
    }
}
