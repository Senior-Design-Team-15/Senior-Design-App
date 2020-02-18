//
//  RocketSprite.swift
//  astroid-annhilator
//
//  Created by Ally Feldmeier on 12/10/19.
//  Copyright © 2019 Ally Feldmeier. All rights reserved.
//

import SpriteKit

public class RocketSprite : SKSpriteNode {
  public static func newInstance() -> RocketSprite {
    let rocketSprite = RocketSprite(imageNamed: "rocket")

    rocketSprite.zPosition = 5
    rocketSprite.physicsBody = SKPhysicsBody(circleOfRadius: rocketSprite.size.width / 2)

    return rocketSprite
  }

  public func update(deltaTime : TimeInterval) {

  }
}
