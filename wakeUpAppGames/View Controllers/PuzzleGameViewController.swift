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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func startGameTapped(_ sender: UIButton) {
        sceneView = SKView()
        self.view = sceneView
        if let view = self.view as? SKView {
            print("if statement called")
            if let scene = GameScene(fileNamed: "GameScene") {
                print("gamescene called")
                scene.scaleMode = .aspectFill
                view.ignoresSiblingOrder = false
                view.presentScene(scene)
            }
        }
            }
        }
