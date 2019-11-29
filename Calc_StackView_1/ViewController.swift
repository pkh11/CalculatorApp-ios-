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
        switch sender.tag {
        case 0:
            value?.append(contentsOf: "0")
            break
        case 1:
            value?.append(contentsOf: "1")
            break
        case 2:
            value?.append(contentsOf: "2")
            break
        case 3:
            value?.append(contentsOf: "3")
            break
        case 4:
            value?.append(contentsOf: "4")
            break
        case 5:
            value?.append(contentsOf: "5")
            break
        case 6:
            value?.append(contentsOf: "6")
            break
        case 7:
            value?.append(contentsOf: "7")
            break
        case 8:
            value?.append(contentsOf: "8")
            break
        case 9:
            value?.append(contentsOf: "9")
            break
        default:
            break
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
            break
        case 60:
            // *
            stack.push(element: "*")
            break
        case 70:
            // -
            stack.push(element: "-")
            break
        case 80:
            // +
            stack.push(element: "+")
            break
        case 90:
            // =
            
            // TODO calculate
            calculate()
            break
        default:
            break
        }
    }
    func calculate(){
        
    }
    @IBAction func resetAction(_ sender: UIButton){
        resultLabel.text = "0"
        stack.removeAll()
    }
}

