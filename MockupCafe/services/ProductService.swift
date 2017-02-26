/*
 Project: MockupCafe
 Copyright (C) 2017  Slava Anishchuk
 http://www.cybecor.com
*/

import Foundation

class ProductService {
    
    static let sharedInstance = ProductService()
    private var basket:[Product] = []
    
    // Mock Products
    private let burgers = [
        Product(
            title: "Mockup Classic",
            description: "Build your own burger Available as a Single, Double, or Triple Patty",
            price: 0.99,
            image: "burger-classic.jpg"
        ),
        Product(
            title: "Philly",
            description: "White American Cheese, Grilled Onions, Mushrooms",
            price: 1.20,
            image: "burger-philly.jpg"
        ),
        Product(
            title: "Patty Melt",
            description: "Grilled Buttered Bun, Swiss Cheese, Grilled Onions, Thousand Island Dressing",
            price: 1.0,
            image: "burger-patty-melt.jpg"
        ),
        Product(
            title: "Carolina",
            description: "Yellow American Cheese, Slaw, Chili, Onions, Mustard",
            price: 1.99,
            image: "burger-carolina.jpg"
        )
    ]
    
    private let coffe = [
        Product(title: "Espresso", description: "No description", price: 3, image: "coffe-paper-cup.jpg"),
        Product(title: "Latte", description: "No description", price: 3.5, image: "coffe-paper-cup.jpg"),
        Product(title: "Americano", description: "No description", price: 2, image: "coffe-paper-cup.jpg"),
        Product(title: "Espresso Con Panna", description: "No description", price: 2, image: "coffe-paper-cup.jpg")
    ]
    
    private init(){}
    
    func getBurgers() -> [Product] {
        return self.burgers
    }
    
    func getCoffe() -> [Product] {
        return self.coffe;
    }
    
    func cleanBasket(){
        basket.removeAll()
    }
    
    func addToBasket(product: Product) {
        basket.append(product)
    }
    
    func getBasket() -> [Product] {
        return basket
    }
    
    func getTotalSum() -> Float {
        var sum: Float = 0
        for product in basket {
            sum += product.price
        }
        return sum
    }
}
