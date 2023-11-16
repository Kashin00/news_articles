//
//  ArticleListView.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 17.11.2023.
//

import SwiftUI

struct ArticleListView: View {
    
    @Environment(\.isSearching) private var isSearching
    @Binding var articles: [Article]
    
    var didEndEditing: (() -> ())
    
    var body: some View {
        List(articles) { element in
            NavigationLink(destination: {
                EmptyView()
            }, label: {
                ArticleView(arcticle: element)
            })
            .onChange(of: isSearching) { newValue in
                if !newValue {
                    didEndEditing()
                }
            }
        }
    }
}

struct NewsArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticlesView(viewModel: NewsArticlesViewModel())
    }
}
