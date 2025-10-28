//
//  ViewController.swift
//  Counter
//
//  Created by Сергей Бушков on 24.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var count: UILabel!
    @IBOutlet weak private var buttonMinus: UIButton!
    @IBOutlet weak private var buttonPlus: UIButton!
    @IBOutlet weak private var reset: UIButton!
    @IBOutlet weak private var history: UITextView!
    
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterDisplay()
        setupHistoryTextView()
    }
    
    private func setupHistoryTextView() {
        history.text = "История изменений:\n"
    }
    
    @IBAction private func minus(_ sender: Any) {
        if counter > 0 {
            let oldValue = counter
            counter -= 1
            updateCounterDisplay()
            logToHistory("значение изменено на -1:   \(oldValue) → \(counter)")
        }
    }
    
    @IBAction private func plus(_ sender: Any) {
        let oldValue = counter
        counter += 1
        updateCounterDisplay()
        logToHistory("значение изменено на +1:   \(oldValue) → \(counter)")
    }
    
    @IBAction private func resetCounter(_ sender: Any) {
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
        history.scrollRangeToVisible(NSMakeRange(history.text.count - 1, 1))
    }
}

