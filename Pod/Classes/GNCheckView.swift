//
//  GNCheckView.swift
//  Pods
//
//  Created by Gonzalo Nunez on 8/13/15.
//
//

import Foundation
import UIKit

@IBDesignable public class GNCheckView : UIView {
    
    static let kCheckAnimationKey = "drawCheck"
    
    @IBInspectable public var primaryColor = UIColor.blackColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var secondaryColor = UIColor.whiteColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var initiallyDrawn = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var showsBorder = true {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var invertsOnCheck = true
    
    private var checkmarkLayer:CAShapeLayer
    
    public var checked : Bool {
        return checkmarkLayer.strokeEnd == 1
    }
    
    //MARK: Initialization
    
    required public init(coder aDecoder: NSCoder) {
        checkmarkLayer = CAShapeLayer()
        super.init(coder: aDecoder)
    }
    
    override public init(frame: CGRect) {
        checkmarkLayer = CAShapeLayer()
        super.init(frame: frame)
    }
    
    public init() {
        checkmarkLayer = CAShapeLayer()
        super.init(frame: CGRectZero)
    }
    
    public func checkAnimated(animated:Bool) {
        check(true, animated: animated)
    }
    
    public func uncheckAnimated(animated:Bool) {
        check(false, animated: animated)
    }
    
    public func check(shouldCheck:Bool, animated:Bool) {
        
        let strokeEnd : CGFloat = shouldCheck ? 1 : 0
        
        let checkAnimation = CABasicAnimation(keyPath: "strokeEnd")
        checkAnimation.duration = animated ? 0.2 : 0
        checkAnimation.fromValue = shouldCheck ? 0 : 1
        checkAnimation.toValue = strokeEnd
        checkAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        checkmarkLayer.strokeEnd = strokeEnd
        
        CATransaction.begin()
        
        CATransaction.setCompletionBlock() {
            if (self.invertsOnCheck) {
                CATransaction.begin()
                self.checkmarkLayer.backgroundColor = shouldCheck ? self.primaryColor.CGColor : self.secondaryColor.CGColor
                self.checkmarkLayer.strokeColor = shouldCheck ? self.secondaryColor.CGColor : self.primaryColor.CGColor
                CATransaction.commit()
            }
        }
        
        if (animated) {
            checkmarkLayer.addAnimation(checkAnimation, forKey: GNCheckView.kCheckAnimationKey)
        }
        
        CATransaction.commit()
        
    }
    
    //MARK: Drawing
    
    override public func drawRect(rect: CGRect) {
        super.drawRect(rect)
    }
    
    override public func drawLayer(layer: CALayer!, inContext ctx: CGContext!) {
        super.drawLayer(layer, inContext: ctx)
        
        if (showsBorder) {
            layer.borderColor = primaryColor.CGColor
            layer.borderWidth = 2
            layer.cornerRadius = 5
            layer.masksToBounds = true
        }

        checkmarkLayer.removeFromSuperlayer()
        
        let padding : CGFloat = 2
        let width : CGFloat = min(layer.bounds.width, layer.bounds.height) - padding
        
        checkmarkLayer.bounds = CGRect(x: padding, y: padding, width: width, height: width)
        checkmarkLayer.position = CGPoint(x: CGRectGetMidX(layer.bounds), y: CGRectGetMidY(layer.bounds))
        
        let checkmarkPath = CGPathCreateMutable()
        
        CGPathMoveToPoint(checkmarkPath, nil, checkmarkLayer.bounds.midX - 4, checkmarkLayer.bounds.midY + 1)
        CGPathAddLineToPoint(checkmarkPath, nil, checkmarkLayer.bounds.midX, checkmarkLayer.bounds.midY + 6)
        CGPathAddLineToPoint(checkmarkPath, nil, checkmarkLayer.bounds.maxX - checkmarkLayer.bounds.midX/2, checkmarkLayer.bounds.midY/2 + 1)
        
        checkmarkLayer.path = checkmarkPath
        
        checkmarkLayer.lineCap = kCALineCapRound
        checkmarkLayer.lineWidth = 3
        
        checkmarkLayer.strokeEnd = initiallyDrawn ? 1 : 0
        
        if (initiallyDrawn && invertsOnCheck) {
            checkmarkLayer.backgroundColor = self.primaryColor.CGColor
            checkmarkLayer.strokeColor = self.secondaryColor.CGColor
        }
        
        checkmarkLayer.strokeColor = primaryColor.CGColor
        checkmarkLayer.fillColor = UIColor.clearColor().CGColor
        
        layer.addSublayer(checkmarkLayer)
    }
    
    
}