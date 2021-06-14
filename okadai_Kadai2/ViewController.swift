//
//  ViewController.swift
//  okadai_Kadai2
//
//  Created by Yudai Fujioka on 2021/06/04.
//

import UIKit

final class ViewController: UIViewController {
    
    private var textFields: [UITextField] {
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
}


@objc private extension ViewController {
    func tappedSumButton() {
        resultLabel.text = makeResultText()
    }
    
    private func makeResultText() -> String {
        
        let values = textFields.map { Double($0.text ?? "") ?? 0 }

        switch fourArithmeticOperationsSegmentedControl.selectedSegmentIndex {
        case 0:
            return String(values.reduce(0, +))
        case 1:
            return String(values[0] - values[1])
        case 2:
            return String(values.reduce(1, *))
        case 3:
            guard values[1] != 0 else {
                return "割る数には0以外を代入してね"
            }
            return String(values[0] / values[1])
        default:
            return ""
        }
    }
}
