//
//  GameScene.swift
//  astroid annhilator
//
//  Created by Ally Feldmeier on 12/5/19.
//  Copyright © 2019 Ally Feldmeier. All rights reserved.
//


import SpriteKit
import GameplayKit

class GameScene: SKScene {

override func didMove(to view: SKView) {
    
    // make the scene position from the lower left corner regardless of any settings
    self.anchorPoint = .zero

 
    // create our rocket sprite node
    let rocket = SKSpriteNode(imageNamed: "rocket")
     // attach the rocket to the scenes node tree
    // define rocket position and size
    rocket.position = CGPoint(x:525, y:150) // position our rocket node
    rocket.size = CGSize(width:200, height:200) // size our rocket
    self.addChild(rocket)
    
    // set up astroid
    let astroid=SKSpriteNode(imageNamed: "astroid")
    astroid.position=CGPoint(x:125 , y: 650)
    self.addChild(astroid)

    // set up second astroid
    let astroid2=SKSpriteNode(imageNamed: "astroid")
    astroid2.position=CGPoint(x:325, y:650)
    self.addChild(astroid2)
    
    // set up third astroid
    let astroid3=SKSpriteNode(imageNamed: "astroid")
    astroid3.position=CGPoint(x:525, y:650)
    self.addChild(astroid3)
    
    let astroid4=SKSpriteNode(imageNamed: "astroid")
    astroid4.position=CGPoint(x:725, y:650)
    addChild(astroid4)
    
    let astroid5=SKSpriteNode(imageNamed: "astroid")
    astroid5.position=CGPoint(x:925, y:650)
    addChild(astroid5)
    
    let astroid6=SKSpriteNode(imageNamed: "astroid")
    astroid6.position=CGPoint(x:125, y:450)
    addChild(astroid6)
    
    let astroid7=SKSpriteNode(imageNamed: "astroid")
    astroid7.position=CGPoint(x:325, y:450)
    addChild(astroid7)
    
    let astroid8=SKSpriteNode(imageNamed: "astroid")
    astroid8.position=CGPoint(x:525, y:450)
    addChild(astroid8)
    
    let astroid9=SKSpriteNode(imageNamed: "astroid")
    astroid9.position=CGPoint(x:725, y:450)
    addChild(astroid9)
    
    let astroid10=SKSpriteNode(imageNamed: "astroid")
    astroid10.position=CGPoint(x:925, y:450)
    addChild(astroid10)
    // next steps are to add shooting on tap causing the fireball to appear
    // make the rocket stop moving
    
    
    // create an SKAction to run rocket sequence
     
    //rocket animations
    //let remove=SKAction.removeFromParent()
    //let rocketfadein=SKAction.fadeIn(withDuration: 1)
    //let rocketsequence=SKAction.sequence([rocketmove,remove,rocketfadein])
    //rocket.run(rocketsequence)
       
    // set up galaxy background
    let background=SKSpriteNode(imageNamed: "galaxy")
    background.position=CGPoint(x: 0, y: 0)
    background.size=CGSize(width:2100, height:1600)
    addChild(background) // add background to scene
    
    
  
 //https://www.raywenderlich.com/2619-sprite-kit-tutorial-space-shooter#toc-anchor-012
    
    }
     
   
    
    }

    
  
    



//}
