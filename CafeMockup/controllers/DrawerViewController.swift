import UIKit

class DrawerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let menuItems = ["Home","Basket","Settings", "Sign In"]
    
    @IBOutlet var tabelView: UITableView!
    
    override func viewDidLoad() {
        tabelView.delegate = self
        tabelView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var viewController: UIViewController!
        
        switch indexPath.row {
            case 1:
                viewController = storyboard.instantiateViewController(withIdentifier: "BasketViewController") as! BasketViewController
                break
            case 2:
                viewController = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            break
            default:
                viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            break
        }
        
        if ( viewController != nil ) {
            let navView = UINavigationController(rootViewController: viewController)
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
