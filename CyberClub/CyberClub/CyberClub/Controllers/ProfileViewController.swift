import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.navigationItem.hidesBackButton = true
        
        
        // hiding back button
//        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
//        navigationItem.leftBarButtonItem = backButton
        
        //getting user data from defaults
        let defaultValues = UserDefaults.standard
        print("\n---- DEADULT VALUES ----\n",defaultValues)
        if let name = defaultValues.string(forKey: "username"){
            //setting the name to label
            usernameLabel.text = name
        }else{
            //send back to login view controller
            self.navigationController?.popToRootViewController(animated: true)
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        //removing values from default
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
        
        //switching to login screen
//        let WelcomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
//        self.navigationController?.pushViewController(WelcomeViewController, animated: true)
//        self.dismiss(animated: false, completion: nil)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

extension UIImageView {

    func makeRounded() {

        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
