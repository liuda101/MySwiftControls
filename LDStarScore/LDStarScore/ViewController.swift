//
//  ViewController.swift
//  LDStarScore
//
//  Created by Liu Qifeng on 12/5/14.
//  Copyright (c) 2014 liuda101. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let starScoreControl = LDStarScoreControl(frame: CGRectMake(30, 100, 200, 30))
        view.addSubview(starScoreControl)
        
        starScoreControl.addTarget(self, action: "scoreUpdated:", forControlEvents: .ValueChanged)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        resultLabel.frame = CGRectMake(0, 300, view.bounds.size.width, 30)
        resultLabel.textAlignment = NSTextAlignment.Center
        
        resultLabel.text = "3.5"
        
        view.addSubview(resultLabel)
    }
    
    func scoreUpdated(control: LDStarScoreControl) {
        resultLabel.text = "\(control.currentStar)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

