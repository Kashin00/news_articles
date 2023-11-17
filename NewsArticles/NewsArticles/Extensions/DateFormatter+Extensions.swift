//
//  DateFormatter+Extensions.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 18.11.2023.
//

import Foundation

extension DateFormatter {
    convenience init(dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }
}
