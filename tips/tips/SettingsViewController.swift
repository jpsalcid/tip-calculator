//
//  SettingsViewController.swift
//  tips
//
//  Created by Jasen Salcido on 8/24/15.
//  Copyright (c) 2015 Jasen Salcido. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        if (defaults.objectForKey("defaultTipIndex") !== nil ) {
            tipControl.selectedSegmentIndex = defaults.integerForKey("defaultTipIndex")
        }
    
    }
    
    
    @IBAction func OnEditingChange(sender: AnyObject) {
       var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipControl.selectedSegmentIndex,forKey: "defaultTipIndex")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
