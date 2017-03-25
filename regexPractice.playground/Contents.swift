//: Playground - noun: a place where people can play

import UIKit

let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .medium
dateFormatter.timeStyle = .none

let datenow = Date(timeIntervalSinceReferenceDate: 118800)

var str = ""
print(str)


///////////DayDateMonth///////////

var date = "jkhfdsjhkl dsfjlhjdfhlkjhkldsf jkhdsjkhfds Wednesday 7th, April"

//var regex_DayDateMonth = "wednesday \\d+, \\w+"
var regex_DayDateMonth = "(\\w+,?) (\\d+(st|nd|th)?,?) (\\w+)"
//day date, month
if let range = date.range(of:regex_DayDateMonth, options: [.regularExpression, .caseInsensitive]) {
  let result = date.substring(with:range)
  print(result)
}

//day date, month
var date2 = "jkhfdsjhkl dsfjlhjdfhlkjhkldsf Wednesday 7, April jkhdsjkhfds "
if let range = date2.range(of:regex_DayDateMonth, options: [.regularExpression, .caseInsensitive]) {
  let result = date2.substring(with:range)
  print(result)
  
}

//day date month
var date3 = "jkhfdjkhldfs Wednesday 77 April jkdsfjhfdsj"
if let range = date3.range(of:regex_DayDateMonth, options: [.regularExpression, .caseInsensitive]) {
  let result = date3.substring(with:range)
  print(result)
}

//day, date month
var date4 = "jkhfdjkhldfs Wednesday, 77 April jkdsfjhfdsj"
if let range = date4.range(of:regex_DayDateMonth, options: [.regularExpression, .caseInsensitive]) {
  let result = date4.substring(with:range)
  print(result)
}

///////////////////////////////////

///////////Date (like 01.01.17)///////////
var regex_Date = "(\\d\\d?(.|-|/)\\d\\d?(.|-|/)\\d\\d?)"
var date5 = "jkdjkhdjkfhajkhl 01.10.18"
if let range = date5.range(of:regex_Date, options: [.regularExpression, .caseInsensitive]) {
  let result = date5.substring(with:range)
  print(result)
  str = result
}

var date6 = "jkdjkhdjkfhajkhl 01-10/98"
if let range = date6.range(of:regex_Date, options: [.regularExpression, .caseInsensitive]) {
  let result = date6.substring(with:range)
  print(result)
}
///////////////////////////////////

///////////Days only///////////


var regex_months = "jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec"

var date7 = "what is the string only has a day, for eg, this sunday, what then"
if let range = date7.range(of:regex_Date, options: [.regularExpression, .caseInsensitive]) {
  let result = date7.substring(with:range)
  print(result)
}
////////////////////////////////////////

func getDay() -> String{
  var regex_days = "mon|tue|wed|thu|fri|sat|sun"
  
  do {
    let findday = try NSRegularExpression(pattern: regex_days, options: .caseInsensitive)

 // let findday = NSRegularExpression(pattern: regex_days, options: .caseInsensitive)
  var myStr = "Wednesday, 7th APril"
    let matches = findday.matches(in: myStr, options: [], range: NSRange(location: 0, length: myStr.characters.count))
    
//    if let match = matches.first {
//     let range = match.rangeAt(1)
//    if let swiftRange = range.toRange(for: myStr) {
//        let name = myStr.substring(with: swiftRange)
//      }
//    }
    
    switch "jkdsjk" {
      case "mon":
       return "Monday"
    case "tue":
      return "Tuesday"
    case "wed":
      return "Wednesday"
    case "thu":
      return "Thursday"
    case "fri":
      return "Friday"
    case "sat":
      return "Saturday"
    case "sun":
      return "Sunday"
    default:
      return ""
    }
  } catch let error {
    print(error)
  }
  return ""
}

///////////////////
extension String {
  public func match(regex: String) -> String? {
    let expression: NSRegularExpression
    
    //if let exists = expression[regex]
    //{
    //  expression = exists
    //}
    //else {
    expression = try! NSRegularExpression(pattern: "^\(regex)", options: .caseInsensitive)
    // expression[regex] = expression
    //}
    
    let range = expression.rangeOfFirstMatch(in: self, options: [], range: NSMakeRange(0, utf16.count))
    if range.location != NSNotFound {
      return (self as NSString).substring(with: range)
    }
    return nil
  }
}

let myStr = "jdfsjkdsfjks Wednesday"
var deliverance = myStr.match(regex: "Wed")
print(deliverance)


//func getdd() -> String{
//  var regex_dd = "\\d\\d?"
 // if let findday = NSRegularExpression(pattern: regex_dd, options: .caseInsensitive){
//    let match = findday.matchesInString(, options: .allZeros, range: range) as! [NSTextCheckingResult]
//
//    return match
//}
