//
//  GameViewController.swift
//  test2
//
//  Created by O'Brien, Kate C on 12/3/19.
//  Copyright © 2019 O'Brien, Kate C. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

extension UIView {
func addBackground() {
    // screen width and height:
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height

    let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
    imageViewBackground.image = UIImage(named: "galaxy")

    // you can change the content mode:
    imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill

    self.addSubview(imageViewBackground)
    self.sendSubviewToBack(imageViewBackground)
}}

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addBackground()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
