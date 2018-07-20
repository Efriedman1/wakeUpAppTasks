//
//  PuzzleGameViewController.swift
//  wakeUpAppGames
//
//  Created by Eric Friedman on 7/18/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit
import SpriteKit

class PuzzleGameViewController: UIViewController {
    
    var sceneView:SKView!
    
    @IBOutlet weak var puzzleGameLabel: UILabel!
   
    @IBOutlet weak var startGame: UIButton!
    
    let score = UserDefaults.standard.integer(forKey: "Highscore")
    let recentScore = UserDefaults.standard.integer(forKey: "Recent Score")
    let highScoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 60.0, height: 60.0))
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if recentScore >= 10 {
            startGame.layer.cornerRadius = 5
            highScoreLabel.center = CGPoint(x: 187.5, y: 300)
            highScoreLabel.textAlignment = .center
            highScoreLabel.text = "\(score)"
            highScoreLabel.font = UIFont.preferredFont(forTextStyle: .headline).withSize(50.0)
            view.addSubview(highScoreLabel)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func startGameTapped(_ sender: UIButton) {
        sceneView = SKView()
        self.view = sceneView
        if let view = self.view as? SKView {
            if let scene = GameScene(fileNamed: "GameScene") {
                highScoreLabel.removeFromSuperview()
                scene.scaleMode = .aspectFill
                view.ignoresSiblingOrder = false
                view.presentScene(scene)
            }
        }
    }
}
