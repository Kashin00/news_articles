//
//  RequestItem.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 16.11.2023.
//

import Foundation

protocol EndPointType {
    var baseURL: String { get }
    var version: String { get }
    var path: String { get }
    var headers: String { get }
    var url: URL { get }
    var httpMethod: String { get }
}

enum RequestItem {
    case search(_ translateModel: SearchRequest)
    
    private var apiKey: String {
        "40a508255002495e8586d0be55ee1c16"
    }
}

extension RequestItem: EndPointType {
    var baseURL: String {
        "https://newsapi.org/"
    }
    
    var version: String {
        switch self {
        case .search:
            return "v2/"
        }
    }
    
    var path: String {
        switch self {
        case .search:
            return "everything"
        }
    }
    
    var headers: String {
        var header = ""
        switch self {
        case .search(let request):
            header = "?q=\(request.message)&from=\(request.fromDate)&to=\(request.toDate)&apiKey=\(apiKey)"
        }
    
        return header
    }
    
    var httpMethod: String {
        switch self {
        case .search:
            return "GET"
        }
    }
    
    var url: URL {
        return URL(string: baseURL + version + path + headers)!
    }
}
