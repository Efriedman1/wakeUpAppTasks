//
//  MathGameViewController.swift
//  wakeUpAppGames
//
//  Created by Eric Friedman on 7/18/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit

struct Problem {
    var Problem: String!
    var Answers: [String]!
    var Answer: Int!
}

class MathGameViewController: UIViewController {
    
    @IBOutlet weak var mathGameLabel: UILabel!
    
    var mathProblems = [Problem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
}
