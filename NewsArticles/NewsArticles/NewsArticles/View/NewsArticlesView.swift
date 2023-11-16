//
//  NewsArticlesView.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 16.11.2023.
//

import SwiftUI

struct NewsArticlesView<ViewModel>: View where ViewModel: NewsArticlesViewModelInput {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                // We need to handle Cancel button from search bar and use @Environment(\.isSearching) for this case, so .searchable should be from global state. As a result, onSubmit should also be on a global state
                ArticleListView(articles: $viewModel.articles, didEndEditing: {
                    viewModel.searchBarCancelButtonTapped()
                })
                .searchable(text: $viewModel.searchableText, prompt: "Search")
                .onSubmit(of: .search) {
                    viewModel.searchButtonTapped()
                }
                
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .navigationTitle("Articles")
        }
        
        .onAppear {
            viewModel.viewDidAppear()
        }
    }
}
