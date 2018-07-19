//
//  MathGameViewController.swift
//  wakeUpAppGames
//
//  Created by Eric Friedman on 7/18/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit
import Foundation
import SpriteKit

struct Question {
    var Question: String!
    var Answers: [String]!
    var Answer: Int!
}

class MathGameViewController: UIViewController {
    
    let viewController = ViewController()
    
    @IBOutlet weak var mathGameLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var Buttons: [UIButton]!
    
    var Questions = [Question]()
    var QNumber = Int()
    var answerNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    Questions = [Question(Question: "Solve for x: 3x - 11 = 13", Answers: ["4", "8", "10"], Answer: 1), Question(Question: "What is the square root of 169?", Answers: ["11", "12", "13"], Answer: 2), Question(Question: "Which of the following fractions reduces to 1/2", Answers: ["4/10", "20/60", "250/500"], Answer: 2), Question(Question: "Which of the following numbers is both a perfect square and a perfect cube?", Answers: ["25", "64", "125"], Answer: 1)]
    pickQuestion()
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pickQuestion(){
        QNumber = Int(arc4random_uniform(Questions.count))
        questionLabel.text = Questions[QNumber].Question
        
        answerNumber = Questions[QNumber].Answer
        
        for i in 0 ..< Buttons.count{
            Buttons[i].setTitle(Questions[QNumber].Answers[i], for: UIControlState.normal)
        }
    }
    
    @IBAction func bttn1(_ sender: UIButton) {
        if answerNumber == 0 {
            viewController.quizGameButton.setTitleColor(UIColor.green, for: UIControlState.normal)
            viewController.quizGameButton.isEnabled = false
            self.performSegue(withIdentifier: "quizGame", sender: self)
        } else {
            NSLog("Wrong")
        }
    }
    @IBAction func bttn2(_ sender: UIButton) {
        if answerNumber == 1 {
            // viewController.quizGameButton.setTitleColor(UIColor.green, for: UIControlState.normal)
            // viewController.quizGameButton.isEnabled = false
            self.performSegue(withIdentifier: "quizGame", sender: self)
        } else {
            NSLog("Wrong")
        }
    }
    @IBAction func bttn3(_ sender: UIButton) {
        if answerNumber == 2 {
            // viewController.quizGameButton.setTitleColor(UIColor.green, for: UIControlState.normal)
            //  viewController.quizGameButton.isEnabled = false
            self.performSegue(withIdentifier: "quizGame", sender: self)
        } else {
            NSLog("Wrong")
        }
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
    }
    
    
    
}
