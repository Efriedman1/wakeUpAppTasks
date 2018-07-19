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
    var pauseButton: SKSpriteNode! = nil
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
      
    }
    
    func setupPhysics(){
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -3.0)
        physicsWorld.contactDelegate = self
    }
    
    func layoutScene() {
        backgroundColor = UIColor(red: 61/255, green: 66/255, blue: 71/255, alpha: 1.0)
        
        playButton = SKSpriteNode(imageNamed: "playButton")
        playButton.size = CGSize(width: 100, height: 100)
        playButton.position = CGPoint(x: frame.midX, y: frame.midY)
        
        pauseButton = SKSpriteNode(imageNamed: "pauseButton")
        pauseButton.size = CGSize(width: 30, height: 40)
        pauseButton.position = CGPoint(x:frame.maxX - 40.0, y: frame.maxY - 40.0)
        addChild(pauseButton)
        
        colorSwitch = SKSpriteNode(imageNamed: "ColorCircle")
        colorSwitch.size = CGSize(width: frame.size.width/3, height: frame.size.width/3)
        colorSwitch.position = CGPoint(x: frame.midX, y: frame.minY + colorSwitch.size.height)
        colorSwitch.zPosition = ZPositions.colorSwitch
        colorSwitch.physicsBody = SKPhysicsBody(circleOfRadius: colorSwitch.size.width/2)
        colorSwitch.physicsBody?.categoryBitMask = PhysicsCategories.switchCategory
        colorSwitch.physicsBody?.isDynamic = false
        addChild(colorSwitch)
        
        scoreLabel.fontName = "AvenirNext-Bold"
        scoreLabel.fontSize = 60.0
        scoreLabel.fontColor = UIColor.white
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
        
        ball = SKSpriteNode(texture: SKTexture(imageNamed: "ball"), color: PlayColors.colors[currentColorIndex!], size: CGSize(width: 20.0, height: 20.0))
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
    func turnWheelLeft() {
        colorSwitch.run(SKAction.rotate(byAngle: -.pi/2, duration: 0.25))
        if switchState.rawValue == 0 {
            let newState = SwitchState(rawValue: switchState.rawValue + 3)
            switchState = newState!
        } else {
            let newState = SwitchState(rawValue: switchState.rawValue - 1)
            switchState = newState!
        }
    }
    
    func gameOver(){
        UserDefaults.standard.set(score, forKey: "Recent Score")
        if score > UserDefaults.standard.integer(forKey: "Highscore") {
            UserDefaults.standard.set(score, forKey: "Highscore")
        }
    }
    
    //Explosion when ball hits wrong color
    func explosion(ball:SKSpriteNode){
        //Red
        let explosion = SKEmitterNode(fileNamed: "ExplosionRed")!
        explosion.position = ball.position
        self.addChild(explosion)
        //Blue
        let explosion2 = SKEmitterNode(fileNamed: "ExplosionBlue")!
        explosion2.position = ball.position
        self.addChild(explosion2)
        //Yellow
        let explosion3 = SKEmitterNode(fileNamed: "ExplosionYellow")!
        explosion3.position = ball.position
        self.addChild(explosion3)
        //Green
        let explosion4 = SKEmitterNode(fileNamed: "ExplosionGreen")!
        explosion4.position = ball.position
        self.addChild(explosion4)
        
        ball.removeFromParent()
        self.run(SKAction.wait(forDuration: 1)){
           
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = (touches.first as UITouch?)!
        let touchLocation = touch.location(in: self)
        
        if touchLocation.x < self.frame.size.width / 2 {
            turnWheelLeft()
        }else{
            turnWheelRight()
        }
        if pauseButton.contains(touchLocation) {
            self.isPaused = true
            self.physicsWorld.speed = 0
            self.speed = 0.0
            addChild(playButton)
            if playButton.contains(touchLocation){
                self.scene?.view?.isPaused = false
                self.physicsWorld.speed = -5
                self.speed = -5.0
                playButton.removeFromParent()
            }
        }
    }
    func pauseGame() {
        self.isPaused = true
        self.physicsWorld.speed = 0
        self.speed = 0.0
        self.scene?.view?.isPaused = true
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
                    //collision(ball: ball)
                    generator.impactOccurred()
                    ball.removeFromParent()
                    self.spawnBall()
                } else {
                    gameOver()
                    explosion(ball: ball)
                    let generator2 = UIImpactFeedbackGenerator(style: .heavy)
                    generator2.impactOccurred()
                }
            }
        }
    }
}
