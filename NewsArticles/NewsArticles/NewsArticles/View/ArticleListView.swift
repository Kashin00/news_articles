//
//  ArticleListView.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 17.11.2023.
//

import SwiftUI

struct ArticleListView: View {
    
    @Binding var articles: [Article]
    
    var body: some View {
        List(articles) { element in
            NavigationLink(destination: {
                EmptyView()
            }, label: {
                ArticleView(arcticle: element)
            })
        }
    }
}

//struct NewsArticlesView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleListView(articles: <#T##Binding<[Article]>#>, didEndEditing: <#T##(() -> ())##(() -> ())##() -> ()#>)
//    }
//}
