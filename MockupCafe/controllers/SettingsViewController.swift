/*
 Project: MockupCafe
 Copyright (C) 2017  Slava Anishchuk
 http://www.cybecor.com
*/

import UIKit


class SettingsViewController: BaseViewController {
    @IBOutlet var viewLayer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Animator.fadeIn(view: viewLayer, callback: {})
    }
}
