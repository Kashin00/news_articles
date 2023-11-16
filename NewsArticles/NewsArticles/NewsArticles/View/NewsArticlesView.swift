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
            List(viewModel.articles) { element in
                NavigationLink(destination: {
                    EmptyView()
                }, label: {
                    ArticleView(arcticle: element)
                })
            }
            .navigationTitle("Articles")
        }
        .onAppear {
            viewModel.viewDidAppear()
        }
    }
}

struct NewsArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticlesView(viewModel: NewsArticlesViewModel())
    }
}
