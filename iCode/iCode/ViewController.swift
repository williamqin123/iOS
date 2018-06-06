//
//  ViewController.swift
//  iCode
//
//  Created by William Qin on 1/1/15.
//  Copyright (c) 2015 CollisionCourse. All rights reserved.
//

import UIKit

var lastKeyEvent: String = ""

extension String {

	func subString(startUp: Int, endOf: Int) -> String {
		var repeatString = ""
		var newEnd = endOf
		var newStart = startUp
		if endOf < 0 {
			newEnd = 0
		}
		if startUp < 0 {
			newStart = 0
		}
		if endOf < startUp {
			newEnd = startUp
		}
		var lenDifference = newStart + (newEnd - newStart)
		for j in 0..<lenDifference {
			repeatString += "-"
		}
		var appendString =  self + repeatString
		return appendString.substringWithRange(Range<String.Index>(start: advance(appendString.startIndex, newStart), end: advance(appendString.startIndex, newEnd)))
	}

	func chunk(begin: Int, length: Int) -> String {
		return self.subString(begin, endOf: begin + length)
	}

	func subtract(charOffset: Int) -> String {
		return self.substringWithRange(Range<String.Index>(start: self.startIndex, end: advance(self.endIndex, -charOffset)))
	}

	func lastIndexOf(target: String) -> Int {
		var noneType = String()
		var reverseString = map(self) {s -> String in String(s)}.reverse()
		var indexRunner = find(reverseString, target)
		if indexRunner == nil {
			indexRunner = 0
		}
		return countElements(self) - indexRunner!
	}

	func findIndexIndent(indentTextView: UITextView!, retractMinus: Int) -> Int {
		var clipSubString = self.subString(0, endOf: indentTextView.selectedRange.location - retractMinus)
		var clipString = clipSubString.subString(clipSubString.lastIndexOf("\n"), endOf: countElements(clipSubString))
		var indentCount = 0
		var charCount = 0
		while charCount <= countElements(clipString) {
			if clipString.chunk(charCount, length: 4) == "    " {
				++indentCount
			}
			charCount += 4
		}
		return indentCount
	}
}

class ViewController: UIViewController, UITextViewDelegate {

    var oldText = ""
    var currentText = ""
    var indentLevel = 0

    @IBOutlet weak var textField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
		self.textField.editable = true
    }

	func calcIndent(retractFinder: Int) -> String {
        var indentWidth = ""
        for x in 0..<retractFinder {
            indentWidth += "    "
        }
        return indentWidth
    }

	func updateCursor(offset: Int, textViewToEdit: UITextView!, oldCursorPosRange: Int) {
		textViewToEdit.selectedRange = NSMakeRange(oldCursorPosRange + offset, 0)
	}

	func appendText(text: String, viewToEditText: UITextView!) {
		var editingTextSupply = viewToEditText.text
		viewToEditText.text = editingTextSupply.subString(0, endOf: viewToEditText.selectedRange.location) + text + viewToEditText.text.subString(viewToEditText.selectedRange.location, endOf: countElements( editingTextSupply))
	}

	func unIndent() {
		if self.indentLevel > 0 {
			--self.indentLevel
		}
	}

    func textViewDidChange(textView: UITextView!) {
        currentText = textView.text
		var keyPress = textView.text.chunk(textView.selectedRange.location - 1, length: 1)

		if keyPress == "{" || keyPress == "\n" || keyPress == "(" || keyPress == ":" || keyPress == "[" || keyPress == "\"" {

			if countElements(currentText) <= countElements(oldText) {
				return
			}

			var lastCarretPosition = textView.selectedRange.location
			var appendCharacterTyped = String()

			self.indentLevel = currentText.findIndexIndent(textView, retractMinus: 0)
			var indentTabs = self.calcIndent(self.indentLevel)

			var endPoint = 0

			if keyPress == "{" {
				appendCharacterTyped = "\n\(indentTabs)    \n\(indentTabs)}\n"
				endPoint = (self.indentLevel * 4) + 5
			}
			else if keyPress == "\n" {
				var oldIndentLevel = currentText.findIndexIndent(textView, retractMinus: 1)
				var oldIndentCalc = self.calcIndent(oldIndentLevel)
				appendCharacterTyped = oldIndentCalc
				endPoint = oldIndentLevel * 4
			}
			else if keyPress == "(" {
				appendCharacterTyped = ")"
				endPoint = 0
			}
			else if keyPress == ":" {
				appendCharacterTyped = " "
				endPoint = 1
			}
			else if keyPress == "[" {
				appendCharacterTyped = "]"
				endPoint = 0
			}
			else if keyPress == "\"" {
				appendCharacterTyped = "\""
				endPoint = 0
			}

			self.appendText(appendCharacterTyped, viewToEditText: textView)

			self.updateCursor(endPoint, textViewToEdit: textView, oldCursorPosRange: lastCarretPosition)
		}

		var rangeCursorStar = advance(textView.text.startIndex, textView.selectedRange.location)
		var rangeCursorCaret = textView.caretRectForPosition(textView.selectedTextRange!.start).maxY - textView.bounds.height / 2
		if rangeCursorCaret < 0 {
			rangeCursorCaret = 0.0
		}
		var CGPointScroll = CGPointMake(0.0, rangeCursorCaret)
		textView.setContentOffset(CGPointScroll, animated: false)

        self.oldText = textView.text
    }
}