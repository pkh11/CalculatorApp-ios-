//
//  ViewController.swift
//  Calc_StackView_1
//
//  Created by 박균호 on 01/11/2019.
//  Copyright © 2019 박균호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btnDot: UIButton!
    @IBOutlet weak var btnEqual: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnMultiple: UIButton!
    @IBOutlet weak var btnDivide: UIButton!
    @IBOutlet weak var btnRemain: UIButton!
    @IBOutlet weak var btnPlusMinus: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    
    var stack = Stack<String>()
    var valueStack = Stack<Int>()
    var operatorStack = Stack<String>()
    var operationButtonOn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.layer.cornerRadius = 20
        //resultLabel.layer.masksToBounds = true
        // masksToBounds : 곡률을 설정해서 나머지 부분 제거
        resultLabel.clipsToBounds = true
        // clipsToBounds : masksToBounds 동일
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        btn0.layer.cornerRadius = btn0.bounds.height / 2
        btn1.layer.cornerRadius = btn1.bounds.width / 2
        btn2.layer.cornerRadius = btn2.bounds.width / 2
        btn3.layer.cornerRadius = btn3.bounds.width / 2
        btn4.layer.cornerRadius = btn4.bounds.width / 2
        btn5.layer.cornerRadius = btn5.bounds.width / 2
        btn6.layer.cornerRadius = btn6.bounds.width / 2
        btn7.layer.cornerRadius = btn7.bounds.width / 2
        btn8.layer.cornerRadius = btn8.bounds.width / 2
        btn9.layer.cornerRadius = btn9.bounds.width / 2
        btnDot.layer.cornerRadius = btnDot.bounds.width / 2
        btnEqual.layer.cornerRadius = btnEqual.bounds.width / 2
        btnPlus.layer.cornerRadius = btnPlus.bounds.width / 2
        btnMinus.layer.cornerRadius = btnMinus.bounds.width / 2
        btnMultiple.layer.cornerRadius = btnMultiple.bounds.width / 2
        btnDivide.layer.cornerRadius = btnDivide.bounds.width / 2
        btnRemain.layer.cornerRadius = btnRemain.bounds.width / 2
        btnPlusMinus.layer.cornerRadius = btnPlusMinus.bounds.width / 2
        btnReset.layer.cornerRadius = btnReset.bounds.width / 2
    }

    @IBAction func numberAction(_ sender: UIButton!){
        var value = resultLabel.text
        
        if value == "0"{
            value = ""
        }
        if operationButtonOn{
            value = ""
            value?.append(contentsOf: String(sender.tag))
            operationButtonOn = false
        }else{
            value?.append(contentsOf: String(sender.tag))
        }
        resultLabel.text = value
    }
    
    @IBAction func operatorAction(_ sender: UIButton){
        let value = resultLabel.text ?? ""
        stack.push(element: value)
        
        switch sender.tag {
        case 30:
            // +/-
            break
        case 40:
            // %
            break
        case 50:
            // /
            stack.push(element: "/")
            changeButtonColor(sender)
            break
        case 60:
            // *
            stack.push(element: "*")
            changeButtonColor(sender)
            break
        case 70:
            // -
            stack.push(element: "-")
            changeButtonColor(sender)
            break
        case 80:
            // +
            stack.push(element: "+")
            changeButtonColor(sender)
            break
        case 90:
            // =
            operationButtonOn = false
            calculate()
            break
        default:
            break
        }
    }
    func calculate(){
//        print(stack)
        // TODO: calculate stack value
        var prefix = [String]()
        var postfix = [String]()
        for _ in 0..<stack.count{
            prefix.append(stack.removeFirst() ?? "")
        }
        
        // 중위표기배열 -> 후위표기배열 변환
        for idx in 0..<prefix.count{
            let postfixValue = prefix[idx]
            if postfixValue == "+" ||
                postfixValue == "-" ||
                postfixValue == "*" ||
                postfixValue == "/"{
                operatorStack.push(element: postfixValue)
            }else{
                postfix.append(postfixValue)
            }
        }
        for _ in 0..<operatorStack.count{
            if !operatorStack.isEmpty {
                postfix.append(operatorStack.pop() ?? "")
            }
        }
        // 후위표기법 계산
        for idx in 0..<postfix.count{
            let operatorValue = postfix[idx]
            if operatorValue == "+"{
                guard let number1 = valueStack.pop() else { return }
                guard let number2 = valueStack.pop() else { return }
                let result = number1+number2
                valueStack.push(element: result)
            }else if operatorValue == "-" {
                guard let number1 = valueStack.pop() else { return }
                guard let number2 = valueStack.pop() else { return }
                let result = number1-number2
                valueStack.push(element: result)
            }else if operatorValue == "*"{
                guard let number1 = valueStack.pop() else { return }
                guard let number2 = valueStack.pop() else { return }
                let result = number1*number2
                valueStack.push(element: result)
            }else if operatorValue == "/"{
                guard let number1 = valueStack.pop() else { return }
                guard let number2 = valueStack.pop() else { return }
                let result = number1/number2
                valueStack.push(element: result)
            }else{
                valueStack.push(element: Int(operatorValue)!)
            }
        }
        resultLabel.text = String(valueStack.pop()!)
    }
    func changeButtonColor(_ sender: UIButton){
        operationButtonOn = true
//        sender.backgroundColor? = UIColor.white
//        sender.setTitleColor(UIColor.orange, for: .normal)
    }
    @IBAction func resetAction(_ sender: UIButton){
        resultLabel.text = "0"
        stack.removeAll()
    }
}

