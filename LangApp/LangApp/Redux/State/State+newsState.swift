//
//  State+newsState.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 6/11/22.
//

import Foundation

extension State {
    struct NewsState: Equatable {
        var articles: ArticlesData = ArticlesData([Article]())
        var selectedLanguage: Language = .english
        
        enum Language {
            case english
            case spanish
            case french
            case italian
            case mandarin
        }
    }
}
