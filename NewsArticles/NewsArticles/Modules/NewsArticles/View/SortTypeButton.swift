//
//  SortTypeButton.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 17.11.2023.
//

import SwiftUI

struct SortTypeButton: View {
    
    var sortType: SortType
    var perform: ((SortType) -> ())
    
    var body: some View {
        Button(sortType.rawValue.localized) {
            perform(sortType)
        }
    }
}

struct SortTypeButton_Previews: PreviewProvider {
    static var previews: some View {
        SortTypeButton(sortType: .byTitle) {_ in}
    }
}
