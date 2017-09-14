//
//  DotsLoadingView.swift
//  Dots 
//
//  Created by 母利睦人 on 2017/05/11.
//  Copyright © 2017年 makomori. All rights reserved.
//

import UIKit

public class DotsLoadingView: UIView {
    private let delay = 0.25
    private let length = 4
    
    public let loadingViewBackgroundColor = UIColor.white
    
    private let myBlue = UIColor.hexStr(hexStr: "#4284F7", alpha: 1.0)
    private let myRed = UIColor.hexStr(hexStr: "#F74239", alpha: 1.0)
    private let myYellow = UIColor.hexStr(hexStr: "#FDBC02", alpha: 1.0)
    private let myGreen = UIColor.hexStr(hexStr: "#4AB552", alpha: 1.0)
    public var colors: [UIColor] = []
    private var dots: [DotView] = []
    
    override public func awakeFromNib() {
        
        self.colors = [myBlue, myRed, myYellow, myGreen]

    
    }
    
//    required public init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
    
    public func show() {
        for i in 0..<colors.count {
            let dotFrame = CGRect(x: 0, y: 0, width: CGFloat(length), height: CGFloat(length))
            let dot = DotView(color: colors[i], delay: self.delay*Double(i), frame: dotFrame)
            dot.center = CGPoint(x: self.frame.width/8+ CGFloat(i)*self.frame.width/4, y: self.frame.height/2)
            dots.append(dot)
            self.addSubview(dot)
        }

    }
    
    public func stop() {
        if #available(iOS 10.0, *) {
            let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
                for dot in self.dots {
                    dot.alpha = 0
                }
            }
            animator.startAnimation()
            animator.addCompletion { _ in
                self.removeFromSuperview()
            }
        } else {
            // Fallback on earlier versions
            print("It's only availabel from iOS 10")
        }
    }
    
     public func startAnimation() {
        for i in 0..<colors.count {
            let dotFrame = CGRect(x: 0, y: 0, width: CGFloat(length), height: CGFloat(length))
            let dot = DotView(color: colors[i], delay: self.delay*Double(i), frame: dotFrame)
            dot.center = CGPoint(x: self.frame.width/8 + CGFloat(i)*self.frame.width/4, y: self.frame.height/2)
            dots.append(dot)
            self.addSubview(dot)
        }
    }
}
