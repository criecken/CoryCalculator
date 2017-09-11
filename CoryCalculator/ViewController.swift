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
    @IBOutlet weak var inputLabel: UITextField!
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
    var inputText, ansText : Double

    
    @IBAction func updateAnswer(_ sender: Any) {
        inputText = 0
        
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

