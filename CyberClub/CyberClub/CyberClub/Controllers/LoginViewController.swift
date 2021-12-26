import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    let URL_USER_LOGIN = "http://localhost:8080/CyberClub/v1/login.php"
    
    //the defaultvalues to store user data
    let defaultValues = UserDefaults.standard
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        //if user is already logged in switching to profile screen
        if defaultValues.string(forKey: "username") != nil{
            self.performSegue(withIdentifier: K.barSegue, sender: self)
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if usernameTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            
            usernameTextField.attributedPlaceholder = NSAttributedString(string: "Enter username", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            passwordTextField.attributedPlaceholder = NSAttributedString(string: "Enter password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            
        } else {
            //getting the username and password
            let parameters: Parameters=[
                "username":usernameTextField.text!,
                "password":passwordTextField.text!
            ]
            
            //making a post request
            Alamofire.request(URL_USER_LOGIN, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                //print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    let jsonData = result as! NSDictionary
                    
                    //if there is no error
                    if(!(jsonData.value(forKey: "error") as! Bool)){
                        
                        //getting the user from response
                        let user = jsonData.value(forKey: "user") as! NSDictionary
                        
                        //getting user values
                        let userId = user.value(forKey: "id") as! Int
                        let userName = user.value(forKey: "username") as! String
                        let userEmail = user.value(forKey: "email") as! String
                        let userPhone = user.value(forKey: "phone") as! String
                        
                        //saving user values to defaults
                        self.defaultValues.set(userId, forKey: "userid")
                        self.defaultValues.set(userName, forKey: "username")
                        self.defaultValues.set(userEmail, forKey: "useremail")
                        self.defaultValues.set(userPhone, forKey: "userphone")
                        
                        //switching the screen
                        self.performSegue(withIdentifier: K.barSegue, sender: self)
                        
                    } else {
                        //error message in case of invalid credential
                        self.messageLabel.text = "Invalid username or password"
                    }
                }
            }
        }
    }
    
    
}


/*
 let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
 self.navigationController?.pushViewController(profileViewController, animated: true)
 
 self.dismiss(animated: false, completion: nil)
 */
