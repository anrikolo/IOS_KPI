import Alamofire
import UIKit

class RegisterViewController: UIViewController {
    
    //URL user register
    let URL_USER_REGISTER = "http://localhost:8080/CyberClub/v1/register.php"
    
    //UI objects
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func haveAccPressed(_ sender: UIButton) {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(loginViewController, animated: true)
        self.dismiss(animated: false, completion: nil)
        
    }
    @IBAction func registerPressed(_ sender: UIButton) {
        if usernameTextField.text!.isEmpty || passwordTextField.text!.isEmpty || emailTextField.text!.isEmpty || phoneNumTextField.text!.isEmpty || nameTextField.text!.isEmpty || surnameTextField.text!.isEmpty{
            // red placeholder
            usernameTextField.attributedPlaceholder = NSAttributedString(string: "Enter username", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            passwordTextField.attributedPlaceholder = NSAttributedString(string: "Enter password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            emailTextField.attributedPlaceholder = NSAttributedString(string: "Enter email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            phoneNumTextField.attributedPlaceholder = NSAttributedString(string: "Enter phone number", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            nameTextField.attributedPlaceholder = NSAttributedString(string: "Enter name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            surnameTextField.attributedPlaceholder = NSAttributedString(string: "Enter surname", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            
            // if text if entered
        } else {
            let parameters: Parameters = [
                "username":usernameTextField.text!,
                "password":passwordTextField.text!,
                "name":nameTextField.text!,
                "surname":surnameTextField.text!,
                "email":emailTextField.text!,
                "phone":phoneNumTextField.text!
            ]
            
            //Sending http post request
            Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                //print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    //displaying the message in label
                    self.labelMessage.text = jsonData.value(forKey: "message") as! String?
                }
            }
        }
    }
    
}

