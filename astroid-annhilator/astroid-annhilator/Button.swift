//
//  Button.swift
//  astroid-annhilator
//
//  Created by O'Brien, Kate C on 2/24/20.
//  Copyright © 2020 Ally Feldmeier. All rights reserved.
//

import Foundation
import SpriteKit

class Button: SKNode {
      let microphoneButton: SKSpriteNode
      let activeButton: SKSpriteNode
      var action: () -> ()

    init(defaultButtonImage: String, activeButtonImage: String, buttonAction: @escaping () -> ()) {
           microphoneButton = SKSpriteNode(imageNamed: defaultButtonImage)
           activeButton = SKSpriteNode(imageNamed: activeButtonImage)
           activeButton.isHidden = true
           action = buttonAction

           super.init()

           isUserInteractionEnabled = true
           addChild(microphoneButton)
           addChild(activeButton)
     }

     required init(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
     }

     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        activeButton.isHidden = false
        microphoneButton.isHidden = true
     }

     override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
             let location = touch.location(in: self)

             if microphoneButton.contains(location) {
                  activeButton.isHidden = false
                  microphoneButton.isHidden = true
             } else {
                   activeButton.isHidden = true
                   microphoneButton.isHidden = false
             }
        }
     }

     override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
          for touch in touches {
             let location = touch.location(in: self)

             if microphoneButton.contains(location) {
                 action()
             }

             activeButton.isHidden = true
             microphoneButton.isHidden = false
         }
    }
}
