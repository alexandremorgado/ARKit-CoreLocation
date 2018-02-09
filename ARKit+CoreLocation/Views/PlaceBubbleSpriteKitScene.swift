//
//  PlaceBubbleSpriteKitScene.swift
//  ARKit+CoreLocation
//
//  Created by Alexandre Morgado on 09/02/2018.
//  Copyright © 2018 Project Dent. All rights reserved.
//

import UIKit
import SpriteKit

class PlaceBubbleSpriteKitScene: SKScene {
    var bubbleView: UIView?
    
    override func didMove(to view: SKView) {
        // changed to SKColor, but UIColor will work the same way. No Hex value.
        backgroundColor = SKColor(red: 0.53, green: 0.85, blue: 0.99, alpha: 1)
        
        guard let bubbleView: PlaceBubbleView = Bundle.main.loadNibNamed("PlaceBubbleView", owner: self, options: nil)?.first as? PlaceBubbleView else {return}
        let width: CGFloat = 256
        let height: CGFloat = 144
        bubbleView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        self.bubbleView = bubbleView
        
        
        view.addSubview(bubbleView)
    }
}

