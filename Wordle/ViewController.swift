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
    
    
    var answer: String = "BOATS"
    var guessCount = 0
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearScreen()
        getRandomAnswer()
        
        
    }
    
    
    func getRandomAnswer()
    {
        
        answer = WordList.wordleWords.randomElement()!.uppercased()
    }

    @IBAction func guessButtonTapped(_ sender: UIBarButtonItem)
    {
        
        let guess = guessTextField.text!.uppercased()
        
        if isGuessValid(guess: guess) == true
        {
            switch guessCount {
            case 0:
                fillInGuess(guess: guess, labels: guess1Labels)
            case 1:
                fillInGuess(guess: guess, labels: guess2Labels)
            case 2:
                fillInGuess(guess: guess, labels: guess3Labels)
            case 3:
                fillInGuess(guess: guess, labels: guess4Labels)
            case 4:
                fillInGuess(guess: guess, labels: guess5Labels)
            case 5:
                fillInGuess(guess: guess, labels: guess6Labels)
            default:
                print("ran out of guesses")
            }
            guessCount += 1
            
        }
        else
        {
            // show alert that tells user guess is not valid.
        }
        
    }
    
    func fillInGuess(guess: String, labels: [UILabel])
    {
        for i in labels.indices
        {
            labels[i].text = guess[i]
        }
        
        
        // color the letters correctly
        for i in 0...4
        {
            let currentLetter = guess[i]
//            let currentLabel = labels[i.hashValue]
            
            if currentLetter == answer[i]
            {
                // make green
                labels[i].backgroundColor = UIColor.green
            }
            else if answer.contains(currentLetter)
            {
                // make yellow
                labels[i].backgroundColor = UIColor.yellow
            }
            else
            {
                //do nothing or make gray
                labels[i].backgroundColor = UIColor.lightGray
            }
        }
    }
    
    func isGuessValid(guess: String) -> Bool
    {
        // if word is 5 letters long and a real word
        if guess.count == 5 && WordList.allPossibleWords.contains(guess.lowercased())
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func clearScreen()
    {
        
        let allLabels = [guess1Labels, guess2Labels, guess3Labels, guess4Labels, guess5Labels, guess6Labels]
        
        for labels in allLabels
        {
            for label in labels!
            {
                label.backgroundColor = UIColor.white
                label.text = " "
                label.layer.borderColor = UIColor.darkGray.cgColor
                label.layer.borderWidth = 2
                label.layer.cornerRadius = 5
            }
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

