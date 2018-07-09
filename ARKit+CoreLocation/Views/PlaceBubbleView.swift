//
//  PlaceBubbleView.swift
//  ARKit+CoreLocation
//
//  Created by Alexandre Morgado on 2/9/18.
//  Copyright © 2018 Project Dent. All rights reserved.
//

import UIKit
import CoreLocation

class PlaceBubbleView: UIView {

    @IBOutlet weak var bubbleView: UIView!
    
    @IBOutlet weak var contentStackView: UIStackView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var placeText: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var triangleView: TriangleView!
    @IBOutlet weak var borderTriangleView: TriangleView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bubbleView.clipsToBounds = true
        bubbleView.layer.borderColor = UIColor.white.cgColor
        bubbleView.layer.borderWidth = 3
        
        ratingLabel.layer.cornerRadius = 4
        ratingLabel.layer.masksToBounds = true
        
        if #available(iOS 11.0, *) {
            contentStackView.setCustomSpacing(2, after: placeText)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bubbleView.layer.cornerRadius = 32
    }
    
    func setRatingBackgroundColor() {
        guard let ratingString = ratingLabel.text else { return }
        let rating = Double(ratingString) ?? -1
        switch rating {
        case 8...10:
            ratingLabel.backgroundColor = UIColor.green
        case 6.5...7.99:
            ratingLabel.backgroundColor = UIColor.flatYellowDark
        case 0...6.4:
            ratingLabel.backgroundColor = UIColor.flatRed
        default:
            ratingLabel.backgroundColor = UIColor.darkGray
        }
    }
    
    func updateDistanceLabel(nodeLocation: CLLocation, userLocation: CLLocation) {
        let distanceString = nodeLocation.distance(from: userLocation).stringFormatted
        distance.text = distanceString
    }
}
