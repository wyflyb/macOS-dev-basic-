//
//  ViewController.swift
//  CAAinamationDemo
//
//  Created by Alexcai on 2018/10/4.
//  Copyright © 2018 dongjiu. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var presentAnimationView: NSView!
    
    var sLayer: CAShapeLayer!
    
    /** 动画展示layer */
    lazy var animLayer : CALayer = {
        let layer = CALayer()
        layer.backgroundColor = NSColor.yellow.cgColor
        layer.bounds = CGRect(x: 0, y: 0, width: 50, height: 20)
        layer.anchorPoint = CGPoint.zero
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentAnimationView.layer?.backgroundColor = NSColor.gray.cgColor
        presentAnimationView.layer?.addSublayer(animLayer)
        // Do any additional setup after loading the view.
        let shaperLayer = CAShapeLayer()
        
        
        view.layer?.addSublayer(shaperLayer)
        sLayer = shaperLayer
        
        let startPoint = CGPoint(x: 50, y: 300)
        let endPoint = CGPoint(x:300,y:300)
        let controlPoint = CGPoint(x:170, y:400)
        
        let layer1 = CALayer()
        layer1.frame = CGRect(x:startPoint.x, y:startPoint.y,width: 5,height: 5)
        layer1.backgroundColor = NSColor.red.cgColor
        
        let layer2 = CALayer()
        layer2.frame = CGRect(x:endPoint.x, y:endPoint.y, width:5,height: 5)
        layer2.backgroundColor = NSColor.red.cgColor
        
        let layer3 = CALayer()
        layer3.frame = CGRect(x:controlPoint.x, y:controlPoint.y,width: 5, height:5)
        layer3.backgroundColor = NSColor.red.cgColor
        
        let path = NSBezierPath()
        let layer = CAShapeLayer()
        
        path.move(to: startPoint)
        path.curve(to: endPoint, controlPoint1: controlPoint, controlPoint2: controlPoint)

        
        layer.path = path.cgPath
        layer.fillColor = NSColor.clear.cgColor
        layer.strokeColor = NSColor.black.cgColor
        
        view.layer?.addSublayer(layer)
        view.layer?.addSublayer(layer1)
        view.layer?.addSublayer(layer2)
        view.layer?.addSublayer(layer3)
        sLayer = layer
      
        
    }

    override func mouseDown(with event: NSEvent) {
          strokeEndAnmi()
    }
}


extension ViewController{
    func moveAnimDemo()  {
        
       
        
        let moveAnim = CABasicAnimation(keyPath: "position.x")
        
        moveAnim.fromValue = 0
        moveAnim.toValue = 100
        moveAnim.duration = 2
        
        moveAnim.fillMode = .forwards
        moveAnim.isRemovedOnCompletion = false
        
        animLayer.add(moveAnim, forKey: nil)
        
        
    }
    
    func strokeEndAnmi()  {
    
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        sLayer.add(animation, forKey: "")
        
//        let animation1 = CABasicAnimation(keyPath: "strokeStart")
//        animation1.fromValue = 0
//        animation1.toValue = 1
//        animation1.duration = 2
//        sLayer.add(animation1, forKey: "")
        
//        let shapePath = NSBezierPath(rect: CGRect(x: 10, y: 10, width: 90, height: 10))
//        sLayer.path = shapePath.cgPath
//        sLayer.fillColor = NSColor.orange.cgColor
//
//
//        let moveAnim = CABasicAnimation(keyPath: "strokeEnd")
//
//
//        moveAnim.fromValue = 0
//        moveAnim.toValue = 1
//        moveAnim.duration = 6
//
//        moveAnim.fillMode = .forwards
//        moveAnim.isRemovedOnCompletion = false
//
//        sLayer.add(moveAnim, forKey: nil)
        
    }
}

