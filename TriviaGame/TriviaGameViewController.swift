//
//  TriviaGameViewController.swift
//  TriviaGame
//
//  Created by 24NilaDharmaraj on 7/18/19.
//  Copyright © 2019 Nila Dharmaraj. All rights reserved.
//

import UIKit

class TriviaGameViewController: UIViewController {
    
    var questions = ["Which singer’s real name is Stefani Joanne Angelina Germanotta?", " What is the name of Batman’s butler?", " What is Chandler’s last name in the sitcom Friends?", "Which pop album is the best selling of all time?", "Which nail grows fastest?", "Where is the smallest bone in the body?"]
    var currQ = 0
    var answers = ["Lady Gaga", "Alfred", "Bing", "Thriller by Micheal Jackson", "Middle", "Ear"]
    
    @IBOutlet weak var endOfGameMessage: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var userAnswerTextField: UITextField!
    @IBOutlet weak var validationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currQ]

    }
    
    
    @IBAction func checkButton(_ sender: Any) {
    if (userAnswerTextField.text == "") {
            validationLabel.text = "Please enter an answer."
            return
        }
        let userAnswer = userAnswerTextField.text
        let correctAnswer = answers[currQ]
        
        if(userAnswer!.caseInsensitiveCompare(correctAnswer) == .orderedSame) {
            validationLabel.text = "Good job! You got the right answer!"
        } else {
            validationLabel.text = "Sorry, that was incorrect. The correct answer is \(correctAnswer)"
        }
        currQ += 1
        if (currQ >= questions.count) {
            endOfGameMessage.text = "Good game! Thanks for playing! :)"
        } else {
            questionLabel.text = questions [currQ]
        }
        userAnswerTextField.text = ""
    }
    
}

