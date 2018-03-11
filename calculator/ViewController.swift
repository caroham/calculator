//
//  ViewController.swift
//  calculator
//
//  Created by Carolyn Hampe on 3/10/18.
//  Copyright © 2018 Carolyn Hampe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var total: Double = 0
    var newNum: Double = 0
    var operation: String? = nil
    var equalPressed: Bool = false
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet var numBtns: [UIButton]!
    @IBOutlet var mathOpBtns: [UIButton]!
        
    @IBAction func numBtnPress(_ sender: UIButton) {
        let button = sender
        if let btnTxtUW = button.currentTitle, let totalLabelUW = totalLabel.text {
            var newTotal: String
            if totalLabelUW == "0" || (operation != nil && newNum == 0) || (operation != nil && equalPressed == true){
                newTotal = btnTxtUW
                equalPressed = false
            }
            else {
                newTotal = totalLabelUW + btnTxtUW
            }
            totalLabel.text = newTotal
            if let newTotalUW = Double(newTotal) {
                if operation != nil {
                    newNum = newTotalUW
                }
                else {
                    total = newTotalUW
                }
            }
        }
    }
    
    @IBAction func clearBtnPress(_ sender: UIButton) {
        clear()
    }
    
    @IBAction func mathOpPress(_ sender: UIButton) {
        let op = sender
        operation = op.currentTitle
    }
    
    @IBAction func negativePress(_ sender: UIButton) {
        total *= -1
        if total.truncatingRemainder(dividingBy: 1) == 0 {
            totalLabel.text = String(format: "%.0f", total)
        }
        else {
            totalLabel.text = String(total)
        }
    }
    
    @IBAction func equalBtnPress(_ sender: UIButton) {
        equalPressed = true
        if let opUW = operation {

            if opUW == "+" {
                total += newNum
            }
            else if opUW == "-" {
                total -= newNum
            }
            else if opUW == "x" {
                total *= newNum
            }
            else if opUW == "/" {
                total /= newNum
            }
            else if opUW == "%" {
                total = total.truncatingRemainder(dividingBy: newNum)
            }
            
            if total.truncatingRemainder(dividingBy: 1) == 0 {
                totalLabel.text = String(format: "%.0f", total)
            }
            else {
                totalLabel.text = String(total)
            }
        }
    }
    
    func clear() {
        total = 0
        newNum = 0
        operation = nil
        totalLabel.text = "0"
        equalPressed = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clear()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

