//
//  TriviaGameViewController.swift
//  TriviaGame
//
//  Created by 24NilaDharmaraj on 7/18/19.
//  Copyright © 2019 Nila Dharmaraj. All rights reserved.
//

import UIKit

class TriviaGameViewController: UIViewController {
    
    var questions = ["Which singer’s real name is Stefani Joanne Angelina Germanotta?", "I can fly but have no wings. I can cry but I have no eyes. Wherever I go, darkness follows me. What am I?", " What is Chandler’s last name in the sitcom Friends?", "Which pop album is the best selling of all time? Please say the artist!", "Which nail grows fastest?", "Where is the smallest bone in the body?", "Who cut Van Gough's ear?", " How many dots are there on two dice?",  "What language has the most words?", "What has a head, a tail, is brown, and has no legs?", "What kind of animal is a prairie dog?", "How long did the 100 years war last?", "What color is blueberry jam?", "What tastes better than it smells?", "I can be cracked, made, told, and played. What am I?"]
    var currQ = 0
    var answers = ["Lady Gaga", "a cloud", "Bing", "Thriller by Michael Jackson", "middle", "ear", "himself", "42", "English", "penny", "rodent", "116 years", "purple", "tongue", "a joke"]
    var score = 0
    
    @IBAction func textFieldEnter(_ sender: Any) {
        processAnswer ()
    }
    @IBOutlet weak var answerSwitch: UISwitch!
    @IBOutlet weak var endOfGameMessage: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var userAnswerTextField: UITextField!
    @IBOutlet weak var validationLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currQ]

    }
    
    
    @IBAction func checkButton(_ sender: Any) {
        processAnswer ()
    }
    func processAnswer () {
        if (userAnswerTextField.text == "") {
            validationLabel.text = "Please enter an answer."
            return
        }
        let userAnswer = userAnswerTextField.text
        let correctAnswer = answers[currQ]
        
        if(userAnswer!.caseInsensitiveCompare(correctAnswer) == .orderedSame) {
            validationLabel.text = "Good job! You got the right answer!"
            score += 1
        } else {
            if(answerSwitch.isOn) {
                validationLabel.text = "Sorry, that was incorrect. The correct answer is \(correctAnswer)"
            } else {
                validationLabel.text = "Sorry, that was incorrect."
            }
            }
        currQ += 1
        if (currQ >= questions.count) {
            if (score > questions.count/2) {
                endOfGameMessage.text = "Good game! Thanks for playing! :)"
            } else {
                endOfGameMessage.text = "Aww! Better luck next time, pal. :) Click the back to home button for another chance bud :)"
            }
        } else {
            questionLabel.text = questions [currQ]
        }
        userAnswerTextField.text = ""
        scoreLabel.text = "Score: \(String(score))"
    }
    
}
