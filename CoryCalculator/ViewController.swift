//
//  ViewController.swift
//  CoryCalculator
//
//  Created by ABALab on 9/11/17.
//  Copyright © 2017 ABALab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var answerLabel: UILabel!        //Label filled at equals press
    @IBOutlet weak var inputLabel: UILabel!         //Label filled as user inputs values
    @IBOutlet weak var clearButton: UIButton!       //clears input, then answer label
    @IBOutlet weak var divideButton: UIButton!      //division button
    @IBOutlet weak var multiplyButton: UIButton!    //multiply button
    @IBOutlet weak var minusButton: UIButton!       //minus button
    @IBOutlet weak var plusButton: UIButton!        //plus button
    @IBOutlet weak var eightButton: UIButton!       //number 8
    @IBOutlet weak var sevenButton: UIButton!       //number 7
    @IBOutlet weak var nineButton: UIButton!        //number 9
    @IBOutlet weak var fourButton: UIButton!        //number 4
    @IBOutlet weak var fiveButton: UIButton!        //number 5
    @IBOutlet weak var sixButton: UIButton!         //number 6
    @IBOutlet weak var oneButton: UIButton!         //number 1
    @IBOutlet weak var twoButton: UIButton!         //number 2
    @IBOutlet weak var threeButton: UIButton!       //number 3
    @IBOutlet weak var equalsButton: UIButton!      //equals button
    @IBOutlet weak var negButton: UIButton!         //negative button
    @IBOutlet weak var zeroButton: UIButton!        //zero button
    @IBOutlet weak var decButton: UIButton!         //decimal button
    var inputText : Double = 0.0, firstNumText : Double = 0.0, decText = 0.0, wholeText = 0.0, ansText : Double = 0.0
    //Numbers used for calculation and displaying answers
    var outputText : String = ""        //output displayed on screen to show whole equation
    var decCheck : Bool = false         //check for decimal input
    var orderCheckPlus : Bool = false   //Order of operations check
    var orderCheckMinus : Bool = false  //Order of operations check
    var count : Double = 1              //Count for decimal places
    var operation : String = ""         //filler for current operation
    var oldOperation : String = ""      //filer for previous operation
    var operOrder : Double = 0.0        //Placeholder if PEMDAS affects order of operations

   
    @IBAction func numberPress(_ sender: AnyObject) { //runs if any number is pressed
        let input : String = sender.currentTitle!!
        if input == "." {
            decCheck = true        }    //text will now fill after decimal
        else if input == "C" {
            if inputText == 0 {         //clears answer if input is already clear
                ansText = 0
            }
            else {
                firstNumText = 0        //set all relevant values to zero, reset decimals
                decText = 0
                wholeText = 0
                decCheck = false
            }
            answerLabel.text = String(ansText)  //diplay 0 to show cleared answer
            operOrder = 0
        }
        else if decCheck {

            decText = decText*count + Double(input)!    // decimal written as whole number

  
        }
        else {
            wholeText = wholeText*10 + Double(input)!   //creates whole number input and increments each new input
        }
       count = 10
        while decText > 1 {         //converts whole number to decimal to be added at end of whole number (<1)
            decText = decText / 10
            count = count*10
            
        }
        inputText = wholeText + decText //adds whole number and decimal
        
        if abs(firstNumText) > 0 {                                  //more than one number
            outputText = "\(outputText) \(operation) \(inputText)"  //increments math equation
            inputLabel.text = outputText                            //displays whole equation
        }
        else {                                                      //one number
            outputText = String(inputText)                          //creates initial equation
            inputLabel.text = outputText                            //displays equation
        }
        
        
    }
    
    
    @IBAction func negPress(_ sender: Any) {    //runs if negative button is pressed to change current value to negative
        inputText = -1*inputText                //changes value to negative
        inputLabel.text = String(inputText)     //displays value
    }

    @IBAction func operandPress(_ sender: AnyObject) { //runs if an operation is specified
        operation = sender.currentTitle!!
        

        if orderCheckPlus{                          //check for order of operations on old eq. (operOrder + firstNumText*inputText - example)
            switch operation {                      //looks at current operation
            case "+" , "-":                         //if op. is add or subtract we can add all numbers to get a single answer
                if oldOperation == "X" {            //look at which operation
                    ansText = operOrder + firstNumText*inputText    //perform operation
                    oldOperation = ""               //reset
                    orderCheckPlus = false          //reset
                }
                else if oldOperation == "/" {       //look for operaton
                    ansText = operOrder + firstNumText/inputText    //perform operation
                    oldOperation = ""               //reset
                    orderCheckPlus = false          //reset

                }
            default:
                    orderCheckPlus = true           //come back to this next time
            }
        }
        
        if orderCheckMinus{                     //alternative order of ops check, same as before with (-) instead of (+)
            switch operation {
            case "+" , "-":
                if oldOperation == "X" {
                    ansText = operOrder - firstNumText*inputText
                    oldOperation = ""
                    orderCheckMinus = false
                }
                else if oldOperation == "/" {
                    ansText = operOrder - firstNumText/inputText
                    oldOperation = ""
                    orderCheckMinus = false
                    
                }
            default:
                orderCheckMinus = true
            }
        }


        if oldOperation != "" {                             //if you hit more than one operation button
            switch oldOperation {                           //look at old op, check for order of operations
            case "/":                                       //no need for order of ops
                ansText = firstNumText / inputText          //do math
            case "X":                                       //no need for order of ops
                ansText = firstNumText * inputText          //do math
            case "-":                                       //potential need for order of ops
                if operation == "+"{                        //no need
                    ansText = firstNumText - inputText      //do math
                }
                else if operation == "-" {                   //no need
                    ansText = firstNumText - inputText      //do math
                }
                else {                                      //PEMDAS failed otherwise
                    operOrder = firstNumText                //insert placeholder
                    orderCheckMinus = true                  //check for it at the beginning of next button press
                }
        
            case "+":                                       //potential need for order of ops - same rules as (-)
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
                answerLabel.text = "Wrong!"                 //default text
            }
        }

        firstNumText = inputText    //sets old number
        wholeText = 0               //reset whole and parts of input
        decText = 0
        //inputText = 0
        decCheck = false            //reset decimal
        oldOperation = operation    //record oldOperation for next button press
       

    }
    
    @IBAction func updateAnswer(_ sender: Any) {
        if ansText == 0 {                                 //if this is only relevant calc.
        switch operation {                                      //checks operation
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
        }
        else if orderCheckMinus {
            if abs(ansText) > 0 {
                switch operation {
                case "/":
                    ansText = operOrder - ansText/inputText
                case "X":
                    ansText = operOrder - ansText * inputText
                case "-":
                    ansText = operOrder - ansText - inputText
                case "+":
                    ansText = operOrder - ansText + inputText
                default:
                    answerLabel.text = "Wrong!"
                }
            }
            else {
                switch operation {
                case "/":
                    ansText = operOrder - firstNumText/inputText
                case "X":
                    ansText = operOrder - firstNumText * inputText
                case "-":
                    ansText = operOrder - firstNumText - inputText
                case "+":
                    ansText = operOrder - firstNumText + inputText
                default:
                    answerLabel.text = "Wrong!"
                }
            }
            
            
        }
        else if orderCheckPlus {
            if abs(ansText) > 0 {
                switch operation {
                case "/":
                    ansText = operOrder + ansText/inputText
                case "X":
                    ansText = operOrder + ansText * inputText
                case "-":
                    ansText = operOrder + ansText - inputText
                case "+":
                    ansText = operOrder + ansText + inputText
                default:
                    answerLabel.text = "Wrong!"
                }
            }
            else {
                switch operation {
                case "/":
                    ansText = operOrder + firstNumText/inputText
                case "X":
                    ansText = operOrder + firstNumText * inputText
                case "-":
                    ansText = operOrder + firstNumText - inputText
                case "+":
                    ansText = operOrder + firstNumText + inputText
                default:
                    answerLabel.text = "Wrong!"
                }
            }
            
        }
        else {
            switch operation {
            case "/":
                ansText = ansText / inputText
            case "X":
                ansText = ansText * inputText
            case "-":
                ansText = ansText - inputText
            case "+":
                ansText = ansText + inputText
            default:
                answerLabel.text = "Wrong!"
        }
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

