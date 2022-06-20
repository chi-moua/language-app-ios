//
//  ArticlesModel.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 5/30/22.
//

import Foundation

enum Category: String, Codable, CaseIterable {
    case business
    case entertainment
    case health
    case science
    case sports
    case technology
    case general
    
    static func string(value: Int) -> Category? {
        switch value {
        case 0:
            return .business
        case 1:
            return .entertainment
        case 2:
            return .health
        case 3:
            return .science
        case 4:
            return .sports
        case 5:
            return .technology
        case 6:
            return .general
        default:
            return nil
        }
    }
}

struct Article: Codable, Equatable {
    var title: String
    var source: String
    var url: String
    var imageUrl: String
    var category: Category
    
    static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.title == rhs.title
        && lhs.source == rhs.source
        && lhs.url == rhs.url
        && lhs.imageUrl == rhs.imageUrl
        && lhs.category == rhs.category
    }
}

struct Articles: Codable, Equatable {
    var results: [Article]
    
    static func == (lhs: Articles, rhs: Articles) -> Bool {
        return lhs.results == rhs.results
    }
}

struct ArticlesData: Equatable {
    var articles : [Category : [Article]] = [:]
    
    init(_ articles: [Article]) {
        formatArticlesList(articles)
    }
    
    private mutating func formatArticlesList(_ articlesList: [Article]) {
        for article in articlesList {
            let category = article.category
            if var categoryList = self.articles[category] {
                self.articles[category]?.append(article)
            } else {
                let newList = [article]
                self.articles[category] = newList
            }
        }
    }
    
    func retrieveCategoryList(index: Int) -> [Article]? {
        guard let category = Category.string(value: index) else {
            return nil
        }
        
        if let categoryList = self.articles[category] {
            print("list count is \(categoryList.count)")
            return categoryList
        }
        return nil
    }
    
    var categoryCount: Int {
        self.articles.count
    }
    
    static func == (lhs: ArticlesData, rhs: ArticlesData) -> Bool {
        return lhs.categoryCount == rhs.categoryCount
        && (lhs.articles as NSDictionary).isEqual(to: rhs.articles)
    }
}
