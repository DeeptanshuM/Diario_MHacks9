//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)

///////////DayDateMonth///////////

var date = "jkhfdsjhkl dsfjlhjdfhlkjhkldsf jkhdsjkhfds Wednesday 7, April"

//var regex_DayDateMonth = "wednesday \\d+, \\w+"
var regex_DayDateMonth = "(\\w+,?) (\\d+,?) (\\w+)"

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