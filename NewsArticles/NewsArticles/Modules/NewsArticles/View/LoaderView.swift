//
//  LoaderView.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 18.11.2023.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(Color.gray)
            
            ProgressView()
                .progressViewStyle(.circular)
                .tint(Color.white)
        }
        .frame(width: 50, height: 50, alignment: .center)
    }
}


struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
