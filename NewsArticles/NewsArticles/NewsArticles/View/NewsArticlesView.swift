//
//  NewsArticlesView.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 16.11.2023.
//

import SwiftUI

struct NewsArticlesView<ViewModel>: View where ViewModel: NewsArticlesViewModelInput {
    
    @StateObject var viewModel: ViewModel
    @State var isDatePickerPresented: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ArticleListView(articles: $viewModel.articles)
                
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .navigationTitle("articles")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    TextField("search", text: $viewModel.searchRequest.text)
                        .submitLabel(.search)
                        .onSubmit {
                            viewModel.searchButtonTapped()
                        }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    sortMenuButton
                    dateSelectingButton
                }
            }
            .sheet(isPresented: $isDatePickerPresented) {
                DatePickerView()
                    .environmentObject(viewModel)
            }
        }
        
        .onAppear {
            viewModel.viewDidAppear()
        }
    }
    
    var sortMenuButton: some View {
        Menu {
            ForEach(SortType.allCases) { item in
                SortTypeButton(sortType: item) {
                    viewModel.sortButtonTapped(with: $0)
                }
            }
        } label: {
            Image(systemName: "line.3.horizontal.decrease.circle.fill")
        }
    }
    
    var dateSelectingButton: some View {
        Button {
            isDatePickerPresented = true
        } label: {
            Image(systemName: "calendar.badge.clock")
        }
    }
}
