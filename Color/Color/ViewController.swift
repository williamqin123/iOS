//
//  ViewController.swift
//  SwiftBookExersizes
//
//  Created by William Qin on 12/26/14.
//  Copyright (c) 2014 William Qin. All rights reserved.
//

import UIKit

var switchValue = false

class Essentials: UIViewController {

    func switchViews(viewIdentifier: String, senderView: UIViewController) {
        var toBeSwitchViewController = senderView.storyboard!.instantiateViewControllerWithIdentifier(viewIdentifier) as UIViewController

        senderView.presentViewController(toBeSwitchViewController, animated: true, completion: nil)
    }

    func segueViews(toBeSwitched: String, classView: UIViewController) {
        classView.performSegueWithIdentifier("switchToNextView", sender: classView)
    }

    func createActionSheet(heading: String, destructive: String, cancel: String, switchAction: String, viewClass: UIViewController, actionClass: UISwitch, buttonClass: UIButton) {
        var actionSheet = UIAlertController(title: nil, message: heading, preferredStyle: .ActionSheet)
        var destructiveAction = UIAlertAction(title: destructive, style: .Destructive, handler: {
        action in
            buttonClass.enabled = switchValue
        })
        var cancelAction = UIAlertAction(title: cancel, style: .Cancel, handler: {
        action in
            actionClass.setOn(false, animated: true)
            switchValue = false
            buttonClass.enabled = false
            self.segueViews(switchAction, classView: viewClass)
        })
        actionSheet.addAction(destructiveAction)
        actionSheet.addAction(cancelAction)
        viewClass.presentViewController(actionSheet, animated: true, completion: nil)
    }

    func createAlertPanel(heading: String, description: String, left: String, right: String, presentView: UIViewController) {
        var alertPopUp = UIAlertController(title: heading, message: description, preferredStyle: .Alert)
        var leftAction = UIAlertAction(title: left, style: .Destructive, handler: {
            action in
        })
        var rightAction = UIAlertAction(title: right, style: .Cancel, handler: {
            action in
        })
        alertPopUp.addAction(leftAction)
        alertPopUp.addAction(rightAction)
        presentView.presentViewController(alertPopUp, animated: true, completion: nil)
    }
}

class RotationLockViewController: UIViewController {
    @IBOutlet weak var rotationLock: UISwitch!

    @IBOutlet weak var viewSwitchButton: UIButton!

    @IBAction func toggleLock(sender: UISwitch) {
        if switchValue == false {
            switchValue = true
        }
        else if switchValue == true {
            switchValue = false
        }
        Essentials().createActionSheet("Dou you want to switch views now?", destructive: "No, stay on page!", cancel: "Yes, segue views!", switchAction: "switchToNextView", viewClass: self, actionClass: rotationLock, buttonClass: viewSwitchButton)
    }
}

class InstantiationViewController1: UIViewController {

    @IBAction func buttonPressAlert1(sender: UIButton) {

        Essentials().createAlertPanel("Button Pressed!", description: "You pressed a button. That's boring. How about try switching views?", left: "Okay!", right: "Nope!", presentView: self)
    }
    @IBAction func viewswitchBarButtonBress(sender: UIBarButtonItem) {
        Essentials().switchViews("InstantiationViewController2", senderView: self)
    }

}

class InstantiationViewController2: UIViewController {

    @IBAction func lockViewSlider(sender: UISlider, forEvent event: UIEvent) {
        Essentials().switchViews("lockScreenView", senderView: self)
    }

    @IBAction func buttonPressAlert2(sender: UIButton) {
        Essentials().switchViews("InstantiationViewController1", senderView: self)
    }
}

class LockScreenViewController: UIViewController {

    @IBOutlet weak var lockScreenText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        lockScreenText.numberOfLines = 0
        lockScreenText.sizeToFit()
    }
}