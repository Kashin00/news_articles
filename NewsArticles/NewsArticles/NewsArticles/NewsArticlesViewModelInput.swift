//
//  NewsArticlesViewModelInput.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 16.11.2023.
//

import Foundation

protocol NewsArticlesViewModelInput: ObservableObject {
    var articles: [Article] { get set }
    var searchedArticles: [Article] { get }
    var searchRequest: SearchRequest { get set }
    var isLoading: Bool { get }
    
    func viewDidAppear()
    func searchButtonTapped()
    func sortButtonTapped(with sortType: SortType)
}
