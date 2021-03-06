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
        performSegue(withIdentifier: "goToSecondView", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationView = segue.destination as? SecondViewController else {
            fatalError("Destination is not SecondView")
        }
        
        destinationView.messageReceived = messageTextField.text!
    }
    
    @IBAction func receiveMessage(unwind: UIStoryboardSegue) {
        guard let sourceView = unwind.source as? SecondViewController else {
            fatalError("Source is not SecondView")
        }
        
        messageLabel.text = sourceView.messageTextField.text!
    }
}
