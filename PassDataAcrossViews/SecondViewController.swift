import UIKit

protocol Communicate {
    func receiveMessage(message: String)
}

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    var messageReceived = ""
    var delegate: Communicate?
    
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
        if let delegate = delegate {
            delegate.receiveMessage(message: messageTextField.text!)
        }
        
        dismiss(animated: true, completion: nil)
    }
}
