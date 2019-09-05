//
//  FractionCalc.swift
//  calculator
//
//  Created by Miki Takahashi on 2019/09/05.
//  Copyright © 2019 MikiTakahashi. All rights reserved.
//

import UIKit

class FractionCalc: UIViewController {
    
    @IBOutlet var answerLabel: UILabel!
    
    // IBOutlet cllection でググって
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var bgViews: [UIView]!
    
    var number1: Int = 0
    var number2: Int = 1
    var number3: Int = 2
    
    var ope: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in buttons {
            button.layer.cornerRadius = 8
        }
        for v in bgViews {
            v.layer.cornerRadius = 16
        }
    }
    
    @IBAction func numberButtonSelected(sender: UIButton) {
        let selectedNumber = sender.tag
        number1 = number1*10 + selectedNumber
        
        answerLabel.text = String(number1)
    }
    
    @IBAction func operationButtonSelectes(sender: UIButton) {
        let selectedOperation = sender.tag
        ope = selectedOperation
        
        number2 = number1
        number1 = 0
        
    }
    
    @IBAction func enableFractionMode() {
        
    }
    
    @IBAction func equal() {
        switch ope {
        case 1:
            number3 = number1 + number2
        case 2:
            number3 = number1 - number2
        case 3:
            number3 = number1 * number2
        case 4:
            number3 = number1 / number2
        default:
            break
        }
        answerLabel.text = String(number3)
    }
    
    @IBAction func clear() {
        number1 = 0
        number2 = 0
        number3 = 0
        ope = 0
        
        answerLabel.text = ""
    }

}
