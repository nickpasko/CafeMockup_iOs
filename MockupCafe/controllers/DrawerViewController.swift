/*
 Project: MockupCafe
 Copyright (C) 2017  Slava Anishchuk
 http://www.cybecor.com
 */

import UIKit

class DrawerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let menuItems = ["Home","Basket","Settings"]
    let menuIndex = (Home: 0, Basket: 1, Settings: 2)
    
    @IBOutlet var tabelView: UITableView!
    
    override func viewDidLoad() {
        tabelView.delegate = self
        tabelView.dataSource = self
        
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var vc: UIViewController!
        
        switch indexPath.row {
            case menuIndex.Home:
                vc = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            break
            case menuIndex.Basket:
                vc = storyboard.instantiateViewController(withIdentifier: "BasketViewController") as! BasketViewController
                break
            case menuIndex.Settings:
                vc = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            break
            default:
            return
        }
        
        if ( vc != nil ) {
            let navView = UINavigationController(rootViewController: vc)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.centerContainer?.centerViewController = navView
            appDelegate.centerContainer?.toggle(.left, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelView.dequeueReusableCell(withIdentifier: "cellID")! as UITableViewCell
        cell.textLabel?.text = menuItems[indexPath.row]
        return cell
    }
}
