/*
 Project: MockupCafe
 Copyright (C) 2017  Slava Anishchuk
 http://www.cybecor.com
 */

import UIKit

class MainViewController: BaseViewController {

    @IBOutlet var btnMore: XButton!
    @IBOutlet var img1: UIImageView!
    @IBOutlet var img2: UIImageView!
    @IBOutlet var bannerImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func openProductList(type: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProductCollectionViewController") as! ProductCollectionViewController
        
        if (type == "burgers") {
            vc.setProducts(products: ProductService.sharedInstance.getBurgers())
        } else if (type == "coffe") {
            vc.setProducts(products: ProductService.sharedInstance.getCoffe())
        } else {
            let products = ProductService.sharedInstance.getCoffe() + ProductService.sharedInstance.getBurgers()
            vc.setProducts(products: products)
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func showBurgers(){
        self.openProductList(type: "burgers")
    }
    
    @IBAction func showCoffe(){
        self.openProductList(type: "coffe")
    }
    
    @IBAction func showAllProducts(){
        self.openProductList(type: "all")
    }
    
    func animation(){
        btnMore.center.y += 100
        img1.center.x -= 150
        img2.center.x += 150
        bannerImg.alpha = 0
        
        UIView.animate(withDuration: 0.75, animations: {
            self.btnMore.center.y -= 100
            self.img1.center.x += 150
            self.img2.center.x -= 150
            self.bannerImg.alpha = 1
        })
    }
}
