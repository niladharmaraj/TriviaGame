//
//  TriviaGameViewController.swift
//  TriviaGame
//
//  Created by 24NilaDharmaraj on 7/18/19.
//  Copyright © 2019 Nila Dharmaraj. All rights reserved.
//

import UIKit

class TriviaGameViewController: UIViewController {
    
    var questions = ["Which singer’s real name is Stefani Joanne Angelina Germanotta?", " What is the name of Batman’s butler?", " What is Chandler’s last name in the sitcom Friends?", "Which pop album is the best selling of all time? Please say the artist!", "Which nail grows fastest?", "Where is the smallest bone in the body?", "Who cut Van Gough's ear?", " How many dots are there on two dice?",  "What language has the most words?", "What kind of animal is the jackrabbit?", "What kind of animal is a prairie dog?", "How long did the 100 years war last?", "What color is blueberry jam?", "Which fictional character was also known as Lord Greystoke?", "What kind of animal is the horned toad?"]
    var currQ = 0
    var answers = ["Lady Gaga", "Alfred", "Bing", "Thriller by Michael Jackson", "Middle", "Ear", "Himself", "42", "English", "Hare", "A rodent", "116 years", "Purple", "Tarzan", "A lizard"]
    var score = 0
    
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
            validationLabel.text = "Sorry, that was incorrect. The correct answer is \(correctAnswer)"
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
