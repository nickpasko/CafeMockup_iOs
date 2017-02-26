/*
 Project: MockupCafe
 Copyright (C) 2017  Slava Anishchuk
 http://www.cybecor.com
 */

import UIKit
import MMDrawerController

class BaseViewController: UIViewController {
    
    var appDelegate: AppDelegate!
    
    override func viewDidLoad() {
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        initMenuButton()
    }
    
    
    func initMenuButton() {
        self.navigationItem.leftBarButtonItem = MMDrawerBarButtonItem(target: self, action: #selector(BaseViewController.toggleMenu))
        
        let image = UIImage(named: "icon-basket")        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(BaseViewController.openBasket))
    }
    
    func animateControlBar() {
        navigationController?.navigationBar.center.y -= 50
        navigationController?.navigationBar.alpha = 0
        UIView.animate(withDuration: 0.75, animations: {
            self.navigationController?.navigationBar.center.y += 50
            self.navigationController?.navigationBar.alpha = 0.95
        })
    }
    
    func toggleMenu() {
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
    
    func openBasket() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BasketViewController") as! BasketViewController    
        let navView = UINavigationController(rootViewController: vc)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer?.centerViewController = navView
    }
    
    func updateBasketBadge() {
        
    }
}
