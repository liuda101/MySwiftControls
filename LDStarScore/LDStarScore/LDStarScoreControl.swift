//
//  LDStarScoreControl.swift
//  LDStarScore
//
//  Created by Liu Qifeng on 12/5/14.
//  Copyright (c) 2014 liuda101. All rights reserved.
//

import UIKit

class LDStarScoreControl: UIControl {
    
    var totalStarCount: UInt = 5
    var currentStar: Double = 3.5 {
        didSet {
            updateLayerFrames()
        }
    }
    
    var starGap: CGFloat = 5
    
    var starColor: UIColor = UIColor(red: 0.8, green: 0.8, blue: 0.1, alpha: 1.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let starSize = (bounds.width - starGap * (CGFloat(totalStarCount) + 1)) / CGFloat(totalStarCount)
        
        for i in 0..<totalStarCount {
            var starLayer = LDStarLayer(index: i, control: self)
            starLayer.frame = CGRectMake(starSize * CGFloat(i) + starGap * CGFloat(i + 1), 0, starSize, starSize)
            starLayer.contentsScale = UIScreen.mainScreen().scale
            layer.addSublayer(starLayer)
        }
        
        updateLayerFrames()
    }
    
    func updateLayerFrames() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        
        for starLayer in layer.sublayers {
            starLayer.setNeedsDisplay()
        }
        
        CATransaction.commit()
    }
    
    
    override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent) -> Bool {
        
        let location = touch.locationInView(self)
        updateCurrentStar(location.x)
        
        return true
    }
    
    override func continueTrackingWithTouch(touch: UITouch, withEvent event: UIEvent) -> Bool {
        
        let location = touch.locationInView(self)
        updateCurrentStar(location.x)
        
        sendActionsForControlEvents(.ValueChanged)
        
        return true
    }
    
    
    func updateCurrentStar(x: CGFloat) {
        
        var theX: CGFloat = x
        
        if x < starGap {
            theX = starGap
        } else if x > bounds.width {
            theX = bounds.width
        }
        
        let starSize = (bounds.width - starGap * (CGFloat(totalStarCount) + 1)) / CGFloat(totalStarCount) + starGap
        
        currentStar = Double((theX - starGap) / starSize)
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
