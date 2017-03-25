//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
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
var date5 = "jkdjkhdjkfhajkhl 01.10.98"
if let range = date5.range(of:regex_Date, options: [.regularExpression, .caseInsensitive]) {
  let result = date5.substring(with:range)
  print(result)
}

var date6 = "jkdjkhdjkfhajkhl 01-10/98"
if let range = date6.range(of:regex_Date, options: [.regularExpression, .caseInsensitive]) {
  let result = date6.substring(with:range)
  print(result)
}
///////////////////////////////////

///////////Days only///////////
var regex_days = "Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday|Mon|Tue|Wed|Thur|Thu|Fri|Sat|Sun"

var date7 = "what is the string only has a day, for eg, this sunday, what then"
if let range = date7.range(of:regex_days, options: [.regularExpression, .caseInsensitive]) {
  let result = date7.substring(with:range)
  print(result)
}
////////////////////////////////////////