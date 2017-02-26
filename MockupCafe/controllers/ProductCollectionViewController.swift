/*
 Project: MockupCafe
 Copyright (C) 2017  Slava Anishchuk
 http://www.cybecor.com
 */

import UIKit

class ProductCollectionViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView!
    private var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func setProducts(products: [Product]){
        self.products = products
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! ProductCollectionViewCell        
        
        let product: Product = products[indexPath.row]
        
        cell.labelTitle.text = product.title
        cell.labelPrice.text = String.init(format: "%.02f$", product.price)
        cell.labelDescription.text = product.description
        
        cell.imageView.image = UIImage(named: product.image)
        
        cell.btnAddToBasket.tag = indexPath.row
        cell.btnAddToBasket.addTarget(self, action: #selector(ProductCollectionViewController.addToBasket(sender:)), for: UIControlEvents.touchUpInside)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func addToBasket(sender: UIButton) {
        ProductService.sharedInstance.addToBasket(product: products[sender.tag])
        sender.isEnabled = false
        UIView.animate(withDuration: 0.2, animations: {
           sender.alpha = 0.3
        }, completion: nil)
    }
}
