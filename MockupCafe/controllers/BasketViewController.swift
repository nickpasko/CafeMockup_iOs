/*
 Project: MockupCafe
 Copyright (C) 2017  Slava Anishchuk
 http://www.cybecor.com
 */

import UIKit

class BasketViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var lblBasketIsEmpty: UILabel!
    private var basket = ProductService.sharedInstance.getBasket()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        Animator.fadeIn(view: lblBasketIsEmpty, callback: {})
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if ( indexPath.row >= basket.count ) {
            return getTotalCell(indexPath: indexPath)
        }
        return getProductCell(indexPath: indexPath)
    }
    
    private func getProductCell(indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! ProductCollectionViewCell
        
        let product: Product = basket[indexPath.row]
        cell.labelTitle.text = product.title
        cell.labelPrice.text = String.init(format: "%.02f$", product.price)
        cell.labelDescription.text = product.description
        cell.imageView.image = UIImage(named: product.image)
        return cell
    }
    
    private func getTotalCell(indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "totalCellID", for: indexPath) as! ProductTotalCollectionViewCell
        cell.labelTitle.text = String.init(format: "Total: %.2f$", ProductService.sharedInstance.getTotalSum())
        
        cell.btnCleanBasket.addTarget(self, action: #selector(BasketViewController.cleanBasket(sender:)), for: UIControlEvents.touchUpInside)
        
        return cell
    }
    
    func cleanBasket(sender: XButton) {
        Animator.fadeOut(view: collectionView, callback: {
            ProductService.sharedInstance.cleanBasket()
            self.basket = ProductService.sharedInstance.getBasket()
            self.collectionView.reloadData()
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if ( basket.count < 1 ) {
            collectionView.isHidden = true
            return 0   
        }
        collectionView.isHidden = false
        return basket.count + 1
    }
    
}
