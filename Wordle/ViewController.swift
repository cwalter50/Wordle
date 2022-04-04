//
//  ViewController.swift
//  Wordle
//
//  Created by Christopher Walter on 4/4/22.
//

import UIKit



class ViewController: UIViewController
{
    
    
    @IBOutlet weak var guessTextField: UITextField!
    
    @IBOutlet var guess1Labels: [UILabel]!
    @IBOutlet var guess2Labels: [UILabel]!
    @IBOutlet var guess3Labels: [UILabel]!
    @IBOutlet var guess4Labels: [UILabel]!
    @IBOutlet var guess5Labels: [UILabel]!
    @IBOutlet var guess6Labels: [UILabel]!
    
    
    var word: String = "BOATS"
    var guessCount = 0
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func guessButtonTapped(_ sender: UIBarButtonItem)
    {
        
        fillInGuess(guess: guessTextField.text!, labels: guess1Labels)
    }
    
    func fillInGuess(guess: String, labels: [UILabel])
    {
        for i in labels.indices
        {
            labels[i].text = guess[i]
        }
    }
    
}




extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

