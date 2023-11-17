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
        VStack {
            
            posterImage
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    private var posterImage: some View {
        AsyncImage(url: article.imageURL) { imagePhase in
            GeometryReader { geometry in
                imagePhase.image?
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height / 3, alignment: .center)
                    .cornerRadius(10)
            }
            
        }
    }
}

struct ArticleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailsView(article: articleMock)
    }
}
