//
//  ViewController.swift
//  Sem_1
//
//  Created by Максим Троицкий on 05.09.2023.
//

import UIKit

class ViewController: UIViewController {
    var firstNumber: Double?
    var secondNumber: Double?
    var dotExist = false
    var currentOperation = "AC"
    var pressedEqual = false
    @IBOutlet weak var curNum: UILabel!
    @IBOutlet var collectionButton: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in collectionButton {
            button.layer.cornerRadius = button.frame.height / 2
        }
    }

    @IBAction func onNUMBERPRESSED(_ sender: UIButton) {
        guard let textNumber = sender.titleLabel?.text else {
            return
        }
        if curNum.text! == "0" {
            if !dotExist {
                if textNumber != "." {
                    curNum.text! = textNumber
                }
                else {
                    curNum.text! += "."
                    dotExist = true
                }
            }
        } else {
            if textNumber == "." {
                if !dotExist {
                    curNum.text! += "."
                    dotExist = true
                }
            } else {
                curNum.text! += textNumber
            }
        }
    }
    
    @IBAction func onOperationPressed(_ sender: UIButton) {
        guard let textOperation = sender.titleLabel?.text else {
            return
        }
        switch textOperation {
        case "AC":
            if curNum.text != "0" && (currentOperation != "" || currentOperation != "AC" || currentOperation != "=") {
                curNum.text = "0"
            } else {
                if currentOperation == "AC" || pressedEqual  {
                    curNum.text = "0";
                    dotExist = false;
                    currentOperation = "AC"
                } else {
                    currentOperation = "AC"
                }
            }
        case "+/-":
            let tempNumb = -Double(curNum.text!)!
            if (tempNumb == Double(Int(tempNumb))) {
                curNum.text = String(Int(tempNumb))
            } else {
                curNum.text = String(tempNumb)
            }
            currentOperation = textOperation
        default:
            firstNumber = Double(curNum.text!)
            curNum.text = "0"
            currentOperation = textOperation
            dotExist = false;
        }
        pressedEqual = false
    }
    
    @IBAction func equalPressed(_ sender: Any) {
        if !pressedEqual {
            secondNumber = Double(curNum.text!)
        }
        dotExist = false
        guard let textOperation = (sender as AnyObject).titleLabel?.text else {
            return
        }
        if textOperation == "=" {
            switch currentOperation {
            case "+":
                firstNumber! += secondNumber!
                if (firstNumber!.isEqual(to: Double(Int(firstNumber!)))) {
                    curNum.text = String(Int(firstNumber!))
                } else {
                    curNum.text = String(firstNumber!)
                }
                pressedEqual = true
            case "-":
                firstNumber! -= secondNumber!
                if (firstNumber!.isEqual(to: Double(Int(firstNumber!)))) {
                    curNum.text = String(Int(firstNumber!))
                } else {
                    curNum.text = String(firstNumber!)
                }
                pressedEqual = true
            case "×":
                firstNumber! *= secondNumber!
                if (firstNumber!.isEqual(to: Double(Int(firstNumber!)))) {
                    curNum.text = String(Int(firstNumber!))
                } else {
                    curNum.text = String(firstNumber!)
                }
                pressedEqual = true
            case "/":
                firstNumber! /= secondNumber!
                if (firstNumber!.isEqual(to: Double(Int(firstNumber!)))) {
                    curNum.text = String(Int(firstNumber!))
                } else {
                    curNum.text = String(firstNumber!)
                }
                pressedEqual = true
            case "%":
                firstNumber! *= secondNumber! / 100
                if (firstNumber!.isEqual(to: Double(Int(firstNumber!)))) {
                    curNum.text = String(Int(firstNumber!))
                } else {
                    curNum.text = String(firstNumber!)
                }
                pressedEqual = true
            default:
                curNum.text = "Err"
            }
        } else if textOperation == "%" {
            let tempNumb = firstNumber! * secondNumber! / 100
            if tempNumb == Double(Int(tempNumb)) {
                curNum.text = String(Int(tempNumb))
            } else {
                curNum.text = String(tempNumb)
            }
        }
    }
}

