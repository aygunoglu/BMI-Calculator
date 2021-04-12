//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Hasan Aygünoglu on 4.04.2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

var calculatorBrain = CalculatorBrain()

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightOutlet: UISlider!
    @IBOutlet weak var weightOutlet: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func heightSlider(_ sender: UISlider) {
        
        let heightValue = String(format: "%.2f", sender.value)
        
        heightLabel.text = "\(heightValue)m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        
        
        let weightValue = String(format: "%.0f", sender.value)
        
        weightLabel.text = "\(weightValue)kg"
        
    }
    

    @IBAction func calculateButton(_ sender: UIButton) {
        
        let height = heightOutlet.value
        let weight = weightOutlet.value
        

        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = String(format: "%.1f", calculatorBrain.getBMIValue())
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }

    

}

