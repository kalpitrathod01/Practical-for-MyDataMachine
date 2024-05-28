
//  UIViewX.swift
//  DesignableX
//
//  Created by Kalpit Rathod on 12/05/24.
//

import UIKit
import Foundation

class UIViewX: UIView {
    
    // MARK: - Gradient
    
    @IBInspectable var firstColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var horizontalGradient: Bool = false {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [ firstColor.cgColor, secondColor.cgColor ]
        
        if (horizontalGradient) {
            layer.startPoint = CGPoint(x: 0.0, y: 0.5)
            layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        } else {
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint(x: 0, y: 1)
        }
    }
    
    // MARK: - Border
    
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    // MARK: - Shadow
    
    @IBInspectable public var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable public var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var shadowOffsetY: CGFloat = 0 {
        didSet {
            layer.shadowOffset.height = shadowOffsetY
        }
    }
    
    @IBInspectable public var topCornerRadius: CGFloat = 0 {
        didSet {
          layer.cornerRadius = topCornerRadius
          layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
      }
      @IBInspectable public var bottomCornerRadius: CGFloat = 0 {
        didSet {
          layer.cornerRadius = bottomCornerRadius
          layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMaxYCorner]
        }
      }
    
    
}





class UITabBarX: UITabBar {
    
     class TabBarWithCorners: UITabBar {
        @IBInspectable var color: UIColor?
        @IBInspectable var radii: CGFloat = 15.0
        
        private var shapeLayer: CALayer?
        
        override func draw(_ rect: CGRect) {
            addShape()
        }
        
        private func addShape() {
            let shapeLayer = CAShapeLayer()
            
            shapeLayer.path = createPath()
            shapeLayer.strokeColor = UIColor.gray.withAlphaComponent(0.1).cgColor
            shapeLayer.fillColor = color?.cgColor ?? UIColor.white.cgColor
            shapeLayer.lineWidth = 2
            shapeLayer.shadowColor = UIColor.black.cgColor
            shapeLayer.shadowOffset = CGSize(width: 0   , height: -3);
            shapeLayer.shadowOpacity = 0.2
            shapeLayer.shadowPath =  UIBezierPath(roundedRect: bounds, cornerRadius: radii).cgPath
            
            
            if let oldShapeLayer = self.shapeLayer {
                layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
            } else {
                layer.insertSublayer(shapeLayer, at: 0)
            }
            
            self.shapeLayer = shapeLayer
        }
        
        private func createPath() -> CGPath {
            let path = UIBezierPath(
                roundedRect: bounds,
                byRoundingCorners: [.topLeft, .topRight],
                cornerRadii: CGSize(width: radii, height: 0.0))
            
            return path.cgPath
        }
        override func layoutSubviews() {
            super.layoutSubviews()
            self.isTranslucent = true
            var tabFrame            = self.frame
            tabFrame.size.height    = 65 + (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? CGFloat.zero)
            tabFrame.origin.y       = self.frame.origin.y +   ( self.frame.height - 65 - (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? CGFloat.zero))
            self.layer.cornerRadius = 20
            self.frame            = tabFrame
            
            
            
            self.items?.forEach({ $0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -5.0) })
            
            
        }
        
    }

        
}


