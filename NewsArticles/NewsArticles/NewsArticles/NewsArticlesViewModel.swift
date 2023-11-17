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
    
    private lazy var dateFormatter: DateFormatter = {
        $0.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return $0
    }(DateFormatter())
    
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
    
    func sortButtonTapped(with sortType: SortType) {
        searchRequest.sortType = sortType
        switch sortType {
        case .byTitle:
            articles.sort {
                $0.title < $1.title
            }
        case .byAuthor:
            articles.sort {
                $0.author ?? "" < $1.author ?? ""
            }
        case .dateAscending:
            articles.sort {
                dateFormatter.date(from: $0.publishedAt) ?? Date() < dateFormatter.date(from: $1.publishedAt) ?? Date()
            }
        case .dateDescending:
            articles.sort {
                dateFormatter.date(from: $0.publishedAt) ?? Date() > dateFormatter.date(from: $1.publishedAt) ?? Date()
            }
        }
    }
}
