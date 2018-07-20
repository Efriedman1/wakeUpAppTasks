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

struct Problem {
    var Problem: String!
    var Answers: [String]!
    var Answer: Int!
}

class MathGameViewController: UIViewController {
    
   let viewController = ViewController()
    
    
    @IBOutlet weak var mathGameLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var AnswerButtons: [UIButton]!
    
    @IBOutlet weak var bttn1: UIButton!
    @IBOutlet weak var bttn2: UIButton!
    @IBOutlet weak var bttn3: UIButton!
    
    
    var mathProblems = [Problem]()
    var QNumber = Int()
    var answerNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bttn1.layer.cornerRadius = 5
        bttn2.layer.cornerRadius = 5
        bttn3.layer.cornerRadius = 5
    
        mathProblems = [Problem(Problem: "Solve for x: 3x - 11 = 13", Answers: ["4", "8", "10"], Answer: 1),
                     Problem(Problem: "What is the square root of 169?", Answers: ["11", "12", "13"], Answer: 2),
                     Problem(Problem: "Which of the following fractions reduces to 1/2", Answers: ["4/10", "20/60", "250/500"], Answer: 2),
                     Problem(Problem: "Which of the following numbers is both a perfect square and a perfect cube?", Answers: ["25", "64", "125"], Answer: 1),
                     Problem(Problem: "What is 25 * 4?", Answers: ["29","50","100"], Answer: 2),
                     Problem(Problem: "What is the cube root of 8?", Answers: ["1","2","4"], Answer: 1),
                     Problem(Problem: "What is 6 - 2?", Answers: ["2","3","4"], Answer: 2),
                     Problem(Problem: "What is (23 + 4)/3?", Answers: ["7","9","11"], Answer: 1),
                     Problem(Problem: "What is (2 + 2) - 1?", Answers: ["3","4","1"], Answer: 0),
                     Problem(Problem: "What is (17 + 3) * 5?", Answers: ["32","25","100"], Answer: 2),
                     Problem(Problem: "Solve for y: 13y + 3 = 68", Answers: ["4","5","6"], Answer: 1),
                     Problem(Problem: "What is 7 * 9?", Answers: ["16","63","36"], Answer: 1)]
        pickQuestion()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pickQuestion() {
        QNumber = Int(arc4random_uniform(UInt32(mathProblems.count)))
        questionLabel.text = mathProblems[QNumber].Problem
        
        answerNumber = mathProblems[QNumber].Answer
        
        for i in 0 ..< AnswerButtons.count{
            AnswerButtons[i].setTitle(mathProblems[QNumber].Answers[i], for: UIControlState.normal)
        }
    }
    
    @IBAction func bttn1(_ sender: UIButton) {
        if answerNumber == 0 {
            self.performSegue(withIdentifier: "unwindToHome", sender: self)
            bttn1.backgroundColor = UIColor.green
        } else {
            NSLog("Wrong")
            bttn1.backgroundColor = UIColor.red
        }
    }
    @IBAction func bttn2(_ sender: UIButton) {
        if answerNumber == 1 {
            self.performSegue(withIdentifier: "unwindToHome", sender: self)
            bttn2.backgroundColor = UIColor.green
        } else {
            NSLog("Wrong")
            bttn2.backgroundColor = UIColor.red
        }
    }
    @IBAction func bttn3(_ sender: UIButton) {
        if answerNumber == 2 {
            self.performSegue(withIdentifier: "unwindToHome", sender: self)
            bttn3.backgroundColor = UIColor.green
        } else {
            NSLog("Wrong")
            bttn3.backgroundColor = UIColor.red
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
            
        }
    }
    
    
    

