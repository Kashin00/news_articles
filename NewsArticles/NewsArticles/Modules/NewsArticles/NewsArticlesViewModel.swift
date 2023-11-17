//
//  NewsArticlesViewModel.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 16.11.2023.
//

import Foundation
import Combine

class NewsArticlesViewModel: NewsArticlesViewModelInput {
    
    @Published var articles: [Article] = [] {
        didSet {
            isLoading = false
        }
    }
    
    @Published var searchRequest: SearchRequest = SearchRequest()
    @Published var isLoading = false
    
    // need to have a buffer of arcticles for presenting in initial and not searchanble cases
    private var initialArticles: [Article] = []
    // need to have a not sorted/filtered, fetched data for search request or for inirial loading
    private var currentArticles: [Article] = []
    
    private let dataHandler: NewsArticlesViewModelDataHandlerInput
    var cancellables: Set<AnyCancellable> = Set()
    
    private lazy var dateFormatter: DateFormatter = {
        $0.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return $0
    }(DateFormatter())
    
    init(dataHandler: NewsArticlesViewModelDataHandlerInput = NewsArticlesViewModelDataHandler()) {
        self.dataHandler = dataHandler
        observeDateChanging()
    }
    
    @MainActor
    func viewDidAppear() {
        isLoading = true
        Task {
            articles = try await dataHandler.fetchTopHeadlines() ?? []
            initialArticles = articles
            currentArticles = articles
        }
    }
    
    @MainActor
    func searchButtonTapped() {
        if searchRequest.text.isEmpty {
            self.articles = initialArticles
        } else {
            isLoading = true
            Task {
                articles = try await dataHandler.searchArticles(for: searchRequest) ?? []
                currentArticles = articles
            }
        }
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
    
    private func observeDateChanging() {
        $searchRequest.sink { input in
            self.articles = self.currentArticles.filter({ article in
                guard let date = self.dateFormatter.date(from: article.publishedAt)?.removeTimeStamp(),
                      let toDate = input.toDate.removeTimeStamp()
                else { return false }
                
                if let fromDate = input.fromDate?.removeTimeStamp() {
                    return date >= fromDate && date <= toDate
                } else {
                    return date <= toDate
                }
            })
        }.store(in: &cancellables)
    }
}
