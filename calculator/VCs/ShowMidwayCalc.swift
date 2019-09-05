//
//  ShowMidwayCalc.swift
//  calculator
//
//  Created by Miki Takahashi on 2019/09/05.
//  Copyright © 2019 MikiTakahashi. All rights reserved.
//

import UIKit

class ShowMidwayCalc: UIViewController {
    
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var midWayLabel: UILabel!
    
    // IBOutlet cllection でググって
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var bgViews: [UIView]!
    
    var number1: Int = 0
    var number2: Int = 1
    var number3: Int = 2
    
    var ope: Int = 0
    
    var midway: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in buttons {
            button.layer.cornerRadius = 8
        }
        for v in bgViews {
            v.layer.cornerRadius = 16
        }
        midWayLabel.adjustsFontSizeToFitWidth = true
    }
    
    @IBAction func numberButtonSelected(sender: UIButton) {
        let selectedNumber = sender.tag
        number1 = number1*10 + selectedNumber
        
        midway += String(selectedNumber)
        
        answerLabel.text = String(number1)
    }
    
    @IBAction func operationButtonSelectes(sender: UIButton) {
        let selectedOperation = sender.tag
        ope = selectedOperation
        
        switch selectedOperation {
        case 1:
            midway += "+"
        case 2:
            midway += "-"
        case 3:
            midway += "×"
        case 4:
            midway += "÷"
        default:
            break
        }
        
        number2 = number1
        number1 = 0
        midWayLabel.text = midway
    }
    
    @IBAction func equal() {
        switch ope {
        case 1:
            number3 = number1 + number2
        case 2:
            number3 = number2 - number1
        case 3:
            number3 = number1 * number2
        case 4:
            number3 = number2 / number1
        default:
            break
        }
        answerLabel.text = String(number3)
        number1 = number3
        number2 = 0
        ope = 0
        
        midWayLabel.text = midway + "="
    }
    
    @IBAction func clear() {
        number1 = 0
        number2 = 0
        number3 = 0
        ope = 0
        
        answerLabel.text = ""
        midWayLabel.text = ""
    }

}
