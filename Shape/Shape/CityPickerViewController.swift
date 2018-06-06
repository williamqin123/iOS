//
//  ViewController.swift
//  SwiftBookExersizes
//
//  Created by William Qin on 12/26/14.
//  Copyright (c) 2014 William Qin. All rights reserved.
//

import UIKit

class TabBarPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var cityPicker: UIPickerView!

    var pickerChoices = ["Choose Location...", "Houston, TX", "Dallas, TX", "Cupertino, CA", "San Fransisco, CA", "Grand Canyon, AZ", "Shanghi, China", "Republic of CollisionCourse Studios (in the future)"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.cityPicker.dataSource = self
        self.cityPicker.delegate = self
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerChoices.count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return self.pickerChoices[row]
    }
}