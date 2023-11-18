//
//  NetworkManagerInput.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 18.11.2023.
//

import Foundation

protocol NetworkManagerInput {
    func send<T: Codable>(_ request: URL?) async throws -> T
}
