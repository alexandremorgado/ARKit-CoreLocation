//
//  PlaceBubbleView.swift
//  ARKit+CoreLocation
//
//  Created by Alexandre Morgado on 2/9/18.
//  Copyright © 2018 Project Dent. All rights reserved.
//

import UIKit

class PlaceBubbleView: UIView {

    @IBOutlet var bubbleView: UIView!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var placeText: UILabel!
    @IBOutlet var distance: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    
    @IBOutlet var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bubbleView.clipsToBounds = true
        
        ratingLabel.layer.cornerRadius = 4
        ratingLabel.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bubbleView.layer.cornerRadius = bubbleView.layer.bounds.height / 2
    }
    
    func setRatingBackgroundColor() {
        guard let ratingString = ratingLabel.text else { return }
        let rating = Double(ratingString) ?? -1
        switch rating {
        case 8...10:
            ratingLabel.backgroundColor = UIColor.green
        case 6.5...7.99:
            ratingLabel.backgroundColor = UIColor.yellow
        case 0...6.4:
            ratingLabel.backgroundColor = UIColor.red
        default:
            ratingLabel.backgroundColor = UIColor.darkGray
        }
    }
}
