import UIKit
import Alamofire

class DetailViewController: UIViewController {
    
    @IBOutlet weak var numPcLabel: UILabel!
    @IBOutlet weak var pcImg: UIImageView!
    @IBOutlet weak var specLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    
    var name = ""
    var pcType = ""
    //var imgUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numPcLabel.text = "PC №\(name)"
        switch pcType {
        case "Standart":
            pcImg.image = UIImage(named: "Standart.png")
            specLabel.text = K.SpecPc.standart
        case "Pro":
            pcImg.image = UIImage(named: "Pro.png")
            specLabel.text = K.SpecPc.pro
        case "VIP":
            pcImg.image = UIImage(named: "VIP.png")
            specLabel.text = K.SpecPc.vip
        default:
            pcImg.image = UIImage(named: "Standart.png")
            specLabel.text = K.SpecPc.standart

        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func orderPressed(_ sender: UIButton) {
        //Sending http post request
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
