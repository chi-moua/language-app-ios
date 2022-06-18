//
//  ArticlesModel.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 5/30/22.
//

import Foundation

enum Category: Int, Codable, CaseIterable {
    case business = 0
    case entertainment = 1
    case health = 2
    case science = 3
    case sports = 4
    case technology = 5
    case general = 6
}

struct Article: Codable {
    var title: String
    var source: String
    var url: String
    var imageUrl: String
    var category: Category
}

struct Articles: Decodable {
    var results: [Article]
}

struct ArticlesData {
    var articles : [Category : [Article]] = [:]
    
    init(_ articles: [Article]) {
        formatArticlesList(articles)
    }
    
    private mutating func formatArticlesList(_ articles: [Article]) {
        for article in articles {
            let category = article.category
            if var categoryList = self.articles[category] {
                categoryList.append(article)
            } else {
                let categoryList = [article]
                self.articles[category] = categoryList
            }
        }
    }
    
    func retrieveCategoryList(index: Int) -> [Article]? {
        guard let category = Category(rawValue: index) else {
            return nil
        }
        
        if let categoryList = self.articles[category] {
            return categoryList
        }
        return nil
    }
    
    var categoryCount: Int {
        self.articles.count
    }
}
