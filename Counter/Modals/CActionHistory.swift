//
//  History.swift
//  Counter
//
//  Created by Alexey Kremnev on 8/10/24.
//

import Foundation


enum ActionHistory {
    case start
    case increment
    case decrement
    case reset
    case negative
    
    func displayText() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm:ss"
        
        let dateString: String = dateFormatter.string(from: Date())
        
        switch self {
        case .start:
            return "История изменений:"
        case .increment:
            return "\(dateString): значение изменено на +1"
        case .decrement:
            return "\(dateString): значение изменено на -1"
        case .reset:
            return "\(dateString): значение сброшено"
        case .negative:
            return "\(dateString): попытка уменьшить значение счётчика ниже 0"
        }
    }
}
