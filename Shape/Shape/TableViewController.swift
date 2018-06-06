//
//  TableViewController.swift
//  Shape
//
//  Created by William Qin on 12/31/14.
//  Copyright (c) 2014 William Qin. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet weak var tableViewList: UITableView!

	var listContent = ["Roller Bladez 3D", "Escape From The Turkey Hunter", "Tower Defense", "Rock, Paper, Scissors!", "Cow Race", "Wasp Attack"]

	var TBVIdentifier = "TBVcellID"

	override func viewDidLoad() {
		super.viewDidLoad()
		self.tableViewList.dataSource = self
		self.tableViewList.delegate = self
	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.listContent.count
	}

	func tableView(tableView: UITableView,
		cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		var TBVcell = tableView.dequeueReusableCellWithIdentifier(
		TBVIdentifier) as? UITableViewCell
		if (TBVcell == nil) {
		TBVcell = UITableViewCell(
		style: UITableViewCellStyle.Subtitle, reuseIdentifier: TBVIdentifier)
		}
		var TBVcellImage = UIImage(named: "grid")
		TBVcell!.imageView.image = TBVcellImage
		var TBVcellHighlightedImage = UIImage(named: "location")
		TBVcell!.imageView.highlightedImage = TBVcellHighlightedImage
		TBVcell!.textLabel.text = listContent[indexPath.row]
		if indexPath.row < 3 {
			TBVcell!.detailTextLabel?.text = "Unfinished"
		}
		else {
			TBVcell!.detailTextLabel?.text = "Mostly Done"
		}
		return TBVcell!
	}
}