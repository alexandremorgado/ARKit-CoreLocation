//
//  Date+Extensions.swift
//  ARKit+CoreLocation
//
//  Created by Alexandre Morgado on 09/02/2018.
//  Copyright © 2018 Project Dent. All rights reserved.
//

import Foundation

extension Date {
    
    var minutesFromNow: TimeInterval {
        let pastTime = Date().timeIntervalSince1970 - self.timeIntervalSince1970
        return pastTime / 60
    }
    
    var secondsFromNow: TimeInterval {
        let pastTime = Date().timeIntervalSince1970 - self.timeIntervalSince1970
        return pastTime
    }
    
}
