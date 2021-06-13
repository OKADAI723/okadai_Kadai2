//
//  ViewController.swift
//  okadai_Kadai2
//
//  Created by Yudai Fujioka on 2021/06/04.
//

import UIKit

final class ViewController: UIViewController {
    
    private var sumArrays : [UITextField] {
        [firstTextField, secondTextField]
    }
    
    private var operation : Int = 0
    
    @IBOutlet private weak var firstTextField: UITextField!
    @IBOutlet private weak var secondTextField: UITextField!
    @IBOutlet private weak var fourArithmeticOperationsSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var sumButton: UIButton!
    @IBOutlet private weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sumButton.addTarget(self, action: #selector(tappedSumButton), for: .touchUpInside)
        fourArithmeticOperationsSegmentedControl.addTarget(self, action: #selector(tappedFourArithmeticOperations), for: .valueChanged)
    }
}


@objc private extension ViewController {
    func tappedSumButton() {
        resultLabel.text = String(tappedFourArithmeticOperations())
    }
    
    func tappedFourArithmeticOperations() -> Double {
        
        switch fourArithmeticOperationsSegmentedControl.selectedSegmentIndex {
        case 0:
            let plusSum = sumArrays.map({Double($0.text ?? "") ?? 0}).reduce(0, +)
            return Double(plusSum)
            
        case 1:
            let mappedSum = sumArrays.map({Double($0.text ?? "") ?? 0})
            let  minusSum = Double(mappedSum[0] - mappedSum[1])
            return minusSum
            
        case 2:
            let multiplicationSum = sumArrays.map({Double($0.text ?? "") ?? 0}).reduce(1, *)
            return Double(multiplicationSum)
            
        case 3:
            guard sumArrays[1].text != "0" else {
                resultLabel.text = "割る数には0以外を代入してね"
                return 0
            }
            let mappedSum = sumArrays.map({Double($0.text ?? "") ?? 0})
            let divisionSum = Double(mappedSum[0] / mappedSum[1])
            return divisionSum
            
        default:
            return 0
        }
    }
}

