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
    
    
    var questions = [Question]()
    var QNumber = Int()
    var answerNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        questions = [Question(Question: "Who was the only US President to serve more than two consecutive terms?", Answers: ["Franklin D. Roosevelt","George Washington","Grover  Cleveland"], Answer: 0),
             Question(Question: "What is 50 Cent's real name?", Answers: ["Sean Combs","Shawn Carter","Curtis Jackson"], Answer: 2),
             Question(Question: "What is the chemical symbol for gold?", Answers: ["Ag","Au","Gd"], Answer: 1),
             Question(Question: "Which country won the FIFA World Cup in 2018?", Answers: ["France","Croatia","England"], Answer: 0),
             Question(Question: "Of the following, which university was founded first?", Answers: ["University of Cambridge","University of Oxford","Harvard University"], Answer: 1),
             Question(Question: "Including the Bill of Rights, how many amendments does the U.S. Constitution currently have?", Answers: ["13","27","50"], Answer: 1),
             Question(Question: "Which of the following Founding Fathers did NOT die on July 4, 1826?", Answers: ["John Adams","Thomas Jefferson","Benjamin Franklin"], Answer: 2),
             Question(Question: "How many stripes are on the official U.S. flag?", Answers: ["13","27","50"], Answer: 0),
             Question(Question: "Who served as the 40th U.S. President?", Answers: ["Gerald Ford","Ronald Reagan","George H.W. Bush"], Answer: 1),
             Question(Question: "Which Chinese city hosted the 2008 Summer Olympics?", Answers: ["Beijing","Shanghai","Shenzhen"], Answer: 0),
            Question(Question: "Which of the following NBA players was NOT born in Akron, Ohio?", Answers: ["Lebron James","Steph Curry","Dwayne Wade"], Answer: 2),
            Question(Question: "Who wrote 'On the Origin of Species' after visiting the Galápagos Islands?", Answers: ["Charles Darwin","Gregor Mendel","Thomas Huxley"], Answer: 0),
            Question(Question: "Which hip-hop artist won the Pulitzer Prize for Music in 2018?", Answers: ["Kanye West","Kendrick Lamar","Nas"], Answer: 1),
            Question(Question: "Which fictional African kingdom does the Black Panther rule?", Answers: ["Wakanda","Atlantis","Mars"], Answer: 0),
            Question(Question: "Which planet is the second closest to the Sun?", Answers: ["Mercury","Venus","Earth"], Answer: 1),
            Question(Question: "Who is Sherlock Holmes' crime-solving partner?", Answers: ["James Moriarty","Mycroft Holmes","John Watson"], Answer: 2),
            Question(Question: "Which of the following people co-founded Apple?", Answers: ["Steve Jobs","Steve Tasks","Steve Rogers"], Answer: 0)]
        pickQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pickQuestion(){
//        for _ in 0 ..< 100 {
//            print(Int(arc4random_uniform(UInt32(questions.count))))
//        }
        QNumber = Int(arc4random_uniform(UInt32(questions.count)))
            questionLabel.text = questions[QNumber].Question
            
            answerNumber = questions[QNumber].Answer
            
            for i in 0 ..< Buttons.count{
                Buttons[i].setTitle(questions[QNumber].Answers[i], for: UIControlState.normal)
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
    //prepare function not working, nil value found when unwrapping optional
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? ViewController {
        
//            print("found destination vc")
//            destination.quizGameButton?.isEnabled = false
//            destination.quizGameButton?.setTitleColor(.green, for: .disabled)
//
//            print(destination.quizGameButton?.isEnabled)
            
//        }
        
    }
    
    
    
}
