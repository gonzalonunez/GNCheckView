//
//  ViewController.swift
//  GNCheckView
//
//  Created by Gonzalo Nunez on 08/15/2015.
//  Copyright (c) 2015 Gonzalo Nunez. All rights reserved.
//

import UIKit
import GNCheckView

class ViewController: UIViewController {
    
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var checkView: GNCheckView!
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkView.primaryColor = checkButton.backgroundColor!
        checkView.secondaryColor = UIColor.whiteColor()
        
        checkButton.layer.cornerRadius = 5
    }

    //MARK: IBAction

    @IBAction func handleCheckButton(sender: UIButton) {
        let shouldCheck = !checkView.checked
        checkView.check(shouldCheck, animated: true)
        checkButton.setTitle(shouldCheck ? "Uncheck" : "Check", forState: .Normal)
    }
    
}


