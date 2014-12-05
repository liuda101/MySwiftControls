//
//  LDStarLayer.swift
//  LDStarScore
//
//  Created by Liu Qifeng on 12/5/14.
//  Copyright (c) 2014 liuda101. All rights reserved.
//

import UIKit

class LDStarLayer: CALayer {
    var index: UInt = 0
    
    weak var control: LDStarScoreControl?
    
    override init() {
        super.init()
    }
    
    init(index: UInt, control: LDStarScoreControl) {
        super.init()
        
        self.index = index
        self.control = control
    }
    
    override func drawInContext(ctx: CGContext!) {
        let r1 = bounds.width / 2
        let r2 = r1 * CGFloat(sin(getRadient(18))) / CGFloat(sin(getRadient(126)))
        
        let points = [
            CGPointMake(r1 * CGFloat(cos(getRadient(90))), -r1 * CGFloat(sin(getRadient(90)))),
            CGPointMake(r2 * CGFloat(cos(getRadient(54))), -r2 * CGFloat(sin(getRadient(54)))),
            CGPointMake(r1 * CGFloat(cos(getRadient(18))), -r1 * CGFloat(sin(getRadient(18)))),
            CGPointMake(r2 * CGFloat(cos(getRadient(342))), -r2 * CGFloat(sin(getRadient(342)))),
            CGPointMake(r1 * CGFloat(cos(getRadient(306))), -r1 * CGFloat(sin(getRadient(306)))),
            CGPointMake(r2 * CGFloat(cos(getRadient(270))), -r2 * CGFloat(sin(getRadient(270)))),
            CGPointMake(r1 * CGFloat(cos(getRadient(234))), -r1 * CGFloat(sin(getRadient(234)))),
            CGPointMake(r2 * CGFloat(cos(getRadient(198))), -r2 * CGFloat(sin(getRadient(198)))),
            CGPointMake(r1 * CGFloat(cos(getRadient(162))), -r1 * CGFloat(sin(getRadient(162)))),
            CGPointMake(r2 * CGFloat(cos(getRadient(126))), -r2 * CGFloat(sin(getRadient(126))))
        ]
        
        
        CGContextTranslateCTM(ctx, r1, r1)
        CGContextBeginPath(ctx)
        CGContextMoveToPoint(ctx, points[0].x, points[0].y)
        CGContextAddLines(ctx, points, 10)
        CGContextClosePath(ctx)
        
        CGContextSetFillColorWithColor(ctx, control?.starColor.CGColor)
        CGContextSetStrokeColorWithColor(ctx, control?.starColor.CGColor)
        CGContextSetLineWidth(ctx, 0.5)
        
        
        let realStarNum = UInt(floor(control!.currentStar))
        if index < realStarNum {
            CGContextDrawPath(ctx, kCGPathFillStroke)
        } else {
            CGContextDrawPath(ctx, kCGPathStroke)
        }
        
        if control!.currentStar - floor(control!.currentStar) >= 0.5 && index == realStarNum {
            var newPoints = points.reverse()
            newPoints.insert(points[0], atIndex: 0)
            newPoints.removeLast(); newPoints.removeLast(); newPoints.removeLast(); newPoints.removeLast()
            CGContextBeginPath(ctx)
            CGContextMoveToPoint(ctx, newPoints[0].x, newPoints[0].y)
            CGContextAddLines(ctx, newPoints, 6)
            CGContextClosePath(ctx)
            
            CGContextDrawPath(ctx, kCGPathFill)
        }
    }
    
    func getRadient(c: Double) -> Double {
        return c / 180 * M_PI
    }
    
    

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
