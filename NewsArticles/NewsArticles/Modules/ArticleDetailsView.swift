//
//  ArticleDetailsView.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 18.11.2023.
//

import SwiftUI

struct ArticleDetailsView: View {
    
    var article: Article
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    AsyncImage(url: article.imageURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                            .frame(width: geo.size.width, height: 250, alignment: .center)
                    }
                    
                    HStack(spacing: 0) {
                        Text("source")
                        Text(article.source.name)
                    }
                    .font(.subheadline)
                    
                    Text(article.title)
                        .font(.headline)
                    
                    Text(article.description ?? "")
                        .font(.body)
                    
                    HStack(spacing: 0) {
                        Text("published_at")
                        Text(article.publishedAt)
                    }
                    .font(.subheadline)
                    
                    if let author = article.author {
                        HStack(alignment: .firstTextBaseline, spacing: 0) {
                            Text("created_by")
                            Text(author)
                        }
                        .font(.subheadline)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ArticleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailsView(article: articleMock)
    }
}
