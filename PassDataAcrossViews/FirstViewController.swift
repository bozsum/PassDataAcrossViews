import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate, Communicate {

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
        performSegue(withIdentifier: "goToSecondView", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationView = segue.destination as? SecondViewController else {
            fatalError("Destination is not SecondView")
        }
        
        destinationView.messageReceived = messageTextField.text!
        destinationView.delegate = self
    }
    
    
    func receiveMessage(message: String) {
        messageLabel.text = message
    }
}
