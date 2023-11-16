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
            NavigationLink(destination: {
                EmptyView()
            }, label: {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    
            })
            .navigationTitle("1")
        }
    }
}

struct NewsArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticlesView(viewModel: NewsArticlesViewModel())
    }
}
