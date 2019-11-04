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
    // Declare variables that I use later in my switch statement
    // Define tax for first 47,630$ of income eg. (7,144.5 is 47,630 * 0.15)
    let federalTax1 = 7144.5
    // Define tax for the next 47,629$ of income
    let federalTax2 = 9763.945
    // Define tax for the next 52,408$ of income
    let federalTax3 = 13626.08
    // Define tax for the next 62,704$ of income
    let federalTax4 = 18184.16
    
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
            taxRateDisplay.text = ""
            return
        }
        
        // Extract text from income text field and check that income isn't an empty string
        guard let incomeString = incomeTextField.text, incomeString != "" else {
            nameTaxDisplay.text = "Error, please enter your annual income."
            taxRateDisplay.text = ""
            return
        }
        
        // Check if gross annual income string can be converted into a double data type
        guard let incomeDouble = Double(incomeString), incomeDouble > 0 else {
            nameTaxDisplay.text = "Error, please enter a number in annual income. It must be positive."
            taxRateDisplay.text = ""
            return
        }
        
        // Calculate tax owing using a switch statement
        
        switch incomeDouble {
        case 0...47_630:
            // Multiply income by tax rate for this range (since it is the first range, we do not need to add tax together)
            let totalTax = incomeDouble * 0.15
            // Round to two decimal places
            let totalTaxRounded = (round(100*totalTax)/100)
            // Find the tax rate by dividing total tax by income (multiplying it by 100 because it is a percentage)
            let taxRate = totalTax/incomeDouble*100
            // Round tax rate to one decimal place
            let taxRateRounded = (round(10*taxRate)/10)
            // Display each text to the view in each label
            nameTaxDisplay.text = "\(nameString) your federal tax owing is \(totalTaxRounded)$."
            taxRateDisplay.text = "Effective tax rate is: \(taxRateRounded)%."
            
        case 47_631...95_259:
            // Multiply income over 47,630 by the effective tax rate
            let federalTaxForThisRange = (incomeDouble-47_630) * 0.205
            // Add the two tax amounts together
            let totalTax = federalTax1 + federalTaxForThisRange
            // Round to two decimal places
            let totalTaxRounded = (round(100*totalTax)/100)
            // Find the tax rate by dividing total tax by income (multiplying it by 100 because it is a percentage)
            let taxRate = totalTax/incomeDouble*100
            // Round tax rate to one decimal place
            let taxRateRounded = (round(10*taxRate)/10)
            // Display each text to the view in each label
            nameTaxDisplay.text = "\(nameString) your federal tax owing is \(totalTaxRounded)$."
            taxRateDisplay.text = "Effective tax rate is: \(taxRateRounded)%."
            
        case 95_260...147_667:
            // Multiply income over 95,259 by the effective tax rate
            let federalTaxForThisRange = (incomeDouble-95259) * 0.26
            // Add the two tax amounts together
            let totalTax = federalTax1 + federalTax2 + federalTaxForThisRange
            // Round to two decimal places
            let totalTaxRounded = (round(100*totalTax)/100)
            // Find the tax rate by dividing total tax by income (multiplying it by 100 because it is a percentage)
            let taxRate = totalTax/incomeDouble*100
            // Round tax rate to one decimal place
            let taxRateRounded = (round(10*taxRate)/10)
            // Display each text to the view in each label
            nameTaxDisplay.text = "\(nameString) your federal tax owing is \(totalTaxRounded)$."
            taxRateDisplay.text = "Effective tax rate is: \(taxRateRounded)%."
            
        case 147_668...210_371:
            // Multiply income over 95,259 by the effective tax rate
            let federalTaxForThisRange = (incomeDouble-147667) * 0.29
            // Add the two tax amounts together
            let totalTax = federalTax1 + federalTax2 + federalTax3 + federalTaxForThisRange
            // Round to two decimal places
            let totalTaxRounded = (round(100*totalTax)/100)
            // Find the tax rate by dividing total tax by income (multiplying it by 100 because it is a percentage)
            let taxRate = totalTax/incomeDouble*100
            // Round tax rate to one decimal place
            let taxRateRounded = (round(10*taxRate)/10)
            // Display each text to the view in each label
            nameTaxDisplay.text = "\(nameString) your federal tax owing is \(totalTaxRounded)$."
            taxRateDisplay.text = "Effective tax rate is: \(taxRateRounded)%."
            
        // default case is income over 210,372 $
        default:
             // Multiply income over 95,259 by the effective tax rate
             let federalTaxForThisRange = (incomeDouble-210371) * 0.33
             // Add the two tax amounts together
             let totalTax = federalTax1 + federalTax2 + federalTax3 + federalTax4 + federalTaxForThisRange
             // Round to two decimal places
             let totalTaxRounded = (round(100*totalTax)/100)
             // Find the tax rate by dividing total tax by income (multiplying it by 100 because it is a percentage)
             let taxRate = totalTax/incomeDouble*100
             // Round tax rate to one decimal place
             let taxRateRounded = (round(10*taxRate)/10)
             // Display each text to the view in each label
             nameTaxDisplay.text = "\(nameString) your federal tax owing is \(totalTaxRounded)$."
             taxRateDisplay.text = "Effective tax rate is: \(taxRateRounded)%."
        }
    }
}

