//
// NSDate.swift
// Weather
//
// Created on 10/16/17.
//

import Foundation

extension Date {
    
    func dayOfTheWeek() -> String {
        
        let dateFormatter = DateFormatter()
        
        // Return only the day of the week (the full name)
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.string(from: self)
    }
    
}
