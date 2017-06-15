//
//  ViewController.swift
//  Calculator
//
//  Created by Dev on 5/23/17.
//  Copyright © 2017 Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var viewSquat: UIView!
    @IBOutlet weak var viewBench: UIView!
    @IBOutlet weak var viewDeadlift: UIView!
    @IBOutlet weak var viewTotal: UIView!

    @IBOutlet weak var txtSquat: UITextField!
    @IBOutlet weak var txtBench: UITextField!
    @IBOutlet weak var txtDeadlift: UITextField!
    
    @IBOutlet weak var txtTotal: UITextField!
    
    @IBOutlet weak var lblSquat: UILabel!
    @IBOutlet weak var lblBench: UILabel!
    @IBOutlet weak var lblDeadlift: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    @IBOutlet weak var txtKg: UITextField!
    @IBOutlet weak var txtLb: UITextField!
    
    @IBOutlet weak var lblKg: UILabel!
    @IBOutlet weak var lblLb: UILabel!
    
    var isEmptySquat : Bool = true;
    var isEmptyBench : Bool = true;
    var isEmptyDeadlift : Bool = true;
    var isEmptyTotal: Bool = true;
    
    var a1: Float = 0
    var a2: Float = 0
    var a3: Float = 0
    var total: Float = 0;
    
    var isKgLb = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        isEmptySquat = true;
        isEmptyBench = true;
        isEmptyDeadlift = true;
        isEmptyTotal = true;
        
        viewSquat.layer.cornerRadius = 5
        viewBench.layer.cornerRadius = 5
        viewDeadlift.layer.cornerRadius = 5
        viewTotal.layer.cornerRadius = 5
        
        viewTotal.layer.borderColor = UIColor.red.cgColor
        viewTotal.layer.borderWidth = 1
        
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
            isEmptySquat = true
            a1 = 0
        } else {
            isEmptySquat = false
            totalCount += 1
            self.lblSquat.text = self.txtSquat.text
            
            if isNumeric(checkText: txtSquat.text!) {
                a1 = Float(txtSquat.text!)!
                result1 = a1
            }
        }
        
        if txtBench.text == "" {
            isEmptyBench = true
            a2 = 0
        } else {
            isEmptyBench = false
            totalCount += 1
            lblBench.text = self.txtBench.text;
            
            if isNumeric(checkText: txtBench.text!) {
                a2 = Float(self.txtBench.text!)!
                result2 = a2
            }
        }
        
        if self.txtDeadlift.text == "" {
            isEmptyDeadlift = true
            a3 = 0
        } else {
            isEmptyDeadlift = false
            totalCount += 1
            self.lblDeadlift.text = self.txtDeadlift.text
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
        
        if (isEmptySquat) {
            if (totalCount == 1) {
                result1 = (total - a1 - a2 - a3) / 2
                self.lblSquat.text = String(result1)
            } else {
                result1 = (total - a1 - a2 - a3)
                self.lblSquat.text = String(result1)
            }
        }
        
        if (isEmptyBench) {
            if (totalCount == 1) {
                result2 = (total - a1 - a2 - a3) / 2
                self.lblBench.text = String(result2)
            } else {
                result2 = (total - a1 - a2 - a3)
                self.lblBench.text = String(result2)
            }
        }
        
        if (isEmptyDeadlift) {
            if (totalCount == 1) {
                result3 = (total - a1 - a2 - a3) / 2
                self.lblDeadlift.text = String(result3)
            } else {
                result3 = (total - a1 - a2 - a3);
                self.lblDeadlift.text = String(result3)
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

