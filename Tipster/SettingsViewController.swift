//
//  SettingsViewController.swift
//  Tipster
//
//  Created by Jin Suh Park on 12/13/15.
//  Copyright (c) 2015 Vasudha Kashyap. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipField1: UITextField!
    @IBOutlet weak var tipField2: UITextField!
    @IBOutlet weak var tipField3: UITextField!
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func percentage1Edit(sender: AnyObject) {
        var tip1 = (tipField1.text._bridgeToObjectiveC().doubleValue)/100
        defaults.setDouble(tip1 ,forKey:"tip1")
        defaults.synchronize();
    }

    @IBAction func percentage2Edit(sender: AnyObject) {
        var tip2 = (tipField2.text._bridgeToObjectiveC().doubleValue)/100
        defaults.setDouble(tip2 ,forKey:"tip2")
        defaults.synchronize();
    }
    @IBAction func percentage3Edit(sender: AnyObject) {
        var tip3 = (tipField3.text._bridgeToObjectiveC().doubleValue)/100
        defaults.setDouble(tip3 ,forKey:"tip3")
        defaults.synchronize();

    }
    @IBAction func onTap(sender: AnyObject) {
        [self.view.endEditing(true)]
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
