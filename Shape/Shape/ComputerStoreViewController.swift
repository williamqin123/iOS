//
//  ComputerStoreViewController.swift
//  Shape
//
//  Created by William Qin on 1/1/15.
//  Copyright (c) 2015 William Qin. All rights reserved.
//

import UIKit

class ComputerStoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet weak var computerModelList: UITableView!

	var detailsList = ["white", "silver", "silver", "silver/black", "silver/black", "black", "metalic gray", "colorful", "super"]

	var stockList = ["MacBook", "MacBook Pro", "MacBook Air", "MBP Retina", "MBA Retina", "Mac Pro", "Acer Aspire", "HP x360", "小宝's Paw Patrol!"]

	var stockTableIdentifier = "TBstoreListViewID"

	override func viewDidLoad() {
		super.viewDidLoad()
		self.computerModelList.dataSource = self
		self.computerModelList.delegate = self
	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.stockList.count
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		var TBstoreListView = tableView.dequeueReusableCellWithIdentifier(stockTableIdentifier) as? UITableViewCell
		if (TBstoreListView == nil) {
			TBstoreListView = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: stockTableIdentifier)
		}
		var TBstoreListViewImage = UIImage(named: "laptop")
		TBstoreListView!.imageView.image = TBstoreListViewImage
		var TBstoreListViewHighlightedImage = UIImage(named: "location")
		TBstoreListView!.imageView.highlightedImage = TBstoreListViewHighlightedImage
		TBstoreListView!.textLabel.text = stockList[indexPath.row]
		TBstoreListView!.detailTextLabel?.text = detailsList[indexPath.row]
		return TBstoreListView!
	}
}