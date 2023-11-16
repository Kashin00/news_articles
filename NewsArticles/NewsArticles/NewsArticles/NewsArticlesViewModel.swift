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
    @Published var searchableText = ""
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
    
    func searchButtonTapped() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.articles = self.searchedArticles
        }
        print(#function)
    }
    
    func searchBarCancelButtonTapped() {
        self.articles = initialArticles
    }
}
