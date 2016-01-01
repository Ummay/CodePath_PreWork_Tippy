//
//  SettingViewController.swift
//  Tipper
//
//  Created by Ummay Habiba on 12/31/15.
//  Copyright © 2015 Ummay Habiba. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var themecontrol: UISegmentedControl!
    @IBOutlet weak var tipcontrol: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipValue = defaults.integerForKey("defaultTipIndex")
        tipcontrol.selectedSegmentIndex = tipValue
        let themeSetting = defaults.integerForKey("themeIndex")
        themecontrol.selectedSegmentIndex = themeSetting
        if themeSetting == 1{
            self.view.backgroundColor = UIColor.grayColor()
            self.view.tintColor = UIColor.whiteColor()
            tipLabel.textColor = UIColor.whiteColor()
            themeLabel.textColor = UIColor.whiteColor()
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnEditingChange(sender: AnyObject) {
        var defaultTip = tipcontrol.selectedSegmentIndex
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTip, forKey: "defaultTipIndex")
        var defaultTheme = themecontrol.selectedSegmentIndex
        defaults.setInteger(defaultTheme, forKey:"themeIndex")
        print(defaultTip)
        print(defaultTheme)

        
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
