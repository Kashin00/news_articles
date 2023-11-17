//
//  ArticleView.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 16.11.2023.
//

import SwiftUI

struct ArticleView: View {
    
    var arcticle: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(arcticle.title)
                .font(.headline)
                .lineLimit(3)
            
            if let description = arcticle.description {
                Text(description)
                    .font(.subheadline)
                    .lineLimit(5)
            }
            
            Text(arcticle.publishedAt)
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(arcticle: articleMock)
    }
}
