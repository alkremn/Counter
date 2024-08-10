//
//  ViewController.swift
//  Counter
//
//  Created by Alexey Kremnev on 8/10/24.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyText: UITextView!
    
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(action: .start)
    }
    
    @IBAction func incrementButtonDidTap(_ sender: Any) {
        updateUI(action: .increment)
    }
    
    @IBAction func decrementButtonDidTap(_ sender: Any) {
        if counter == 0 {
            updateUI(action: .negative)
            return
        }
        updateUI(action: .decrement)
    }
    
    @IBAction func resetButtonDidTap(_ sender: Any) {
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
        case .start, .negative:
            break
        }
        
        historyText.text += "\(action.displayText())\n"
        counterLabel.text = String(counter)
    }
}

