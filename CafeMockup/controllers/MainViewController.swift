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

