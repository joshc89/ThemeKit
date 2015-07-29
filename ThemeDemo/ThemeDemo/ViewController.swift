//
//  ViewController.swift
//  ThemeDemo
//
//  Created by Josh Campion on 06/07/2015.
//  Copyright © 2015 Josh Campion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateLabelSize", name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabelSize() {
        for sv in self.view.subviews {
            
            let headlineFont = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
            let subheadlineFont = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
            let caption1Font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
            let caption2Font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption2)
            let footnoteFont = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
            let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
            
            if let label = sv as? UILabel {
                print("label: \(label.font)")
            }
            sv.invalidateIntrinsicContentSize()
            sv.setNeedsLayout()
        }
        view.setNeedsLayout()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        UILabel.appearance().font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
//        
//        for sv in view.subviews {
//            
//            sv.tintColor = UIColor.redColor()
//        }
    }

}

