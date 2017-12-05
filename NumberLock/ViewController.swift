//
//  ViewController.swift
//  NumberLock
//
//  Created by 杨以皓 on 11/30/17.
//  Copyright © 2017 yyh. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {

    // make a random num
    var answer  = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
    var max = 100
    var min = 1
    var isOver = false
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBAction func makeAGuess(_ sender: UIButton) {
        if !isOver{
            print(answer)
            let inputText = inputTextField.text!
            inputTextField.text = ""
            
            let inputNumber = Int(inputText)
            if inputNumber == nil{
                // wrong input
                messageLabel.text = "No input! Guess a number between \(min) ~ \(max)"
            } else {
                // input ok
                if inputNumber! > 100{
                    messageLabel.text = "Too large! Guess a number between \(min) ~ \(max)"
                } else if inputNumber! < 1{
                    messageLabel.text = "Too small! Guess a number between \(min) ~ \(max)"
                } else if inputNumber! == answer {
                    messageLabel.text = "You are right, press [Guess] to play again"
                    isOver = true
                    background.image = UIImage(named: "Finish")
                } else {
                    if inputNumber! > answer {
                        max = inputNumber!
                    } else {
                        min = inputNumber!
                    }
                    messageLabel.text = "Try again! Guess a number between \(min) ~ \(max)"
                }
            }
        } else {
            answer  = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
            max = 100
            min = 1
            messageLabel.text = "Too small! Guess a number between \(min) ~ \(max)"
            isOver = false
            background.image = UIImage(named: "BG")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // push the keyboard up
        inputTextField.becomeFirstResponder()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

