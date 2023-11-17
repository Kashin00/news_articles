//
//  SearchRequest.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 16.11.2023.
//

import Foundation

struct SearchRequest {
    
    var text = ""
    var fromDate:  Date?
    var toDate: Date?
    var sortType: SortType?
}

enum SortType: String, CaseIterable, Identifiable {
    
    var id: Self {
        return self
    }
    
    case byTitle = "by_title"
    case byAuthor = "by_author"
    case dateAscending = "date_ascending"
    case dateDescending = "date_descending"
}
