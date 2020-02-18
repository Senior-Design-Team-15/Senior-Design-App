//
//  galaxybackground.swift
//  astroid-annhilator
//
//  Created by Ally Feldmeier on 12/26/19.
//  Copyright © 2019 Ally Feldmeier. All rights reserved.
//

import Foundation
extension UIView {
    func addBackground() {
    // screen width and height:
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height

    let imageViewBackground = UIImageView(frame: CGRectMake(0, 0, width, height))
    imageViewBackground.image = UIImage(named: "galaxy")

    // you can change the content mode:
    imageViewBackground.contentMode = UIViewContentModeScaleAspectFit

    self.addSubview(imageViewBackground)
            self.sendSubviewToBack(imageViewBackground)
}
}
