import UIKit

//
// This swift file is not a View Controller.
// It's a collection of stuff that makes Swift easier.
//

extension String {
    func replace(original: String, replaceWith: String) -> String {
        return self.stringByReplacingOccurrencesOfString(original, withString: replaceWith, options: NSStringCompareOptions.LiteralSearch, range: nil)

    }
    func contains(partOfString: [String], caseSensitive: Bool = true) -> Bool {
        for x in partOfString {
            var converted = self
            if caseSensitive == false {
                converted = self.lowercaseString
            }
            var rangeStringVar = converted.rangeOfString(x)
            if rangeStringVar != nil {
                return true
            }
        }
        return false
    }
    func select(selectChars: String = "") -> String {
        var returnSelected = ""
        for y in self {
            for n in selectChars {
                if y == n {
                    returnSelected = returnSelected + String(y)
                    break
                }
            }
        }
        return returnSelected
    }
}

//
// var myString = "abcdefg hello world"
//
// The replace method replaces a part of a string with a different string.
//
// myString.replace("a", replaceWith: "b") -> "bbcdefg hello world"
//
// The contains method of a string detects if it contains any of the substrings passed in. The caseSensitive parameter is optional, it defaults to true, and it controls if the capitalization has to match.
//
// myString.contains(["hello"]) -> true
// myString.contains(["harlew", "world"]) -> true
// myString.contains(["harlew", "WORLD"]) -> false
// myString.contains(["harlew", "WORLD"], caseSensitive: false) -> true
//
// The select method returns all matched characters and words of a string in order. The selectChars parameter will find all characters in the string that you want. It'll return all the occurrances in order. When selecting words, it'll return all occurrances of the words you want in order. You can select characters and words at the same time! Word selections are case insensitive, so capitalized words will also get selected.
//
// myString.select(selectChars: "hallbc defog") -> "abcdefg hello"
// myString.select(selectWords: ["wOrLd", "HeLlO"]) -> "hello world"
// myString.select(selectChars: "hallbcvk mdefogu", selectWords["world", "hello"]) -> "hello world hello world"
// myString.select(selectChars: "lowdrzxv", selectWords: ["ABCDEFG", "hello"]) -> "world abcdefg hello"
//

var myString = "abcdefg hello world moo cow XCFCXcode101"

myString.replace("hello", replaceWith: "LightningMcQueen")

myString.contains(["hello", "moo"])

myString.select(selectChars: "ajgueu bdjsk")

//
// This swift file is not a View Controller.
// It's a collection of stuff that makes Swift easier.
//