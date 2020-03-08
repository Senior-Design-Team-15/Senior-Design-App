//
//  GameSprite.swift
//  swift3_game_development
//
//  Created by Ally Feldmeier on 12/7/19.
//  Copyright © 2019 Ally Feldmeier. All rights reserved.
//

import SpriteKit

protocol GameSprite {
    var textureAtlas:SKTextureAtlas { get set }
    var initialSize: CGSize { get set }
    func onTap()
}
