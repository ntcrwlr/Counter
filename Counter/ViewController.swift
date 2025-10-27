//
//  ViewController.swift
//  Counter
//
//  Created by Сергей Бушков on 24.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var count: UILabel!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var history: UITextView!
    
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterDisplay()
        setupHistoryTextView()
    }
    
    private func setupHistoryTextView() {
        history.text = "История изменений:\n"
    }
    
    @IBAction func minus(_ sender: Any) {
        if counter > 0 {
            let oldValue = counter
            counter -= 1
            updateCounterDisplay()
            logToHistory("значение изменено на -1:   \(oldValue) → \(counter)")
        }
    }
    
    @IBAction func plus(_ sender: Any) {
        let oldValue = counter
        counter += 1
        updateCounterDisplay()
        logToHistory("значение изменено на +1:   \(oldValue) → \(counter)")
    }
    
    @IBAction func resetCounter(_ sender: Any) {
        let oldValue = counter
        counter = 0
        updateCounterDisplay()
        logToHistory("значение сброшено:   \(oldValue) → 0")
    }
    
    private func updateCounterDisplay() {
        count.text = String(counter)
    }
    
    private func logToHistory(_ action: String) {
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
        let logEntry = "[\(timestamp)] \(action)\n"
        history.text += logEntry
        
        // Единственная строка для автоматической прокрутки
        history.scrollRangeToVisible(NSMakeRange(history.text.count - 1, 1))
    }
}

