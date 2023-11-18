//
//  NetworkManager.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 16.11.2023.
//

import Foundation

class NetworkManager: NetworkManagerInput {
    func send<T: Codable>(_ url: URL?) async throws -> T {
        guard let url else { throw NetworkingError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
