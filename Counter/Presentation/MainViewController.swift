//
//  ViewController.swift
//  Counter
//
//  Created by Alexey Kremnev on 8/10/24.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var historyText: UITextView!
    
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(action: .start)
    }
    
    @IBAction private func incrementButtonDidTap(_ sender: Any) {
        updateUI(action: .increment)
    }
    
    @IBAction private func decrementButtonDidTap(_ sender: Any) {
        if counter == 0 {
            updateUI(action: .negative)
            return
        }
        updateUI(action: .decrement)
    }
    
    @IBAction private func resetButtonDidTap(_ sender: Any) {
        if counter > 0 {
            updateUI(action: .reset)
        }
    }
    
    private func updateUI(action: ActionHistory) {
        switch action {
        case .increment:
            counter += 1
        case .decrement:
            counter -= 1
        case .reset:
            counter = 0
        default:
            break
        }
        
        historyText.text += "\(action.displayText())\n"
        counterLabel.text = String(counter)
    }
}

