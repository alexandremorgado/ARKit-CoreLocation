//
//  ScalingScheme.swift
//  ARKit+CoreLocation
//
//  Created by Alexandre Morgado on 15/02/18.
//  Copyright © 2018 Project Dent. All rights reserved.
//

public enum ScalingScheme {
    
    case normal
    case tiered(threshold: Double, scale: Float)
    case doubleTiered(firstThreshold: Double, firstScale: Float, secondThreshold: Double, secondScale: Float)
    case linear(threshold: Double)
    case linearBuffer(threshold: Double, buffer: Double)
    
    public func getScheme() -> ( (_ distance: Double, _ adjustedDistance: Double) -> Float ) {
        
        switch self {
        case .tiered(let threshold, let scale):
            return { (distance, adjustedDistance) in
                if adjustedDistance > threshold {
                    return scale
                }else{
                    return 1.0
                }
            }
        case .doubleTiered(let firstThreshold, let firstScale, let secondThreshold, let secondScale):
            return { (distance, adjustedDistance) in
                if adjustedDistance > secondThreshold {
                    return secondScale
                }else if adjustedDistance > firstThreshold {
                    return firstScale
                }else{
                    return 1.0
                }
            }
        case .linear(let threshold):
            return { (distance, adjustedDistance) in
                
                let maxSize = 1.0
                let absThreshold = abs(threshold)
                let absAdjDist = abs(adjustedDistance)
                
                let scaleToReturn =  Float( max (maxSize - (adjustedDistance / threshold), 0.0))
                print("threshold: \(threshold) adjDist: \(adjustedDistance) scaleToReturn: \(scaleToReturn)")
                return scaleToReturn
            }
        case .linearBuffer(let threshold, let buffer):
            return { (distance, adjustedDistance) in
                
                let maxSize = 1.0
                let absThreshold = abs(threshold)
                let absAdjDist = abs(adjustedDistance)
                
                if adjustedDistance < buffer {
                    print("threshold: \(threshold) adjDist: \(adjustedDistance)")
                    return Float(maxSize)
                }else{
                    let scaleToReturn =  Float( max( maxSize - (adjustedDistance / threshold), 0.0 ))
                    print("threshold: \(threshold) adjDist: \(adjustedDistance) scaleToReturn: \(scaleToReturn)")
                    return scaleToReturn
                }
            }
        case .normal:
            return { (distance, adjustedDistance) in
                
                //Scale it to be an appropriate size so that it can be seen
                var scale = Float(adjustedDistance) * 0.181
                if distance > 3000 {
                    scale = scale * 0.75
                }
                return scale
            }
        }
        
        
    }
    
}
