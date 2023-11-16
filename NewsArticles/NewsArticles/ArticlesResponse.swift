//
//  ArticlesResponse.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 16.11.2023.
//

import Foundation

struct ArticlesResponse: Codable {
    let status: String
    let totalResults: Int?
    let articles: [Article]?
}

