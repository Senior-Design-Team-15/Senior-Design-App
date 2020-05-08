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
    
    //set up galaxy background
        let background=SKSpriteNode(imageNamed: "galaxy")
        background.position=CGPoint(x: 0, y: 0)
        background.size=CGSize(width:2100, height:1600)
        addChild(background) // add background to scene
    
  
 //https://www.raywenderlich.com/2619-sprite-kit-tutorial-space-shooter#toc-anchor-012
    
        }
        
   
    
    }




//}
