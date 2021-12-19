//
//  MenuScene.swift
//  2dspacerunnergame
//
//  Created by Ihor Mandziuk on 12/9/21.
//

import SpriteKit

class MenuScene: SKScene {

    var starfield:SKEmitterNode!
    var StartGameButton:SKSpriteNode!
   
    
    
    override func didMove(to view: SKView) {
        
        starfield = self.childNode(withName: "starfield") as? SKEmitterNode
        StartGameButton = self.childNode(withName: "StartGameButton") as? SKSpriteNode
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self){
            let nodeArray = self.nodes(at: location)
            
            if nodeArray.first?.name == "StartGameButton"{
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let gameScene = GameScene(size: self.size)
                self.view?.presentScene(gameScene, transition: transition)
                
        }
    }
}
}
