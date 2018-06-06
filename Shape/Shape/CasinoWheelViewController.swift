//
//  CasinoWheelViewController.swift
//  Shape
//
//  Created by William Qin on 12/30/14.
//  Copyright (c) 2014 William Qin. All rights reserved.
//

import UIKit

class CasinoSlotMachineViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

	@IBOutlet weak var casinoPicker: UIPickerView!

	var pickerImages: [UIImage]!

    override func viewDidLoad() {
        super.viewDidLoad()

		var image1 = UIImage(named: "NarawaGamesLogo")!
		var image2 = UIImage(named: "iOS8Logo")!
		var image3 = UIImage(named: "SwiftLogo")!

		self.pickerImages = [image1, image2, image3, image1, image2, image3, image1, image2, image3, image1, image2, image3, image1, image2, image3, image1, image2, image3, image1, image2, image3, image1, image2, image3, image1, image2, image3, image1, image2, image3, image1, image2, image3]

		self.casinoPicker.dataSource = self
		self.casinoPicker.delegate = self
    }

	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return 4
	}

	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return self.pickerImages.count
	}

	func pickerView(pickerView: UIPickerView, viewForRow row: Int,
		forComponent component: Int,
		reusingView view: UIView!) -> UIView {
		return UIImageView(image: self.pickerImages[row])
	}

	func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
		return 80
	}

	@IBAction func spinSlotMachine(sender: UIButton) {
		for i in 0..<4 {
			self.casinoPicker.selectRow(Int(arc4random_uniform(UInt32(self.pickerImages.count))), inComponent: i, animated: true)
		}
	}
}