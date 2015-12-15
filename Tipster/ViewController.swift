//
//  ViewController.swift
//  Tipster
//
//  Copyright (c) 2015 Vasudha Kashyap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountField:UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    @IBOutlet weak var settingsBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         func viewWillAppear(animated: Bool) {
            super.viewWillAppear(animated)
            print("view will appear")
            // This is a good place to retrieve the default tip percentage from NSUserDefaults
            // and use it to update the tip amount
         
        }
        
         func viewDidAppear(animated: Bool) {
            super.viewDidAppear(animated)
            print("view did appear")
               tipControl.setTitle("YO", forSegmentAtIndex: 0)
        }
        
         func viewWillDisappear(animated: Bool) {
            super.viewWillDisappear(animated)
            print("view will disappear")
        }
        
         func viewDidDisappear(animated: Bool) {
            super.viewDidDisappear(animated)
            print("view did disappear")
        }
        tipLabel.text = "0.00"
        totalLabel.text = "0.00"
        tipControl.setTitle("18%", forSegmentAtIndex: 0)
        tipControl.setTitle("20%", forSegmentAtIndex: 1)
        tipControl.setTitle("22%", forSegmentAtIndex: 2)
        var tipPercentages = [0.18,0.20,0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let tip1 = defaults.doubleForKey("tip1")
        let tip2 = defaults.doubleForKey("tip2")
        let tip3 = defaults.doubleForKey("tip3")
        var tip1String:String = String(format:"%.0f", tip1*100)
        var tip2String:String = String(format:"%.0f", tip2*100)
        var tip3String:String = String(format:"%.0f", tip3*100)
        tipControl.setTitle(tip1String + "%", forSegmentAtIndex: 0)
        tipControl.setTitle(tip2String + "%", forSegmentAtIndex: 1)
        tipControl.setTitle(tip3String + "%", forSegmentAtIndex: 2)
        var tipPercentages = [tip1,tip2,tip3]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        
        var billAmount = billAmountField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

				