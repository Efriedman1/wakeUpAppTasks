//
//  QuizGameViewController.swift
//  wakeUpAppGames
//
//  Created by Eric Friedman on 7/18/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit

struct Question {
    var Question: String!
    var Answers: [String]!
    var Answer: Int!
}

class QuizGameViewController: UIViewController {
    
    @IBOutlet weak var quizGameLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var Buttons: [UIButton]!
    
    var Questions = [Question]()
    var QNumber = Int()
    var answerNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Questions = [Question(Question: "qwetrdsfg", Answers: ["qwer","asdf","zxcv"], Answer: 2)]
        pickQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pickQuestion(){
        if Questions.count > 0 {
           QNumber = 0
            questionLabel.text = Questions[QNumber].Question
            
            answerNumber = Questions[QNumber].Answer
            
            for i in 0 ..< Buttons.count{
                Buttons[i].setTitle(Questions[QNumber].Answers[i], for: UIControlState.normal)
            }
            Questions.remove(at: QNumber)
        } else {
            
            NSLog("Done")
        }
    }
    
    @IBAction func bttn1(_ sender: UIButton) {
        if answerNumber == 0 {
            pickQuestion()
        } else {
            NSLog("Wrong")
        }
    }
    @IBAction func bttn2(_ sender: UIButton) {
        if answerNumber == 1 {
            pickQuestion()
        } else {
            NSLog("Wrong")
        }
    }
    @IBAction func bttn3(_ sender: UIButton) {
        if answerNumber == 2 {
            pickQuestion()
        } else {
            NSLog("Wrong")
        }
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
    }
    
    
}
