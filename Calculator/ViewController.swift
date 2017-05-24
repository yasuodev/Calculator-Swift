//
//  ViewController.swift
//  Calculator
//
//  Created by Dev on 5/23/17.
//  Copyright © 2017 Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var txt1A: UITextField!
    @IBOutlet weak var txt2A: UITextField!
    @IBOutlet weak var txt3A: UITextField!
    @IBOutlet weak var txtTotal: UITextField!
    
    @IBOutlet weak var lblA1: UILabel!
    @IBOutlet weak var lblA2: UILabel!
    @IBOutlet weak var lblA3: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    @IBOutlet weak var txtKg: UITextField!
    @IBOutlet weak var txtLb: UITextField!
    
    
    var isEmptyA1 : Bool = true;
    var isEmptyA2 : Bool = true;
    var isEmptyA3 : Bool = true;
    var isEmptyTotal: Bool = true;
    
    var a1: Float = 0
    var a2: Float = 0
    var a3: Float = 0
    var total: Float = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        isEmptyA1 = true;
        isEmptyA2 = true;
        isEmptyA3 = true;
        isEmptyTotal = true;
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func calculate() {
        var totalCount = 0
        var result1: Float = 0
        var result2: Float = 0
        var result3: Float = 0
        var resultSum: Float = 0
        
        if txt1A.text == "" {
            isEmptyA1 = true
            a1 = 0
        } else {
            isEmptyA1 = false
            totalCount += 1
            self.lblA1.text = self.txt1A.text
            
            if isNumeric(checkText: txt1A.text!) {
                a1 = Float(txt1A.text!)!
                result1 = a1
            }
        }
        
        if txt2A.text == "" {
            isEmptyA2 = true
            a2 = 0
        } else {
            isEmptyA2 = false
            totalCount += 1
            lblA2.text = self.txt2A.text;
            
            if isNumeric(checkText: txt2A.text!) {
                a2 = Float(self.txt2A.text!)!
                result2 = a2
            }
        }
        
        if self.txt3A.text == "" {
            isEmptyA3 = true
            a3 = 0
        } else {
            isEmptyA3 = false
            totalCount += 1
            self.lblA3.text = self.txt3A.text
            if isNumeric(checkText: self.txt3A.text!) {
                a3 = Float(self.txt3A.text!)!
                result3 = a3
            }
        }
        
        if self.txtTotal.text == "" {
            isEmptyTotal = true
            total = 0
        } else {
            isEmptyTotal = false
            self.lblTotal.text = self.txtTotal.text
            
            if isNumeric(checkText: self.txtTotal.text!) {
                total = Float(self.txtTotal.text!)!
            }
        }
        
        if (isEmptyA1) {
            if (totalCount == 1) {
                result1 = (total - a1 - a2 - a3) / 2
                self.lblA1.text = String(result1)
            } else {
                result1 = (total - a1 - a2 - a3)
                self.lblA1.text = String(result1)
            }
        }
        
        if (isEmptyA2) {
            if (totalCount == 1) {
                result2 = (total - a1 - a2 - a3) / 2
                self.lblA2.text = String(result2)
            } else {
                result2 = (total - a1 - a2 - a3)
                self.lblA2.text = String(result2)
            }
        }
        
        if (isEmptyA3) {
            if (totalCount == 1) {
                result3 = (total - a1 - a2 - a3) / 2
                self.lblA3.text = String(result3)
            } else {
                result3 = (total - a1 - a2 - a3);
                self.lblA3.text = String(result3)
            }
        }
        
        resultSum = result1 + result2 + result3;
        self.lblTotal.text = String(resultSum)
        
        convertMass()
        
    }
    
    func convertMass() {
        
        if txtKg.text == "" {
            txtLb.text = ""
        } else {
            if isNumeric(checkText: txtKg.text!) {
                let kg = Float(txtKg.text!)!
                let lb = kg * 2.20462
                txtLb.text = String(lb)
                
            } else {
                txtLb.text = "Wrong value."
            }
        }
        
        
        
        
    }
    
    func isNumeric(checkText: String) -> Bool {
        let sc = Scanner(string: checkText)
        if sc.scanFloat(nil) {
            return sc.isAtEnd
        }
        return false;
    }
    
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        calculate()
        return true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        calculate()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        self.txt1A.resignFirstResponder()
        self.txt2A.resignFirstResponder()
        self.txt3A.resignFirstResponder()
        self.txtTotal.resignFirstResponder()
        
        self .calculate()
        
    }
    
}

