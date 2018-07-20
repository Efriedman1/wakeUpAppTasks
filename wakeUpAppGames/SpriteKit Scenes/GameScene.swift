//
//  GameScene.swift
//  wakeUpAppGames
//
//  Created by Eric Friedman on 7/19/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

enum PlayColors {
    static let colors = [
        UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0),
        UIColor(red: 241/255, green: 196/255, blue: 15/255, alpha: 1.0),
        UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0),
        UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
    ]
}
enum SwitchState: Int {
    case red, yellow, green, blue
}
enum PhysicsCategories {
    
    static let none: UInt32 = 0
    static let ballCategory: UInt32 = 0x1           // 1
    static let switchCategory: UInt32 = 0x1 << 1    //10
}

enum ZPositions {
    
    //GameScene
    static let label: CGFloat = 0
    static let ball: CGFloat = 1
    static let colorSwitch: CGFloat = 2
    static let collision: CGFloat = 3
    
}
class GameScene: SKScene {
    var colorSwitch: SKSpriteNode!
    var playButton: SKSpriteNode!
    var ball: SKSpriteNode!
    var switchState = SwitchState.red
    var currentColorIndex: Int?
    
    let scoreLabel = SKLabelNode(text: "0")
    var score = 0
    
    var rightSide: Bool = false
    var leftSide: Bool = false
    
  
    
    
    override func didMove(to view: SKView) {
        setupPhysics()
        layoutScene()
    }
    override func update(_ currentTime: TimeInterval) {
        if score == 10 {
            let doneLabel = SKLabelNode(text: "Alarm Disabled!")
            doneLabel.fontName = ("AvenirNext-Bold")
            doneLabel.position = CGPoint(x: frame.midX, y: frame.midY + 200)
            doneLabel.fontSize = 60.0
            doneLabel.fontColor = UIColor.darkGray
            doneLabel.run(SKAction.fadeIn(withDuration: 0.5))
            addChild(doneLabel)
            doneLabel.run(SKAction.fadeOut(withDuration: 0.5))
        }
    }
    
    func setupPhysics(){
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -4.0)
        physicsWorld.contactDelegate = self
    }
    
    func layoutScene() {
        backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        
        playButton = SKSpriteNode(imageNamed: "playButton")
        playButton.size = CGSize(width: 100, height: 100)
        playButton.position = CGPoint(x: frame.midX, y: frame.midY)
        
        
        colorSwitch = SKSpriteNode(imageNamed: "ColorCircle")
        colorSwitch.size = CGSize(width: frame.size.width/3, height: frame.size.width/3)
        colorSwitch.position = CGPoint(x: frame.midX, y: frame.minY + colorSwitch.size.height)
        colorSwitch.zPosition = ZPositions.colorSwitch
        colorSwitch.physicsBody = SKPhysicsBody(circleOfRadius: colorSwitch.size.width/2)
        colorSwitch.physicsBody?.categoryBitMask = PhysicsCategories.switchCategory
        colorSwitch.physicsBody?.isDynamic = false
        addChild(colorSwitch)
        
        scoreLabel.fontName = "AvenirNext-Bold"
        scoreLabel.fontSize = 80.0
        scoreLabel.fontColor = UIColor.darkGray
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        scoreLabel.zPosition = ZPositions.label
        addChild(scoreLabel)
        
        spawnBall()
        
    }
    
    func updateScoreLabel(){
        scoreLabel.text = "\(score)"
    }
    
    func spawnBall(){
        currentColorIndex = Int(arc4random_uniform(UInt32(4)))
        
        ball = SKSpriteNode(texture: SKTexture(imageNamed: "ball"), color: PlayColors.colors[currentColorIndex!], size: CGSize(width: 40.0, height: 40.0))
        ball.colorBlendFactor = 1.0
        ball.name = "Ball"
        ball.position = CGPoint(x: frame.midX, y: frame.maxY)
        ball.zPosition = ZPositions.ball
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
        ball.physicsBody?.categoryBitMask = PhysicsCategories.ballCategory
        ball.physicsBody?.contactTestBitMask = PhysicsCategories.switchCategory
        ball.physicsBody?.collisionBitMask = PhysicsCategories.none
        
        addChild(ball)
    }
    
    func turnWheelRight() {
        colorSwitch.run(SKAction.rotate(byAngle: .pi/2, duration: 0.25))
        if let newState = SwitchState(rawValue: switchState.rawValue + 1){
            switchState = newState
        } else {
            switchState = .red
        }
    }
    
    func gameOver(){
        UserDefaults.standard.set(score, forKey: "Recent Score")
        if score > UserDefaults.standard.integer(forKey: "Highscore") {
            UserDefaults.standard.set(score, forKey: "Highscore")
        }
        if score >= 10 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Main")
            vc.view.frame = (self.view?.frame)!
            vc.view.layoutIfNeeded()
            UIView.transition(with: self.view!, duration: 0.3, options: .transitionFlipFromRight, animations:
                {
                    self.view?.window?.rootViewController = vc
            }, completion: { completed in
                })
    
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Switch")
            vc.view.frame = (self.view?.frame)!
            vc.view.layoutIfNeeded()
           
            UIView.transition(with: self.view!, duration: 0.3, options: .transitionFlipFromRight, animations:
                {
                    self.view?.window?.rootViewController = vc
            }, completion: { completed in
            })
            let puzzleGame = PuzzleGameViewController()
            puzzleGame.highScoreLabel.removeFromSuperview()
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 60.0))
            label.center = CGPoint(x: puzzleGame.view.frame.midX, y: puzzleGame.view.frame.midY)
            label.textAlignment = .center
            label.text = "Try Again!"
            label.font = UIFont.preferredFont(forTextStyle: .headline).withSize(50.0)
                vc.view.addSubview(label)
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        turnWheelRight()
    }
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if contactMask == PhysicsCategories.ballCategory | PhysicsCategories.switchCategory {
            if let ball = contact.bodyA.node?.name == "Ball" ?
                contact.bodyA.node as? SKSpriteNode : contact.bodyB.node as?
                SKSpriteNode {
                if currentColorIndex == switchState.rawValue {
                    score += 1
                    updateScoreLabel()
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.impactOccurred()
                    ball.removeFromParent()
                    self.spawnBall()
                } else {
                    gameOver()
                    let generator2 = UIImpactFeedbackGenerator(style: .heavy)
                    generator2.impactOccurred()
                }
            }
        }
    }
}
