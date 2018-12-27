/*
 
 MIT License
 
 Copyright (c) 2018 Gwinyai Nyatsoka
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showSkeleton()
        
    }
    
    func showSkeleton() {
        
        let skeletonView = UIView()
        
        skeletonView.backgroundColor = UIColor.white
        
        view.addSubview(skeletonView)
        
        let viewHeight = view.frame.height
        
        let cellHeight:CGFloat = 250
        
        let numberOfCells = Int(viewHeight / 250) + 1
        
        let skeletonViewHeight = cellHeight * CGFloat(numberOfCells)
        
        skeletonView.frame = CGRect(x: 0, y: 10, width: view.bounds.width, height: skeletonViewHeight)
        
        let backgroundGradientLayer = CAGradientLayer()
        
        backgroundGradientLayer.frame = skeletonView.bounds
        
        backgroundGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        
        backgroundGradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        backgroundGradientLayer.locations = [0.25, 0.5, 0.75]
        
        backgroundGradientLayer.colors = [UIColor(red: 184/255, green: 184/255, blue: 184/255, alpha: 1.0).cgColor, UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1/0).cgColor, UIColor(red: 184/255, green: 184/255, blue: 184/255, alpha: 1.0).cgColor]
        
        skeletonView.layer.addSublayer(backgroundGradientLayer)
        
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        
        gradientAnimation.fromValue = [0.0, 0.0, 0.25]
        
        gradientAnimation.toValue = [0.65, 1.0, 1.0]
        
        gradientAnimation.duration = 1
        
        gradientAnimation.repeatCount = .greatestFiniteMagnitude
        
        gradientAnimation.fillMode = CAMediaTimingFillMode.forwards
        
        gradientAnimation.isRemovedOnCompletion = false
        
        backgroundGradientLayer.add(gradientAnimation, forKey: nil)
        
        let skeletonFrame = UIBezierPath()
        
        let gutterHeight = CGFloat(10)
        
        for i in 0...numberOfCells {
            
            let offset = CGFloat(i) * cellHeight
 
            let profileFrame = UIBezierPath(ovalIn: CGRect(x: 20, y: 10 + offset, width: 60, height: 60))
        
            skeletonFrame.append(profileFrame)
        
            let titleFrame = UIBezierPath(rect: CGRect(x: 90, y: 20 + offset, width: view.bounds.width * 0.6 - 90, height: 8))
        
            skeletonFrame.append(titleFrame)
        
            let subTitleFrame = UIBezierPath(rect: CGRect(x: 90, y: 40 + offset, width: view.bounds.width * 0.4 - 90, height: 8))
        
            skeletonFrame.append(subTitleFrame)
        
            let contentFrame1 = UIBezierPath(rect: CGRect(x: 20, y: 100 + offset, width: view.bounds.width * 0.65, height: 8))
        
            skeletonFrame.append(contentFrame1)
        
            let contentFrame2 = UIBezierPath(rect: CGRect(x: 20, y: 120 + offset, width: view.bounds.width * 0.75, height: 8))
        
            skeletonFrame.append(contentFrame2)
        
            let contentFrame3 = UIBezierPath(rect: CGRect(x: 20, y: 140 + offset, width: view.bounds.width * 0.4, height: 8))
        
            skeletonFrame.append(contentFrame3)
            
            let gutter = UIView(frame: CGRect(x: 0, y: (cellHeight - gutterHeight) + offset, width: view.bounds.width, height: gutterHeight))
            
            gutter.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1.0)
            
            skeletonView.addSubview(gutter)
            
        }
        
        let skeletonShape = CAShapeLayer()
        
        skeletonShape.path = skeletonFrame.cgPath
        
        skeletonShape.fillColor = UIColor.black.cgColor
        
        skeletonShape.frame = skeletonView.bounds
        
        backgroundGradientLayer.mask = skeletonShape
        
    }
    

}

