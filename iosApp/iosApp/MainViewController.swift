import UIKit
import shared

class MainViewController: UIViewController {
//    let calculator = Calculator.Companion()
//    let greet = Greeting().greeting()
    private var viewManager = ViewMamager()
    
    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    @IBOutlet var greetingsLabel: UILabel!
    @IBOutlet var totalTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewManager.delegate = self
    }

    @IBAction func calculateButton(_ sender: UIButton) {
        if let first = firstTextField.text, let second = secondTextField.text {
            viewManager.doOperation(firstNum: Int(first) ?? 0, secondNum: Int(second) ?? 0)
        }
    }
}

extension MainViewController : ViewManagerDelegate {
    func didCalculationComplete(total: Int) {
        totalTextField.text = String(total)
    }
    
    func didGreetings(greet: String) {
        greetingsLabel.text = greet
    }
    
   
}
