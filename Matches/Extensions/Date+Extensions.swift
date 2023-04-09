//
//  Date+Extensions.swift
//  Matches
//
//  Created by Dennis Nunes on 09/04/23.
//

import Foundation

extension Date {
    func distance(from date: Date, calendar: Calendar = .current) -> Int {
        let days1 = calendar.component(.day, from: self)
        let days2 = calendar.component(.day, from: date)
        return days1 - days2
    }
    
    func isToday() -> Bool {
        distance(from: Date()) == .zero
    }
    
    func isInAWeek() -> Bool {
        distance(from: Date()) <= 7
    }
    
    func isBetween(_ date1: Date, and date2: Date) -> Bool {
       return (min(date1, date2) ... max(date1, date2)).contains(self)
   }
}
