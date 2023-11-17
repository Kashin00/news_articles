//
//  GlobalDateFormatter.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 18.11.2023.
//

import Foundation

struct GlobalDateFormatter {
    
    static let dateFormatter = DateFormatter(dateFormat: "yyyy-MM-dd'T'HH:mm:ssZ")
    
    static func date(from date: Date, with dateFormat: String) -> String {
        let currentDateFormat = dateFormatter.dateFormat
        dateFormatter.dateFormat = dateFormat
        let stringDate = dateFormatter.string(from: date)
        dateFormatter.dateFormat = currentDateFormat
        return stringDate
    }
    
    private init() { }
}
