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

func getDay_DayDateYear(input: String) -> String{
    if input.range(of:"mon", options: [.regularExpression, .caseInsensitive]) != nil {
      return "Monday"
    }
    else if input.range(of:"tue", options: [.regularExpression, .caseInsensitive]) != nil {
      return "Tuesday"
    }
    else if input.range(of:"wed", options: [.regularExpression, .caseInsensitive]) != nil {
      return "Wednesday"
    }
    else if input.range(of:"thu", options: [.regularExpression, .caseInsensitive]) != nil {
      return "Thursday"
    }
    else if input.range(of:"fri", options: [.regularExpression, .caseInsensitive]) != nil  {
      return "Friday"
    }
    else if input.range(of:"sat", options: [.regularExpression, .caseInsensitive]) != nil  {
      return "Saturday"
    }
    else if input.range(of:"sun", options: [.regularExpression, .caseInsensitive]) != nil  {
      return "Sunday"
    }
    else{
      return ""
    }
}

func getDate_DayDateYear(input: String) -> String{
  if let range = input.range(of:"\\d\\d?", options: [.regularExpression, .caseInsensitive]) {
    return input.substring(with:range)
  }
  return ""
}

func getMonth_DayDateYear(input: String) -> String{
  if input.range(of:"jan", options: [.regularExpression, .caseInsensitive]) != nil {
    return "January"
  }
  else if input.range(of:"feb", options: [.regularExpression, .caseInsensitive]) != nil {
    return "February"
  }
  else if input.range(of:"mar", options: [.regularExpression, .caseInsensitive]) != nil {
    return "March"
  }
  else if input.range(of:"apr", options: [.regularExpression, .caseInsensitive]) != nil {
    return "April"
  }
  else if input.range(of:"may", options: [.regularExpression, .caseInsensitive]) != nil {
    return "May"
  }
  else if input.range(of:"jun", options: [.regularExpression, .caseInsensitive]) != nil  {
    return "June"
  }
  else if input.range(of:"jul", options: [.regularExpression, .caseInsensitive]) != nil  {
    return "July"
  }
  else if input.range(of:"aug", options: [.regularExpression, .caseInsensitive]) != nil  {
    return "Asgust"
  }
  else if input.range(of:"sep", options: [.regularExpression, .caseInsensitive]) != nil {
    return "September"
  }
  else if input.range(of:"oct", options: [.regularExpression, .caseInsensitive]) != nil {
    return "October"
  }
  else if input.range(of:"nov", options: [.regularExpression, .caseInsensitive]) != nil {
    return "November"
  }
  else if input.range(of:"dec", options: [.regularExpression, .caseInsensitive]) != nil  {
    return "December"
  }
  else{
    return ""
  }
}

////////////////////////////////
var test: String

test = getDay_DayDateYear(input: "jhdfjk Wednesday , 7 khjdw") + " " + getDate_DayDateYear(input: "jhdfjk Wednesday , 7 khjdw")
test = getDay_DayDateYear(input: "Wednesday 7th, April") + " " + getDate_DayDateYear(input: "Wednesday 7th, April")
test = getDay_DayDateYear(input: "Wednesday 7, April") + " " + getDate_DayDateYear(input: "Wednesday 7, April")
test = getDay_DayDateYear(input: "Wednesday, 77 April") + " " + getDate_DayDateYear(input: "Wednesday, 77 April")
test = getDay_DayDateYear(input: "Wednesday 77 April") + " " + getDate_DayDateYear(input: "Wednesday 77 April")


//If a date is not found in the string then the function returns the date of Monday, 10 Jan 1999
public func getDate(input: String) -> Date?{
  let regex_DayDateMonth = "(\\w+,?) (\\d+(st|nd|th)?,?) (\\w+)"
  
  if let range = input.range(of:regex_DayDateMonth, options: [.regularExpression, .caseInsensitive]) {
    let result = input.substring(with:range)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, dd MMM yyyy"
    let dateString = getDay_DayDateYear(input: result) + ", " + getDate_DayDateYear(input: result) + " " + getMonth_DayDateYear(input: result) + " 2017"
    let dateObj = dateFormatter.date(from: dateString)
    return dateObj
  }
  return nil
}

getDate(input: "hjkdfsjkhl Mon, 21st DEc hjkldfshjkdfjks")

public func getDate_MM_dd_yy(input: String) -> Date?{
  let regex_Date_MM_dd_yy = "(\\d\\d?(.|-|/)\\d\\d?(.|-|/)\\d\\d?)"
  if let range = input.range(of:regex_Date_MM_dd_yy, options: [.regularExpression, .caseInsensitive]) {
    let result = input.substring(with:range)
    var month: String = ""
    var day: String = ""
    var year: String = ""
    var i: Int = 1
    
    for index in result.characters.indices{
      if (i == 1){
        month = String(result[index])
      }
      if (i == 2){
        month += String(result[index])
      }
      if(i == 4)
      {
        day = String(result[index])
      }
      if(i == 5)
      {
        day += String(result[index])
      }
      if(i == 7)
      {
        year = String(result[index])
      }
      if(i == 8)
      {
        year += String(result[index])
      }
      i += 1
    }
    
    let dateString = month + " " + day + " " + year
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM dd yy"
    let dateObj = dateFormatter.date(from: dateString)
    return dateObj
  }
  return nil
}

public func getDate_EEEE_MM_dd(input: String) -> Date?{
  let regex_EEEE_MM_dd = "\\w+,? \\w+ \\d+(st|nd|th)?"
  if let range = input.range(of:regex_EEEE_MM_dd, options: [.regularExpression, .caseInsensitive]) {
    let result = input.substring(with:range)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE MMM dd yyyy"
    let dateString = getDay_DayDateYear(input: result) + " " + getMonth_DayDateYear(input: result) +  " " + getDate_DayDateYear(input: result) + " 2017"
    let dateObj = dateFormatter.date(from: dateString)
    return dateObj
  }
  return nil
}
var test1 = "Wednesday March 15th"
var test2 = "June 22nd"


public func getDate_MM_dd(input: String) -> Date?{
  let regex_MM_dd = "\\w+ \\d+(st|nd|th)?"
  if let range = input.range(of:regex_MM_dd, options: [.regularExpression, .caseInsensitive]) {
    let result = input.substring(with:range)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM dd yyyy"
    let dateString = getMonth_DayDateYear(input: result) +  " " + getDate_DayDateYear(input: result) + " 2017"
    let dateObj = dateFormatter.date(from: dateString)
    return dateObj
  }
  return nil
}

public func getDateFromParse(input: String) -> Date?{
  let regex_DayDateMonth = "(\\w+,?) (\\d+(st|nd|th)?,?) (\\w+)(,|.)?"
  let regex_Date_MM_dd_yy = "(\\d\\d?(.|-|/)\\d\\d?(.|-|/)\\d\\d?)"
  let regex_EEEE_MM_dd = "\\w+,? \\w+(,|.)? (\\d+(st|nd|th)?)"
  let regex_MM_dd = "\\w+(,|.)? \\d+(st|nd|th)?"
  
  if let range = input.range(of:regex_DayDateMonth, options: [.regularExpression, .caseInsensitive]) {
    let result = input.substring(with:range)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, dd MMM yyyy"
    let dateString = getDay_DayDateYear(input: result) + ", " + getDate_DayDateYear(input: result) + " " + getMonth_DayDateYear(input: result) + " 2017"
    let dateObj = dateFormatter.date(from: dateString)
    if ((dateObj) != nil){
    return dateObj
    }
  }
  
  if let range = input.range(of:regex_Date_MM_dd_yy, options: [.regularExpression, .caseInsensitive]) {
    let result = input.substring(with:range)
    var month: String = ""
    var day: String = ""
    var year: String = ""
    var i: Int = 1
    
    for index in result.characters.indices{
      if (i == 1){
        month = String(result[index])
      }
      if (i == 2){
        month += String(result[index])
      }
      if(i == 4)
      {
        day = String(result[index])
      }
      if(i == 5)
      {
        day += String(result[index])
      }
      if(i == 7)
      {
        year = String(result[index])
      }
      if(i == 8)
      {
        year += String(result[index])
      }
      i += 1
    }
    
    let dateString = month + " " + day + " " + year
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM dd yy"
    let dateObj = dateFormatter.date(from: dateString)
    if ((dateObj) != nil){
      return dateObj
    }
  }
  
  if let range = input.range(of:regex_EEEE_MM_dd, options: [.regularExpression, .caseInsensitive]) {
    let result = input.substring(with:range)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE MMM dd yyyy"
    let dateString = getDay_DayDateYear(input: result) + " " + getMonth_DayDateYear(input: result) +  " " + getDate_DayDateYear(input: result) + " 2017"
    let dateObj = dateFormatter.date(from: dateString)
    if ((dateObj) != nil){
      return dateObj
    }
  }
  
  if let range = input.range(of:regex_MM_dd, options: [.regularExpression, .caseInsensitive]) {
    let result = input.substring(with:range)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM dd yyyy"
    let dateString = getMonth_DayDateYear(input: result) +  " " + getDate_DayDateYear(input: result) + " 2017"
    let dateObj = dateFormatter.date(from: dateString)
    if ((dateObj) != nil){
      return dateObj
    }
  }
  
  return nil
}


//getDate_EEEE_MM_dd(input: test1)
//getDate_MM_dd(input: test2)

var test3 = ""
getDateFromParse(input: "dsfds 01.01.17 hjghjgjk")
getDateFromParse(input: "sdffd Wednesday March 15th hkgghghlj")
getDateFromParse(input: "sadf June 22nd hjhhjgl")
getDateFromParse(input: "kljhdsfv June 22 hjhjhjg")
getDateFromParse(input: "jklsdf jkhdfjkhldfsjkhdfjks Thursday, September 1st hhjkdsflhjk")
getDateFromParse(input: "Friday, JAn. 27")

func callParseTextLinebyLine(input: String){
  let textLines = input.components(separatedBy: .newlines)
  for line in textLines{
    print(line)
  }
}

callParseTextLinebyLine(input: "Preview File Edit View Go Tools Window Help\n3bBa7eoeb20627318db65ce095b81522\n10.12.15\nMOLLY BREWER & RYAN SAUNDERS\nILLINOIS\nstatie internal let googleURL string\nstatis internal let session\nstat Terral war\nget terterrem snager\n")