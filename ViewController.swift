//
//  ViewController.swift
//  calculator
//
//  Created by kpu on 2016. 3. 21..
//  Copyright © 2016년 SUNGJUN CHO. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    var Result: Double = 0
    var tempValueString: String = ""
    
    var expressionString: String = ""
    var resultString: String = ""
    var myResultDynamicArray:[Double] = []
    var myExpressionsDynamicArray:[String] = []

    @IBOutlet weak var expressionOutlet: UILabel!
    
    @IBOutlet weak var resultOutlet: UILabel!
    @IBAction func C(sender: AnyObject) {
        Result = 0;
        expressionString = ""
        tempValueString = ""
        myResultDynamicArray.removeAll()
        myExpressionsDynamicArray.removeAll()
        invalidateExpression()
        invalidateResult()
    }
    
    
    @IBAction func divide(sender: AnyObject) {
        expressionString+="/"
        invalidateExpression()
        myExpressionsDynamicArray.append("/")
        pressExpressionButton()
    }
    
    
    @IBAction func multiple(sender: AnyObject) {
        expressionString+="*"
        invalidateExpression()
        myExpressionsDynamicArray.append("*")
        pressExpressionButton()
    }
    
    
    @IBAction func sub(sender: AnyObject) {
        expressionString+="-"
        invalidateExpression()
        myExpressionsDynamicArray.append("-")
        pressExpressionButton()
    }
    
    @IBAction func plus(sender: AnyObject) {
        expressionString+="+"
        invalidateExpression()
        myExpressionsDynamicArray.append("+")
        pressExpressionButton()
    }
    
    @IBAction func equal(sender: AnyObject) {
        pressExpressionButton()
        if myResultDynamicArray.capacity == 0
        {
            return
        }
        var tempValue = myResultDynamicArray[0]
        var temp = myResultDynamicArray
        var temp2 = myExpressionsDynamicArray
        for var i = 0; i < myResultDynamicArray.count; ++i {
            if (i+1) == myResultDynamicArray.count
            {
                break;
            }
            let tempString = myExpressionsDynamicArray[i]
            let tempInt = myResultDynamicArray[i+1]
            switch tempString{
            case "+":
                tempValue += tempInt
                break;
                
            case "-":
                tempValue -= tempInt
                break;

            case "*":
                tempValue *= tempInt
                break;

            case "/":
                tempValue /= tempInt
                break;
            default:
                break;
                
            }
            
        }
        Result = tempValue
        invalidateResult()
        Result = 0;
        expressionString = ""
        tempValueString = ""
        myResultDynamicArray.removeAll()
        myExpressionsDynamicArray.removeAll()
    }
    
    @IBAction func seven(sender: AnyObject) {
        expressionString+="7"
        tempValueString+="7"
        invalidateExpression()
    }
    
    
    @IBAction func eight(sender: AnyObject) {
        expressionString+="8"
        tempValueString+="8"
        invalidateExpression()
    }
    
    
    @IBAction func nine(sender: AnyObject) {
        expressionString+="9"
        tempValueString+="9"
        invalidateExpression()
    }
    
    @IBAction func four(sender: AnyObject) {
        expressionString+="4"
        tempValueString+="4"
        invalidateExpression()
    }
    
    @IBAction func five(sender: AnyObject) {
        expressionString+="5"
        tempValueString+="5"
        invalidateExpression()
    }
    
    
    @IBAction func six(sender: AnyObject) {
        expressionString+="6"
        tempValueString+="6"
        invalidateExpression()
    }
    
    @IBAction func one(sender: AnyObject) {
        expressionString+="1"
        tempValueString+="1"
        invalidateExpression()
    }
    
    @IBAction func two(sender: AnyObject) {
        expressionString+="2"
        tempValueString+="2"
        invalidateExpression()
    }
    
    @IBAction func three(sender: AnyObject) {
        expressionString+="3"
        tempValueString+="3"
        invalidateExpression()
    }
    
    @IBAction func zero(sender: AnyObject) {
        expressionString+="0"
        tempValueString+="0"
        invalidateExpression()
    }
    
    func invalidateExpression(){
        expressionOutlet.text = expressionString
    }
    
    func invalidateResult(){
        resultOutlet.text = Result.description
    }
    
    func pressExpressionButton(){
        if tempValueString == ""
        {
            return
        }
        let myNumber = NSNumberFormatter().numberFromString(tempValueString)
        myResultDynamicArray.append(myNumber!.doubleValue)
        tempValueString = ""
    }
    
    func calculateValue(temp : Int){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Result = 0;
        expressionString = ""
        tempValueString = ""
        invalidateExpression()
        invalidateResult()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

