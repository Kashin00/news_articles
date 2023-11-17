//
//  String+Extensions.swift
//  NewsArticles
//
//  Created by Матвей Кашин on 17.11.2023.
//

import Foundation

extension String {
  var localized: String { NSLocalizedString(self, comment: "") }
  var localizedUpper: String { NSLocalizedString(self, comment: "").uppercased() }
  
  func localizedWithParams(arguments: [CVarArg]) -> String {
    String(format: self.localized, arguments: arguments)
  }
}
