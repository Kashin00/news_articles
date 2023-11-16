//
//  NewsArticlesViewModelInput.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 16.11.2023.
//

import Foundation

protocol NewsArticlesViewModelInput: ObservableObject {
    var articles: [Article] { get }
    func viewDidAppear()
}
