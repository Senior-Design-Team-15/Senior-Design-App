//
//  GameScene.swift
//  astroid annhilator
//
//  Created by Ally Feldmeier on 12/5/19.
//  Copyright © 2019 Ally Feldmeier. All rights reserved.
//


import SpriteKit
import GameplayKit
import Speech


class GameScene: SKScene {
    private var label : SKLabelNode?
    var viewController : GameViewController!

    override func didMove(to view: SKView) {
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
      
        self.run(SKAction.wait(forDuration: 2),completion:{[unowned self] in
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            if let vc = appDelegate.window?.rootViewController {
                self.viewController = vc as? GameViewController
               
            }
            
        })
        
    // make the scene position from the lower left corner regardless of any settings
        self.anchorPoint = .zero

 
    // create our rocket sprite node
//        let rocket = SKSpriteNode(imageNamed: "rocket")
//     // attach the rocket to the scenes node tree
//    // define rocket position and size
//        rocket.position = CGPoint(x:525, y:100) // position our rocket node
//        rocket.size = CGSize(width:100, height:150) // size our rocket
//        self.addChild(rocket)
    
    
    // set up astroid
//        let asteroid0=SKSpriteNode(imageNamed: "asteroid")
//        asteroid0.position=CGPoint(x:125 , y: 500)
//        self.addChild(asteroid0)
//
//        let asteroid1=SKSpriteNode(imageNamed: "asteroid")
//        asteroid1.position=CGPoint(x:325, y:450)
//        self.addChild(asteroid1)
//
//    // set up astroid
//        let asteroid2=SKSpriteNode(imageNamed: "asteroid")
//        asteroid2.position=CGPoint(x:525, y:500)
//        self.addChild(asteroid2)
//
//    // set up astroid
//        let asteroid3=SKSpriteNode(imageNamed: "asteroid")
//        asteroid3.position=CGPoint(x:725, y:450)
//        self.addChild(asteroid3)
//
//        let asteroid4=SKSpriteNode(imageNamed: "asteroid")
//        asteroid4.position=CGPoint(x:925, y:500)
//        addChild(asteroid4)
    
//        let asteroid5=SKSpriteNode(imageNamed: "asteroid")
//        asteroid5.position=CGPoint(x:125, y:300)
//        addChild(asteroid5)
//
//        let asteroid6=SKSpriteNode(imageNamed: "asteroid")
//        asteroid6.position=CGPoint(x:325, y:250)
//        addChild(asteroid6)
//
//        let asteroid7=SKSpriteNode(imageNamed: "asteroid")
//        asteroid7.position=CGPoint(x:525, y:300)
//        addChild(asteroid7)
//
//        let asteroid8=SKSpriteNode(imageNamed: "asteroid")
//        asteroid8.position=CGPoint(x:725, y:250)
//        addChild(asteroid8)
//
//        let asteroid9=SKSpriteNode(imageNamed: "asteroid")
//        asteroid9.position=CGPoint(x:925, y:300)
//        addChild(asteroid9)
    
    // next steps are to add shooting on tap causing the fireball to appear
    // make the rocket stop moving
    
    
    // create an SKAction to run rocket sequence
     
    //rocket animations
    //let remove=SKAction.removeFromParent()
    //let rocketfadein=SKAction.fadeIn(withDuration: 1)
    //let rocketsequence=SKAction.sequence([rocketmove,remove,rocketfadein])
    //rocket.run(rocketsequence)
       
    
    //set up galaxy background
        let background=SKSpriteNode(imageNamed: "galaxy")
        background.position=CGPoint(x: 0, y: 0)
        background.size=CGSize(width:2100, height:1600)
        addChild(background) // add background to scene
    
  
 //https://www.raywenderlich.com/2619-sprite-kit-tutorial-space-shooter#toc-anchor-012
    
        }
        
   
    
    }




//}
