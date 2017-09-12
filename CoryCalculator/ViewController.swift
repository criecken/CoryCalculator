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
    var inputText : Double = 0.0, ansText : Double = 0.0, decText = 0.0, wholeText = 0.0
    var decCheck : Bool = false
    var count : Double = 1
    
   
    @IBAction func numberPress(_ sender: AnyObject) {
        let input : String = sender.currentTitle!!
        if input == "." {
            decCheck = true        }
        else if input == "C" {
            if inputText == 0 {
                ansText = 0
            }
            else {
                inputText = 0
            }
            answerLabel.text = String(ansText)
            inputLabel.text = String(inputText)
            decText = 0
            wholeText = 0
            decCheck = false
        }
        else if decCheck {

            decText = decText*count + Double(input)!

  
        }
        else {
            wholeText = wholeText*10 + Double(input)!
        }
       count = 10
        while decText > 1 {
            decText = decText / 10
            count = count*10
            
        }
        inputText = wholeText + decText
        inputLabel.text = String(inputText)
        
    }
    
    
    @IBAction func negPress(_ sender: Any) {
        inputText = -1*inputText
        inputLabel.text = String(inputText)
    }

    
    @IBAction func updateAnswer(_ sender: Any) {
         inputText = 0
         ansText = 4
        answerLabel.text = String(ansText)
        inputLabel.text = String(inputText)
        decCheck = false
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        answerLabel.text = String(ansText)
        inputLabel.text = String(inputText)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

