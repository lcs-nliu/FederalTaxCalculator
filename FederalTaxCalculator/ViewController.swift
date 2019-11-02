//
//  ViewController.swift
//  FederalTaxCalculator
//
//  Created by Liu, Bojun on 2019-11-01.
//  Copyright © 2019 Liu, Nicole. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    // Connect name text field to controller with an outlet
    @IBOutlet weak var nameTextField: UITextField!
    // Connect income text field to controller with an outlet
    @IBOutlet weak var incomeTextField: UITextField!
    // Connected name and tax amount label to controller using an outlet
    @IBOutlet weak var nameTaxDisplay: UILabel!
    // Connected the tax rate label to controller using an outlet
    @IBOutlet weak var taxRateDisplay: UILabel!
    
    override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
      }
    
    // MARK: Methods
    // Created an action for when calculate tax owing button is pressed
    @IBAction func calculateButtonPressed(_ sender: Any) {
    
        // Extract text from the name text field and check that name isn't an empty string
        guard let nameString = nameTextField.text, nameString != "" else {
            nameTaxDisplay.text = "Error, please enter your name."
            return
        }
        
        // Extract text from income text field and check that income isn't an empty string
        guard let incomeString = incomeTextField.text, incomeString != "" else {
            nameTaxDisplay.text = "Error, please enter your annual income."
            return
        }
        
        // Check if gross annual income string can be converted into a double data type
        guard let incomeDouble = Double(incomeString) else {
            nameTaxDisplay.text = "Error, please enter a number in annual income."
            return
        }
        
        // Calculate tax owing using a switch statement
        
    }
}

