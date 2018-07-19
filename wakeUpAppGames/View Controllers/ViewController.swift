//
//  ViewController.swift
//  wakeUpAppGames
//
//  Created by Eric Friedman on 7/18/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var goodMorningLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var quizGameButton: UIButton!
    @IBOutlet weak var mathGameButton: UIButton!
    @IBOutlet weak var puzzleGameButton: UIButton!
    
    
    @IBAction func quizGameButton(_ sender: UIButton) {
    
    }
    
    @IBAction func mathGameButton(_ sender: UIButton) {
        
    }
    
    @IBAction func puzzleGameButton(_ sender: Any) {
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if quizGameButton.isTouchInside == true {
            quizGameButton.setTitleColor(.green, for: .normal)
            quizGameButton.isEnabled = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

