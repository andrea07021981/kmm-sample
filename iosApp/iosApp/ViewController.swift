//
//  ViewController.swift
//  iosApp
//
//  Created by Andrea Franco on 2020-11-28.
//

import UIKit

class ViewController: UIViewController {
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
        viewManager.doGreetings()
        //Looks for single or multiple taps.
         let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
    }

    @IBAction func calculateButton(_ sender: UIButton) {
        if let first = firstTextField.text, let second = secondTextField.text {
            viewManager.doOperation(firstNum: Int32(first) ?? 0, secondNum: Int32(second) ?? 0)
        }
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

extension ViewController : ViewManagerDelegate {
    func didCalculationComplete(total: Int) {
        totalTextField.text = String(total)
    }
    
    func didGreetings(greet: String) {
        greetingsLabel.text = greet
    }
}
