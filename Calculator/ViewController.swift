//
//  ViewController.swift
//  Calculator
//
//  Created by Dev on 5/23/17.
//  Copyright © 2017 Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    

    @IBOutlet weak var txtSquat: UITextField!
    @IBOutlet weak var txtBench: UITextField!
    @IBOutlet weak var txtDeadlift: UITextField!
    
    @IBOutlet weak var txtTotal: UITextField!
    
    @IBOutlet weak var lblA1: UILabel!
    @IBOutlet weak var lblA2: UILabel!
    @IBOutlet weak var lblA3: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    @IBOutlet weak var txtKg: UITextField!
    @IBOutlet weak var txtLb: UITextField!
    
    @IBOutlet weak var lblKg: UILabel!
    @IBOutlet weak var lblLb: UILabel!
    
    var isEmptyA1 : Bool = true;
    var isEmptyA2 : Bool = true;
    var isEmptyA3 : Bool = true;
    var isEmptyTotal: Bool = true;
    
    var a1: Float = 0
    var a2: Float = 0
    var a3: Float = 0
    var total: Float = 0;
    
    var isKgLb = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        isEmptyA1 = true;
        isEmptyA2 = true;
        isEmptyA3 = true;
        isEmptyTotal = true;
        
        txtSquat.text = UserDefaults.standard.string(forKey: "squat")
        txtBench.text = UserDefaults.standard.string(forKey: "bench")
        txtDeadlift.text = UserDefaults.standard.string(forKey: "deadlift")
        txtTotal.text = UserDefaults.standard.string(forKey: "total")
        txtKg.text = UserDefaults.standard.string(forKey: "kg")
        isKgLb = UserDefaults.standard.bool(forKey: "isKgLb")
        
        calculate()
        
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
        
        if txtSquat.text == "" {
            isEmptyA1 = true
            a1 = 0
        } else {
            isEmptyA1 = false
            totalCount += 1
            self.lblA1.text = self.txtSquat.text
            
            if isNumeric(checkText: txtSquat.text!) {
                a1 = Float(txtSquat.text!)!
                result1 = a1
            }
        }
        
        if txtBench.text == "" {
            isEmptyA2 = true
            a2 = 0
        } else {
            isEmptyA2 = false
            totalCount += 1
            lblA2.text = self.txtBench.text;
            
            if isNumeric(checkText: txtBench.text!) {
                a2 = Float(self.txtBench.text!)!
                result2 = a2
            }
        }
        
        if self.txtDeadlift.text == "" {
            isEmptyA3 = true
            a3 = 0
        } else {
            isEmptyA3 = false
            totalCount += 1
            self.lblA3.text = self.txtDeadlift.text
            if isNumeric(checkText: self.txtDeadlift.text!) {
                a3 = Float(self.txtDeadlift.text!)!
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
        
        if isKgLb {
            convertKgLb()
        } else {
            convertLbKg()
        }
        
        UserDefaults.standard.set(txtSquat.text, forKey: "squat")
        UserDefaults.standard.set(txtBench.text, forKey: "bench")
        UserDefaults.standard.set(txtDeadlift.text, forKey: "deadlift")
        UserDefaults.standard.set(txtTotal.text, forKey: "total")
        
        UserDefaults.standard.set(txtKg.text, forKey: "kg")
        UserDefaults.standard.set(isKgLb, forKey: "isKgLb")
    }
    
    func convertKgLb() {
        
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
    
    func convertLbKg() {
        if txtKg.text == "" {
            txtLb.text = ""
        } else {
            if isNumeric(checkText: txtLb.text!) {
                let lb = Float(txtKg.text!)!
                let kg = lb * 0.453592
                txtLb.text = String(kg)
                
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
        let result = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        textField.text = result
        calculate()
        return false
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        calculate()
    }
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == txtKg {
            isKgLb = true
        }
        if textField == txtLb {
            isKgLb = false
        }
        return true
    }
    
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.txtSquat.resignFirstResponder()
        self.txtBench.resignFirstResponder()
        self.txtDeadlift.resignFirstResponder()
        self.txtTotal.resignFirstResponder()
        self.txtKg.resignFirstResponder()
        self.txtLb.resignFirstResponder()
        
        self .calculate()
        
    }
    
    @IBAction func onInverse(_ sender: Any) {
        if isKgLb {
            lblKg.text = "Lb"
            lblLb.text = "Kg"
        } else {
            lblKg.text = "Kg"
            lblLb.text = "Lb"
        }
        
        isKgLb = !isKgLb
        
        calculate()
    }
}

