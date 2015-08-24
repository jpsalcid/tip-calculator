//
//  ViewController.swift
//  tips
//
//  Created by Jasen Salcido on 8/23/15.
//  Copyright (c) 2015 Jasen Salcido. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    private func calculate(){
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
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
        
        if (!billField.text.isEmpty) {
            calculate()
        }

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    


    @IBAction func onEditingChanged(sender: AnyObject) {
        if (!billField.text.isEmpty) {
            calculate()
        }
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
}

