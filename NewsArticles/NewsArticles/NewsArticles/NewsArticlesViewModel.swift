//
//  NewsArticlesViewModel.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 16.11.2023.
//

import Foundation


class NewsArticlesViewModel: NewsArticlesViewModelInput {
    
    @Published var articles: [Article] = [] {
        didSet {
            isLoading = false
        }
    }
    @Published var searchedArticles: [Article] = []
    @Published var searchRequest: SearchRequest = SearchRequest()
    @Published var isLoading = false
    
    private var initialArticles: [Article] = []
    
    private let dataHandler: NewsArticlesViewModelDataHandlerInput
    
    init(dataHandler: NewsArticlesViewModelDataHandlerInput = NewsArticlesViewModelDataHandler()) {
        self.dataHandler = dataHandler
    }
    
    @MainActor
    func viewDidAppear() {
        isLoading = true
        Task {
            articles = try await dataHandler.fetchTopHeadlines() ?? []
            initialArticles = articles
            searchedArticles = Array(articles.prefix(4))
        }
    }
    
    @MainActor
    func searchButtonTapped() {
        isLoading = true
        Task {
            articles = try await dataHandler.searchArticles(for: searchRequest) ?? []
        }
    }
    
    func searchBarCancelButtonTapped() {
        self.articles = initialArticles
    }
}
