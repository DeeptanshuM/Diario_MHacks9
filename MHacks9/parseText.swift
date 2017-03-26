//
//  parseText.swift
//  MHacks9
//
//  Created by Deetpanshu Malik on 3/25/17.
//  Copyright © 2017 DeeptanhuRyujiKenanAvi. All rights reserved.
//

import Foundation

class parseText: NSObject {
  
  //example of Date it returns: Dec 21, 2017, 12:00 AM"
  //if date not found then returns nil
  
  public class func getDate(input: String) -> Date?
  {
    let regex_DayDateMonth = "(\\w+,?) (\\d+(st|nd|th)?,?) (\\w+)(,|.)?"
    let regex_Date_MM_dd_yy = "(\\d\\d?(.|-|/)\\d\\d?(.|-|/)\\d\\d?)"
    let regex_EEEE_MM_dd = "\\w+,? \\w+(,|.)? (\\d+(st|nd|th)?)"
    let regex_MM_dd = "\\w+(,|.)? \\d+(st|nd|th)?"
    
    if let range = input.range(of:regex_DayDateMonth, options: [.regularExpression, .caseInsensitive])
    {
      let result = input.substring(with:range)
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "EEEE, dd MMM yyyy"
      let dateString = getDay_DayDateYear(input: result) + ", " + getDate_DayDateYear(input: result) + " " + getMonth_DayDateYear(input: result) + " 2017"
      let dateObj = dateFormatter.date(from: dateString)
      if ((dateObj) != nil){
        return dateObj
      }
    }
    
    if let range = input.range(of:regex_Date_MM_dd_yy, options: [.regularExpression, .caseInsensitive])
    {
      let result = input.substring(with:range)
      var month: String = ""
      var day: String = ""
      var year: String = ""
      var i: Int = 1
      
      for index in result.characters.indices
      {
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
      if ((dateObj) != nil)
      {
        return dateObj
      }
    }
    
    if let range = input.range(of:regex_EEEE_MM_dd, options: [.regularExpression, .caseInsensitive])
    {
      let result = input.substring(with:range)
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "EEEE MMM dd yyyy"
      let dateString = getDay_DayDateYear(input: result) + " " + getMonth_DayDateYear(input: result) +  " " + getDate_DayDateYear(input: result) + " 2017"
      let dateObj = dateFormatter.date(from: dateString)
      if ((dateObj) != nil){
        return dateObj
      }
    }
    
    if let range = input.range(of:regex_MM_dd, options: [.regularExpression, .caseInsensitive])
    {
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
}

//MARK: Private functions
private func getDay_DayDateYear(input: String) -> String{
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

private func getDate_DayDateYear(input: String) -> String{
  if let range = input.range(of:"\\d\\d?", options: [.regularExpression, .caseInsensitive]) {
    return input.substring(with:range)
  }
  return ""
}

private func getMonth_DayDateYear(input: String) -> String{
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
