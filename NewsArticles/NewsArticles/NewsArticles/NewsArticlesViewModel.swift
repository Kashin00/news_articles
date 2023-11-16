//
//  NewsArticlesViewModel.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 16.11.2023.
//

import Foundation

class NewsArticlesViewModel: NewsArticlesViewModelInput {
    
    @Published var articles: [Article] = []
    
    private let dataHandler: NewsArticlesViewModelDataHandlerInput
    
    init(dataHandler: NewsArticlesViewModelDataHandlerInput = NewsArticlesViewModelDataHandler()) {
        self.dataHandler = dataHandler
    }
    
    @MainActor
    func viewDidAppear() {
        Task {
            articles = try await dataHandler.fetchTopHeadlines() ?? []
        }
    }
    
}
