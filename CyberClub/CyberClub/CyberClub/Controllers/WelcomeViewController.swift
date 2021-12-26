import UIKit

class WelcomeViewController: UIViewController {
    let defaultValues = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if defaultValues.string(forKey: "username") != nil{
            self.performSegue(withIdentifier: K.welcomeSegue, sender: self)
        }
        // Do any additional setup after loading the view.
    }

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
