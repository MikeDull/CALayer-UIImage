//
//  ViewController.swift
//  GradientLayerToUIImageDemo
//
//  Created by 颜值怪兽 on 2019/7/13.
//  Copyright © 2019 MikeDull. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gradientColorImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let gradientColorLayer = CAGradientLayer()
        gradientColorLayer.frame = gradientColorImageView.bounds
        gradientColorLayer.colors = [UIColor.red.cgColor, UIColor.orange.cgColor]
        gradientColorLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientColorLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        
        if let image = layerToImage(layer: gradientColorLayer) {
            gradientColorImageView.image = image
        }
    }
    
    
    // Methods to transform a CALayer object to a UIImage object
    func layerToImage(layer: CALayer) -> UIImage? {
        var image: UIImage? = nil
        
        UIGraphicsBeginImageContext(layer.bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        
        return image
    }

}

