import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    var messageReceived = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTextField.delegate = self
        messageLabel.text = messageReceived
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
