//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Hasan Aygünoglu on 4.04.2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit



struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height*height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more!", color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        }else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Looking Good!", color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        }else {
            bmi = BMI(value: bmiValue, advice: "Drink more water, fatso!", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        }
        
    }
    
    func getBMIValue() -> Float {
        return bmi?.value ?? 1.0
    }
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.red
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "---------"
    }
}
