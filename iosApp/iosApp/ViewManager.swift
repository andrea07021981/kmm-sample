//
//  ViewManager.swift
//  iosApp
//
//  Created by Andrea Franco on 2020-11-28.
//  Copyright © 2020 orgName. All rights reserved.
//

import Foundation
import shared

protocol ViewManagerDelegate {
    func didCalculationComplete(total: Int)
    func didGreetings(greet: String)
}
struct ViewMamager {
    
    var delegate: ViewManagerDelegate?
    
    func doOperation(firstNum: Int32, secondNum: Int32) {
        let total = Calculator().sumNumbers(firstValue: firstNum, secondValue: secondNum)
        
        self.delegate?.didCalculationComplete(total: Int(total))
    }
    
    func doGreetings() {
        let greets = Greeting().greeting() as String
        self.delegate?.didGreetings(greet: greets)
    }
}
