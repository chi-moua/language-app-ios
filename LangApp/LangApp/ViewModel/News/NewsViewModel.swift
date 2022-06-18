//
//  NewsViewModel.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 6/17/22.
//

import ReSwift
import Foundation

struct NewsViewModel {
    var articlesData: ArticlesData
    
    init(store: Store<State>) {
        articlesData = store.state.newsState.articles
    }
}
