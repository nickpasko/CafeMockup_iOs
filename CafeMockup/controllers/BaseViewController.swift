import UIKit
import MMDrawerController

class BaseViewController: UIViewController {
    
    var appDelegate: AppDelegate!
    
    override func viewDidLoad() {
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        initLeftMenuButton()
    }
    
    
    func initLeftMenuButton() {
        self.navigationItem.leftBarButtonItem = MMDrawerBarButtonItem(target: self, action: #selector(BaseViewController.toggleMenu))
    }
    
    func toggleMenu() {
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
}
