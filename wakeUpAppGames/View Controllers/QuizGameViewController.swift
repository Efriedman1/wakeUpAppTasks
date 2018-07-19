//
//  QuizGameViewController.swift
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

class QuizGameViewController: UIViewController {
    
    let viewController = ViewController()
    
    @IBOutlet weak var quizGameLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var Buttons: [UIButton]!
    
    @IBOutlet weak var bttn1: UIButton!
    @IBOutlet weak var bttn2: UIButton!
    @IBOutlet weak var bttn3: UIButton!
    
    
    var Questions = [Question]()
    var QNumber = Int()
    var answerNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        Questions = [Question(Question: "Who was the only US President to serve more than two consecutive terms?", Answers: ["Franklin D. Roosevelt","George Washington","Grover  Cleveland"], Answer: 0),
                     Question(Question: "What is 50 Cent's real name?", Answers: ["Sean Combs","Shawn Carter","Curtis Jackson"], Answer: 2),
                     Question(Question: "What is the chemical symbol for mercury?", Answers: ["Ag","Au","Gd"], Answer: 1),
                     Question(Question: "Which country won the FIFA World Cup in 2018?", Answers: ["France","Croatia","England"], Answer: 0),
                     Question(Question: "Of the following, which university was founded first?", Answers: ["University of Cambridge","University of Oxford","Harvard University"], Answer: 1)]
        pickQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pickQuestion(){
            QNumber = Int(arc4random_uniform(4))
            questionLabel.text = Questions[QNumber].Question
            
            answerNumber = Questions[QNumber].Answer
            
            for i in 0 ..< Buttons.count{
                Buttons[i].setTitle(Questions[QNumber].Answers[i], for: UIControlState.normal)
            }
    }
    
    @IBAction func bttn1(_ sender: UIButton) {
        if answerNumber == 0 {
            self.performSegue(withIdentifier: "quizGame", sender: self)
        } else {
            NSLog("Wrong")
            bttn1.backgroundColor = UIColor.red
        }
    }
    @IBAction func bttn2(_ sender: UIButton) {
        if answerNumber == 1 {
            self.performSegue(withIdentifier: "quizGame", sender: self)
        } else {
            NSLog("Wrong")
            bttn2.backgroundColor = UIColor.red
        }
    }
    @IBAction func bttn3(_ sender: UIButton) {
        if answerNumber == 2 {
            self.performSegue(withIdentifier: "quizGame", sender: self)
        } else {
           NSLog("Wrong")
            bttn3.backgroundColor = UIColor.red
        }
    }
    //prepare function not working, nil value found when unwrapping optional
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController: ViewController = segue.destination as! ViewController
        destViewController.quizGameButton.setTitleColor(.green, for: .normal)
        destViewController.quizGameButton.isEnabled = false
    }
    
    
}
