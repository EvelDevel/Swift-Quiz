
//  Created by Евгений Никитин on 09.10.2020.
//  Copyright © 2020 Evel-Devel. All rights reserved.

import UIKit

class HistoryHintController: UIViewController {

	@IBOutlet weak var hintView: UIView!
	@IBOutlet weak var dismissButton: RoundCornerButton!
	@IBOutlet weak var separatorHeight: NSLayoutConstraint!
	
    @IBOutlet weak var hintTextLabel: UILabel! {
        didSet {
            hintTextLabel.text = helpText
        }
    }
    
    var helpText: String = ""
	
	override func viewDidLoad() {
        super.viewDidLoad()
        setupViewCornerCurve()
        setupThinSeparator()
        setupFontSize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.alpha = 0
        
        UIView.animate(
            withDuration: 0.2,
            animations: ({
                self.view.alpha = 1
            })
        )
    }
    
    private func setupViewCornerCurve() {
        if #available(iOS 13.0, *) {
            hintView.layer.cornerCurve = .continuous
        } else {}
    }
    
    private func setupThinSeparator() {
        separatorHeight.constant = 1.0 / UIScreen.main.scale
    }
    
    private func setupFontSize() {
        let width = view.frame.size.width
        hintTextLabel.font = width <= 320 ? UIFont.systemFont(ofSize: 12.0) : UIFont.systemFont(ofSize: 14.0)
    }
}


// MARK: Dismissing
extension HistoryHintController {
	
    @IBAction func backToHistoryTapped(_ sender: Any) {
        SoundPlayer.shared.playSound(sound: .menuMainButton)
        dismissView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         let touch = touches.first
         if touch?.view != self.hintView {
            dismissView()
        }
    }
	
	private func dismissView() {
        UIView.animate(
            withDuration: 0.3,
            animations: ({
                self.view.alpha = 0
            }),
            completion: ({ _ in
                self.dismiss(animated: false)
            })
        )
	}
}
