//
//  GameScene.swift
//  2d game
//
//  Created by Ihor Mandziuk on 11/4/21.
//

import SpriteKit
import GameplayKit


var player = SKSpriteNode()
var projecTile = SKSpriteNode()
var enemy = SKSpriteNode()
var star = SKSpriteNode()

var scoreLabel = SKSpriteNode()
var mainLabel = SKSpriteNode()

var playerSize = CGSize(width: 200, height: 100)
var projecTileSize = CGSize(width: 100, height: 50)
var enemySize = CGSize(width: 150, height: 150)
var starSize = CGSize()

var offBlackColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
var offWhiteColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
var orangeCustomeColor = UIColor.orange

var projecTileRate = 0.2
var projecTileSpeed = 0.9

var isAlive = true
var score = 0

var touchLocation = CGPoint()

struct physicsCategory{
    static let player: UInt32 = 0
    static let projectile: UInt32 = 1
    static let enemy: UInt32 = 2
    
}


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    override func didMove(to view: SKView) {
        self.backgroundColor = offBlackColor
        physicsWorld.contactDelegate = self
        
        resetGameVariableOnStart()
        
        LeadPlayer()
       
    }
    
    func LeadPlayer() {
        player = SKSpriteNode(imageNamed: "ship")
        player.size = playerSize
        player.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.categoryBitMask = physicsCategory.player
        player.physicsBody?.contactTestBitMask = physicsCategory.enemy
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.isDynamic = false
        player.name = "playerName"
        self.addChild(player)
    }
    
    func resetGameVariableOnStart(){
        isAlive = true
        score = 0;
    }
    
    func leadProjectTile(){
        projecTile = SKSpriteNode(imageNamed: "projectile")
        projecTile.size = projecTileSize
        projecTile.position = CGPoint(x: player.position.x, y: player.position.y)
        
        projecTile.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        projecTile.physicsBody?.affectedByGravity = false
        projecTile.physicsBody?.categoryBitMask = physicsCategory.projectile
        projecTile.physicsBody?.contactTestBitMask = physicsCategory.enemy
        projecTile.physicsBody?.allowsRotation = false
        projecTile.physicsBody?.isDynamic = true
        projecTile.name = "playerTileName"
        projecTile.zPosition = -1
        
        MoveProjecTileToTop()
        
        self.addChild(projecTile)
    }
    
    func MoveProjecTileToTop(){
        let moveForward = SKAction.moveTo(y: 600, duration: projecTileSpeed)
        let destroy = SKAction.removeFromParent()
        
        projecTile.run(SKAction.sequence([moveForward, destroy]))
    }
    
    func spawnEnemy(){
        enemy = SKSpriteNode(imageNamed: "enemy")
        enemy.size = enemySize
        enemy.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        enemy.physicsBody = SKPhysicsBody(rectangleOf: enemy.size)
        enemy.physicsBody?.affectedByGravity = false
        enemy.physicsBody?.categoryBitMask = physicsCategory.player
        enemy.physicsBody?.contactTestBitMask = physicsCategory.projectile
        enemy.physicsBody?.allowsRotation = false
        enemy.physicsBody?.isDynamic = true
        enemy.name = "enemyName"
        self.addChild(enemy)
    }
    
    func randomBewteenNumbers(firstNum: CGFloat, SecondNum: CGFloat) -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - SecondNum) + min(firstNum, SecondNum)
    }
    
    func moveEnemyToFloor(){
        let moveTo = SKAction.moveTo(y: -600, duration: enemySpeed)
        let
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            touchLocation = touch.location(in: player)
            
        }
    }
    
    func movePlayerOnTouch(){
        player.position.x = (touchLocation.x)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            touchLocation = touch.location(in: player)
            movePlayerOnTouch()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
