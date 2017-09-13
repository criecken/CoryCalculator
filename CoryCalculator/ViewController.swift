//
//  ViewController.swift
//  CoryCalculator
//
//  Created by ABALab on 9/11/17.
//  Copyright © 2017 ABALab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var equalsButton: UIButton!
    @IBOutlet weak var negButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var decButton: UIButton!
    var inputText : Double = 0.0, firstNumText : Double = 0.0, decText = 0.0, wholeText = 0.0, ansText : Double = 0.0
    var outputText : String = ""
    var decCheck : Bool = false
    var orderCheckPlus : Bool = false
    var orderCheckMinus : Bool = false
    var count : Double = 1
    var operation : String = ""
    var oldOperation : String = ""
    var operOrder : Double = 0.0

   
    @IBAction func numberPress(_ sender: AnyObject) { //runs if any number is pressed
        let input : String = sender.currentTitle!!
        if input == "." {
            decCheck = true        }    //text will now fill after decimal
        else if input == "C" {
            if inputText == 0 {
                ansText = 0
            }
            else {
                firstNumText = 0
                decText = 0
                wholeText = 0
                decCheck = false
            }
        }
        else if decCheck {

            decText = decText*count + Double(input)!    // decimal written as whole number

  
        }
        else {
            wholeText = wholeText*10 + Double(input)!   //creates whole number input and increments each new input
        }
       count = 10
        while decText > 1 {         //converts whole number to decimal to be added at end of whole number
            decText = decText / 10
            count = count*10
            
        }
        inputText = wholeText + decText
        
        if abs(firstNumText) > 0 {
            outputText = "\(outputText) \(operation) \(inputText)"
            inputLabel.text = outputText
        }
        else {
            outputText = String(inputText)
            inputLabel.text = outputText
        }
        
        
    }
    
    
    @IBAction func negPress(_ sender: Any) {    //runs if negative button is pressed to change current value to negative
        inputText = -1*inputText
        inputLabel.text = String(inputText)
    }

    @IBAction func operandPress(_ sender: AnyObject) { //runs if an operation is specified
        operation = sender.currentTitle!!

        if orderCheckPlus{
            switch operation {
            case "+" , "-":
                if oldOperation == "X" {
                    ansText = operOrder + firstNumText*inputText
                }
                else if oldOperation == "/" {
                    ansText = operOrder + firstNumText/inputText
                }
            default:
                
            }
        }


        if oldOperation != "" {
            switch oldOperation {
            case "/":
                ansText = firstNumText / inputText
            case "X":
                ansText = firstNumText * inputText
            case "-":
                if operation == "+"{
                    ansText = firstNumText - inputText
                }
                else if operation == "-" {
                    ansText = firstNumText - inputText
                }
                else {
                    operOrder = firstNumText
                    orderCheckMinus = true
                }
        
            case "+":
                if operation == "+" {
                    ansText = firstNumText + inputText
                }
                else if operation == "-" {
                    ansText = firstNumText + inputText
                }
                else {
                    operOrder = firstNumText
                    orderCheckPlus = true
                }
            default:
                answerLabel.text = "Wrong!"
            }
        }

        firstNumText = inputText
        wholeText = 0
        decText = 0
        decCheck = false
        oldOperation = operation
       

    }
    
    @IBAction func updateAnswer(_ sender: Any) {
        switch operation {
        case "/":
            ansText = firstNumText / inputText
        case "X":
            ansText = firstNumText * inputText
        case "-":
            ansText = firstNumText - inputText
        case "+":
            ansText = firstNumText + inputText
        default:
            answerLabel.text = "Wrong!"
        }
        answerLabel.text = String(ansText)
        firstNumText = 0
        decText = 0
        wholeText = 0
        inputLabel.text = "0"
        decCheck = false
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        answerLabel.text = String(firstNumText)
        inputLabel.text = String(inputText)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

