//
//  ViewController.swift
//  Tipper
//
//  Created by Ummay Habiba on 12/31/15.
//  Copyright © 2015 Ummay Habiba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.integerForKey("defaultTipIndex")
        print("New defaults")
        print(tipValue)
        tipControl.selectedSegmentIndex = tipValue
        let themeSetting = defaults.integerForKey("themeIndex")
        print(themeSetting)
        if themeSetting == 1 {
            self.view.backgroundColor = UIColor.grayColor()
            tipLabel.textColor = UIColor.whiteColor()
            totalLabel.textColor = UIColor.whiteColor()
        }
        else {
            self.view.backgroundColor = UIColor.whiteColor()
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {

        
       var tipPercentages = [0.18, 0.2, 0.22]
       var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        let billAmount = billField.text!._bridgeToObjectiveC().doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)


    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
    }
    
    
}

