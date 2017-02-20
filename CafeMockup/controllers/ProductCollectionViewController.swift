import UIKit

class ProductCollectionViewController: UICollectionViewController {
    
    struct Burger {
        var title: String
        var description: String
        var price: Float
        var image: String
    }
    
    private let burgers = [
        Burger(
            title: "Mockup Classic",
            description: "Build your own burger Available as a Single, Double, or Triple Patty",
            price: 0.99,
            image: "burger-classic.jpg"
        ),
        Burger(
            title: "Philly",
            description: "White American Cheese, Grilled Onions, Mushrooms",
            price: 1.20,
            image: "burger-philly.jpg"
        ),
        Burger(
            title: "Patty Melt",
            description: "Grilled Buttered Bun, Swiss Cheese, Grilled Onions, Thousand Island Dressing",
            price: 1.0,
            image: "burger-patty-melt.jpg"
        ),
        Burger(
            title: "Carolina",
            description: "Yellow American Cheese, Slaw, Chili, Onions, Mustard",
            price: 1.99,
            image: "burger-carolina.jpg"
        )
    ]
    
    
    override func viewDidLoad() {
        let image = UIImage(named: "icon-basket")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(ProductCollectionViewController.openBasket))
    }
    
    func openBasket() {}
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! ProductCollectionViewCell
        
        
        let index = arc4random_uniform(UInt32(3) + 1)
        let burger: Burger = burgers[Int(index)]
        
        cell.labelTitle.text = burger.title
        cell.labelPrice.text = String.init(format: "%.02f$", burger.price)
        cell.labelDescription.text = burger.description
        
        
        cell.imageView.image = UIImage(named: burger.image)
        
        
        cell.alpha = 0
        cell.center.x += 100
        UIImageView.animate(withDuration: 0.5, animations: {
            cell.center.x -= 100
            cell.alpha = 1
        })
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }
}
