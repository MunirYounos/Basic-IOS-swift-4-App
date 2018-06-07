//
//  MainPageViewController.swift
//  iGroceryExamAssignment
//
//  Created by Munir Younos on 24/05/2018.
//  Copyright © 2018 Munir Younos. All rights reserved.
//
import Foundation
import UIKit

class MainPageViewController: UIViewController  {
    
    
    // outlet for the main page Continue shopping button
    @IBOutlet weak var buyBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the background gradient for main page view
        view.verticalGradientLayerforMainPage(topColor: primaryColor, bottomColor: secondaryColor)

        //the main page custom button
        buyBtn.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        buyBtn.setTitleColor(secondaryColor, for: .normal)
        buyBtn.setTitle("Continue shopping", for: .normal)
        buyBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.bold)
        buyBtn.alpha = 1
        buyBtn.backgroundColor = WhiteColor
        //buyBtn.backgroundColor = .clear
        buyBtn.layer.cornerRadius = 25
        buyBtn.layer.borderWidth = 2
        buyBtn.layer.borderColor = UIColor.yellow.cgColor
        buyBtn.center = CGPoint(x: view.center.x, y: view.frame.height - buyBtn.frame.height - 60)
        view.addSubview(buyBtn)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }

}

