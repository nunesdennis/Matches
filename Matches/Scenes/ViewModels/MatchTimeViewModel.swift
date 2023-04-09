//
//  MatchTimeViewModel.swift
//  Matches
//
//  Created by Dennis Nunes on 07/04/23.
//

import UIKit

struct MatchTimeViewModel {
    // MARK: - Constants
    
    var dateError: String { Localized("General.Date.error") }
    var nowMessage: String { Localized("MatchTime.nowMessage") }
    var todayMessage: String { Localized("MatchTime.todayMessage") }
    
    // MARK: - Properties
    
    let beginAt: String
    var endAt: String?
    
    var beginAtDate: Date? {
       formatAsDate(from: beginAt)
    }
    
    var endAtDate: Date? {
        formatAsDate(from: endAt ?? String())
    }
    
    // MARK: - Private Methods
    
    private func Localized(_ key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
    
    private func isLive() -> Bool {
        guard let beginAtDate = beginAtDate else {
            return false
        }
        
        if let endAtDate = endAtDate {
            return Date().isBetween(beginAtDate, and: endAtDate)
        }
        
        return Date() > beginAtDate
    }
    
    private func formatAsDate(from dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "pt_br")
        
        return dateFormatter.date(from: dateString)
    }
    
    private func formatAsWeek(from date: Date) -> String {
        let dateFormatterWeek = DateFormatter()
        dateFormatterWeek.dateFormat = "EEE, HH:mm"
        dateFormatterWeek.locale = Locale(identifier: "pt_br")
        
        return dateFormatterWeek.string(from: date)
    }
    
    private func formatAsToday(from date: Date) -> String {
        let dateFormatterHour = DateFormatter()
        dateFormatterHour.dateFormat = "HH:mm"
        dateFormatterHour.locale = Locale(identifier: "pt_br")
        let hour = dateFormatterHour.string(from: date)
        
        return todayMessage + ", " + hour
    }
    
    // MARK: - Public Methods
    
    func formattedTime() -> String {
        if isLive() {
            return nowMessage
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "pt_br")
        
        guard let date = dateFormatter.date(from: beginAt) else {
            return dateError
        }
        
        if date.isToday() {
            return formatAsToday(from: date)
        }
        
        if date.isInAWeek() {
            return formatAsWeek(from: date)
        }
        
        dateFormatter.dateFormat = "dd.MM HH:mm"
        return dateFormatter.string(from: date)
    }
    
    func backgroundColor() -> UIColor {
        if isLive() {
            return .torchRed
        }
        
        return .white20
    }
    
    func titleColor() -> UIColor {
        .white
    }
}
