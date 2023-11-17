//
//  Article.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 16.11.2023.
//

import Foundation

struct Article: Codable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case source
        case title
        case url
        case publishedAt
        case author
        case description
        case urlToImage
    }
    
    let id = UUID()
    let source: ArticleSource
    let title: String
    let url: String
    let publishedAt: String
    let author: String?
    let description: String?
    let urlToImage: String?
    
    var imageURL: URL? {
        guard let urlToImage else { return nil }
        let url = URL(string: urlToImage)
        return url
    }
    
    var convertedPublishedAtDate: String {
        if let date = GlobalDateFormatter.dateFormatter.date(from: publishedAt)?.removeTimeStamp() {
            return GlobalDateFormatter.date(from: date, with: "dd MMM yyyy")
        }
        return ""
    }
}
