import UIKit
import MMDrawerController


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var centerContainer: MMDrawerController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        initDrawer()
        
        return true
    }

    private func initDrawer(){
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let centerVC = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        
        let leftDrawerVC = storyboard.instantiateViewController(withIdentifier: "DrawerViewController") as! DrawerViewController
        
        let centerNav = UINavigationController(rootViewController: centerVC)
        let leftSideNav = UINavigationController(rootViewController: leftDrawerVC)
        
        centerContainer = MMDrawerController(center: centerNav, leftDrawerViewController: leftSideNav)
        centerContainer!.openDrawerGestureModeMask = MMOpenDrawerGestureMode.panningCenterView
        centerContainer!.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.panningCenterView
        window!.rootViewController = centerContainer
        window!.makeKeyAndVisible()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

}

