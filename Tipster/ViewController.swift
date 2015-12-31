//
//  ViewController.swift
//  Tipster
//
//  Copyright (c) 2015 Vasudha Kashyap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stringTotal: UILabel!
    @IBOutlet weak var stringTip: UILabel!
    @IBOutlet weak var billAmountField:UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var tipPercentages = [0.18,0.20,0.22]
    var selectedPercentage = 0.0
    @IBOutlet weak var settingsBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Control"
        tipLabel.text = "0.00"
        totalLabel.text = "0.00"
        tipControl.setTitle("18%", forSegmentAtIndex: 0)
        tipControl.setTitle("20%", forSegmentAtIndex: 1)
        tipControl.setTitle("22%", forSegmentAtIndex: 2)
        tipPercentages = [0.18,0.20,0.22]
        selectedPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        self.tipLabel.hidden = true
        self.tipControl.hidden = true
        self.totalLabel.hidden = true
        self.stringTip.hidden = true
        self.stringTotal.hidden = true
        self.billAmountField.center.y = 190
        self.billAmountField.frame.size.height = 320
        


    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
        let defaults = NSUserDefaults.standardUserDefaults()
        let tip1 = defaults.doubleForKey("tip1")
        let tip2 = defaults.doubleForKey("tip2")
        let tip3 = defaults.doubleForKey("tip3")
        let tip1String:String = String(format:"%.0f", tip1*100)
        let tip2String:String = String(format:"%.0f", tip2*100)
        let tip3String:String = String(format:"%.0f", tip3*100)
        tipControl.setTitle(tip1String + "%", forSegmentAtIndex: 0)
        tipControl.setTitle(tip2String + "%", forSegmentAtIndex: 1)
        tipControl.setTitle(tip3String + "%", forSegmentAtIndex: 2)
        tipPercentages = [tip1,tip2,tip3]
        selectedPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let billAmount = billAmountField.text!._bridgeToObjectiveC().doubleValue
        let tip = billAmount * selectedPercentage
        
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        [billAmountField.becomeFirstResponder()];
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        if billAmountField.text == ""
        {
            self.tipLabel.hidden = true
            self.tipControl.hidden = true
            self.totalLabel.hidden = true
            self.stringTip.hidden = true
            self.stringTotal.hidden = true
            UIView.animateWithDuration(0.5, animations: {
                self.billAmountField.center.y -= 75
                self.billAmountField.frame.size.height = 320
            })
        }
        else
        {
            self.tipLabel.hidden = false
            self.tipControl.hidden = false
            self.totalLabel.hidden = false
            self.stringTip.hidden = false
            self.stringTotal.hidden = false
            UIView.animateWithDuration(0.5, animations: {
                self.billAmountField.frame.size.height = 100
                self.billAmountField.center.y = 170
            })

        }
        selectedPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let billAmount = billAmountField.text!._bridgeToObjectiveC().doubleValue
        let tip = billAmount * selectedPercentage
        
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

				