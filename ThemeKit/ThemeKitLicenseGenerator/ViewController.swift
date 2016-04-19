//
//  ViewController.swift
//  ThemeKitLicenseGenerator
//
//  Created by Josh Campion on 19/04/2016.
//  Copyright © 2016 Josh Campion. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField:UITextField!
    @IBOutlet weak var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        let license = textField.text?.digestUsingAlgorithm(.SHA1)
        
        label.text = license
        
        return true
    }
    
    @IBAction func share(sender:UIButton) {
        
        let toShare = "\(textField.text ?? ""): \(label.text ?? "")"
        
        let activity = UIActivityViewController(activityItems: [toShare], applicationActivities: nil)
        self.presentViewController(activity, animated: true, completion: nil)
    }

}

