//
//  RingView.swift
//  FitnessApp
//
/*
 MIT License

 Copyright (c) 2023 Fullstacktuts LLC

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
import UIKit

class RingView: UIView {
    
    var progress: CGFloat = CGFloat(0.5) {
        didSet {
            if progress >= 1.0 {
                progress = 1.0
            }
            else if progress <= 0.0 {
                progress = 0.0
            }
            ringLayer.strokeEnd = progress
        }
    }
    
    let backdropLayer: CAShapeLayer = CAShapeLayer()
    let ringWidth: CGFloat = CGFloat(40.0)
    var halfRingWidth: CGFloat {
        return ringWidth / 2
    }
    let ringLayer: CAShapeLayer = CAShapeLayer()
    var action: (() -> Void)?
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        let circlePath: CGPath = UIBezierPath(ovalIn: CGRect(x: halfRingWidth, y: halfRingWidth, width: bounds.width - ringWidth, height: bounds.height - ringWidth)).cgPath
        let offSet = CGFloat(90 * Double.pi / 180)
        backdropLayer.path = circlePath
        backdropLayer.lineWidth = ringWidth
        backdropLayer.strokeEnd = 1.0
        backdropLayer.fillColor = nil
        backdropLayer.strokeColor = UIColor(red: 112/255, green: 25/255, blue: 18/255, alpha: 1.0).cgColor
        layer.addSublayer(backdropLayer)
        ringLayer.path = circlePath
        ringLayer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        ringLayer.lineWidth = ringWidth
        ringLayer.strokeColor = UIColor.black.cgColor
        ringLayer.fillColor = nil
        ringLayer.strokeEnd = 0.5
        ringLayer.lineCap = CAShapeLayerLineCap.round
        ringLayer.transform = CATransform3DMakeRotation(offSet, 0, 0, -1.0)
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(red: 231/255, green: 51/255, blue: 38/255, alpha: 1.0).cgColor, UIColor(red: 248/255, green: 255/255, blue: 174/255, alpha: 1.0).cgColor]
        gradientLayer.frame = bounds
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.mask = ringLayer
        layer.addSublayer(gradientLayer)
    }


}

extension RingView: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if let action = action {
            action()
        }
    }
    
}
