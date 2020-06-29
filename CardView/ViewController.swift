//
//  ViewController.swift
//  CardView
//
//  Created by Vignesh Nayak P on 5/21/20.
//  Copyright © 2020 Vignesh Nayak P. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cornerRadiusView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    func initialSetup(){
        if #available(iOS 11.0, *) {
            self.cornerRadiusView.layer.cornerRadius = CGFloat(20)
            self.cornerRadiusView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        } else {
            let path = UIBezierPath(roundedRect:self.cornerRadiusView.bounds,
                                    byRoundingCorners:[.topRight, .topLeft],
                                    cornerRadii: CGSize(width: 20, height: 20))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.cornerRadiusView.bounds
            maskLayer.path = path.cgPath
            // maskLayer.
            cornerRadiusView.layer.mask = maskLayer
        }
        
        self.cornerRadiusView.clipsToBounds = true
        self.cornerRadiusView.layer.shadowPath = UIBezierPath(rect: self.cornerRadiusView.bounds).cgPath
        self.cornerRadiusView.layer.shadowColor = UIColor.darkGray.cgColor
        self.cornerRadiusView.layer.shadowOffset = .zero
        self.cornerRadiusView.layer.shadowOpacity = 1.0
        self.cornerRadiusView.layer.shadowRadius = 4.0
        self.cornerRadiusView.layer.masksToBounds = false
    }
    
}

