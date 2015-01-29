
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animatedBackground : UIImageView!
    
    var imageListArray : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for countVlaue in 1...5{
            
            var strImageName : String = "\(countVlaue).png"
            var image = UIImage(named: strImageName)
            imageListArray.addObject(image!)
            
        }
        
        self.animatedBackground.animationImages = imageListArray
        self.animatedBackground.animationDuration = 5.0
        self.animatedBackground.startAnimating()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}

