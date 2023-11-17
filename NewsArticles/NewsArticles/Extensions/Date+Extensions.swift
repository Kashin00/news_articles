//
//  Date+Extensions.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 17.11.2023.
//

import Foundation

extension Date {
    func removeTimeStamp() -> Date? {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self))
    }
}
