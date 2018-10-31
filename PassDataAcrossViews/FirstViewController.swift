import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTextField.delegate = self
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // hide keyboard
        messageTextField.resignFirstResponder()
        
        return true
    }
    
    
    @IBAction func hideKeyboard(_ sender: UITapGestureRecognizer) {
        messageTextField.resignFirstResponder()
    }
    
    
    @IBAction func sendMessageButton(_ sender: UIButton) {
        
    }
}
