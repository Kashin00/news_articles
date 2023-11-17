//
//  DatePickerView.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 17.11.2023.
//

import SwiftUI

struct DatePickerView: View {
    
    @EnvironmentObject var viewModel: NewsArticlesViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            let fromDateBinding = Binding {
                viewModel.searchRequest.fromDate ?? Date()
            } set: { value, _ in
                viewModel.searchRequest.fromDate = value
            }
            
            let toDateBinding = Binding {
                viewModel.searchRequest.toDate ?? Date()
            } set: { value, _ in
                viewModel.searchRequest.toDate = value
            }

            DatePicker(selection: fromDateBinding, in: ...Date(), displayedComponents: [.date]) {
                Text("news_from_date")
                    .font(.headline)
            }
            
            DatePicker(selection: toDateBinding,
                       in: fromDateBinding.wrappedValue...Date(),
                       displayedComponents: [.date]) {
                Text("news_to_date")
                    .font(.headline)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
