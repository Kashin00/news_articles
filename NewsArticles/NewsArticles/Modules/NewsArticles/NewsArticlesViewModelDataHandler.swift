//
//  NewsArticlesViewModelDataHandler.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 16.11.2023.
//

import Foundation

protocol NewsArticlesViewModelDataHandlerInput {
    func fetchTopHeadlines() async throws -> [Article]?
    func searchArticles(for searchRequest: SearchRequest) async throws -> [Article]?
}

class NewsArticlesViewModelDataHandler: NewsArticlesViewModelDataHandlerInput {
    
    private let networkManager: NetworkManagerInput
    
    init(networkManager: NetworkManagerInput = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchTopHeadlines() async throws -> [Article]? {
        let requestURL = RequestItem.topHeadlines("US").url // now US, but can detect for any location
        let articlesResponse: ArticlesResponse = try await networkManager.send(requestURL)
        return articlesResponse.articles
    }
    
    func searchArticles(for searchRequest: SearchRequest) async throws -> [Article]? {
        let requestURL = RequestItem.search(searchRequest).url
        let articlesResponse: ArticlesResponse = try await networkManager.send(requestURL)
        return articlesResponse.articles
    }
}
