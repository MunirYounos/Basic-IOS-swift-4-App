//
//  starterViewController.swift
//  iGroceryExamAssignment
//
//  Created by Munir Younos on 24/05/2018.
//  Copyright © 2018 Munir Younos. All rights reserved.
//

import UIKit

class starterViewController: UIViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.performSegue(withIdentifier: "toMainPage", sender: self)
    }

}
