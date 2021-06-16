//
//  ViewController.swift
//  okadai_Kadai2
//
//  Created by Yudai Fujioka on 2021/06/04.
//

import UIKit

final class ViewController: UIViewController {
    
    private var textFields : [UITextField] {
        [firstTextField, secondTextField]
    }
    
    @IBOutlet private weak var firstTextField: UITextField!
    @IBOutlet private weak var secondTextField: UITextField!
    @IBOutlet private weak var fourArithmeticOperationsSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var sumButton: UIButton!
    @IBOutlet private weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sumButton.addTarget(self, action: #selector(tappedSumButton), for: .touchUpInside)
        
    }
    
    private func makeResultText() -> String {
        
        let values = textFields.map{ Double($0.text ?? "") ?? 0}
        
        switch fourArithmeticOperationsSegmentedControl.selectedSegmentIndex {
        case 0:
            let plusSum = values.reduce(0, +)
            return String(plusSum)
            
        case 1:
            let mappedSum = values
            let  minusSum = Double(mappedSum[0] - mappedSum[1])
            return String(minusSum)
            
        case 2:
            let multiplicationSum = values.reduce(1, *)
            return String(multiplicationSum)
            
        case 3:
            guard values[1] != 0 else {
                return "割る数には0を代入してね"
            }
            let mappedSum = values
            let divisionSum = Double(mappedSum[0] / mappedSum[1])
            return String(divisionSum)
            
        default:
            return ""
        }
    }
}


@objc private extension ViewController {
    func tappedSumButton() {
        resultLabel.text = makeResultText()
    }
}

