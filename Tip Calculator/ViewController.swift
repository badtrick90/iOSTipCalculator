//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Patrick Lee on 9/24/18.
//  Copyright © 2018 Patrick Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var numOfPeopleLabel: UILabel!
    
    
    override func viewDidAppear(_ animated: Bool) {
        billField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    var stepperValue = 1
    
    @IBAction func stepper(_ stepper: UIStepper) {
        stepperValue = Int(stepper.value)
        
        numOfPeopleLabel.text = String(stepperValue)
        
        calculateTip(stepper)
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        let numOfPeople = stepperValue

        let tipPercentages = [0.15, 0.18, 0.2]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        let splitAmount = total / Double(numOfPeople)
        
        splitLabel.text = String(format: "$%.2f", splitAmount)
    }
    
    
    
}

