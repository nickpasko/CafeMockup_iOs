/*
 Project: MockupCafe
 Copyright (C) 2017  Slava Anishchuk
 http://www.cybecor.com
 */

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelDescription: UILabel!
    @IBOutlet var labelPrice: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var btnAddToBasket: XButton!
}
