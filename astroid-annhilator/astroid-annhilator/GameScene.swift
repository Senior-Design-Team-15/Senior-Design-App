//
//  GameScene.swift
//  astroid annhilator
//
//  Created by Ally Feldmeier on 12/5/19.
//  Copyright © 2019 Ally Feldmeier. All rights reserved.
//


import SpriteKit
import SpriteKit

class GameScene: SKScene {
    var background=SKSpriteNode(imageNamed: "galaxy")
        override func didMove(to view: SKView) {
            background.position=CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
            addChild(background)
        // make the scene position from its lower left
        self.anchorPoint = .zero
     
        // ??????? add an astroid to the scene
      //  let astroid=astroidAndExplosion()
        //         astroid.position=CGPoint(x:250,y:700)
          //       self.addChild(astroid)
        
        
        
        // create our rocket sprite node
        let rocket = SKSpriteNode()
        // position our rocket node
        rocket.position = CGPoint(x:50, y:250)
        // size our rocket
        rocket.size = CGSize(width:300, height:300)
        // attach the rocket to the scenes node tree
        self.addChild(rocket)

        
     //   ?????????? rockets only switch off if i only use the sequence command
    
        // Find new rocket texture atlas
        let rocketAtlas=SKTextureAtlas(named:"space_images")
        // grab the two rocket frames from the texture atlas in an array
        let rocketFrames:[SKTexture] = [rocketAtlas.textureNamed("rocket"), rocketAtlas.textureNamed("rocket_shooting")]
        // Create a new SKAction to animate between the frames once
        let flyAction=SKAction.animate(with: rocketFrames, timePerFrame: 1)
        // create an SKAction to run the flyAction repeatedly
        let flyAction2=SKAction.move(to: CGPoint(x: 700, y:150), duration: 10)
        // group the actions into a sequence
        let flyAction3=SKAction.sequence([flyAction, flyAction2])
        // execute sequence
        rocket.run(flyAction3)
 
        // add a second astroid to the scene in line with the first astroid
       // let astroid2=Astroid()
        //astroid2.position=CGPoint(x:250,y:425)
        //self.addChild(astroid2)
    }
    
        
}
