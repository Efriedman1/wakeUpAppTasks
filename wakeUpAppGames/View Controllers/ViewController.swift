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
    
    @IBOutlet weak var nextSceneButton: UIButton!
    
    @IBAction func quizGameButton(_ sender: UIButton) {
        quizGameButton.setTitleColor(.green, for: .disabled)
        quizGameButton.isEnabled = false
    }
    
    @IBAction func mathGameButton(_ sender: UIButton) {
        mathGameButton.setTitleColor(.green, for: .disabled)
        mathGameButton.isEnabled = false
    }
    
    @IBAction func puzzleGameButton(_ sender: Any) {
        puzzleGameButton.setTitleColor(.green, for: .disabled)
        puzzleGameButton.isEnabled = false
    }
    
    @IBAction func nextSceneTapped(_ sender: UIButton) {
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextSceneButton.isEnabled = false
//        if quizGameButton.isTouchInside == true {
//            quizGameButton.setTitleColor(.green, for: .disabled)
//            quizGameButton.isEnabled = false
//        }
//        
//        if mathGameButton.isTouchInside == true {
//            mathGameButton.setTitleColor(.green, for: .disabled)
//            mathGameButton.isEnabled = false
//        }
//        
//        if puzzleGameButton.isTouchInside == true {
//            puzzleGameButton.setTitleColor(.green, for: .disabled)
//            puzzleGameButton.isEnabled = false
//        }
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch: AnyObject in touches {
//
//            if quizGameButton.contains(touch.location as! UIFocusEnvironment) {
//                quizGameButton.setTitleColor(.green, for: .disabled)
//                quizGameButton.isEnabled = false
//
//            }
//        }
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation
    @IBAction func unwindToHome(segue:UIStoryboardSegue) {
        
    }
}

