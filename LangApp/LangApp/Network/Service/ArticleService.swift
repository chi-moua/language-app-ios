//
//  ArticleService.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 6/11/22.
//

import Foundation

class ArticleService {
    static let urlPath = "https://news-app-backend-fastapi.herokuapp.com"
    static let categoryOrder: [Category] = [.business, .technology, .entertainment, .sports, .science, .health]
    
    init() {}
    
    static func getArticlesByLanguage(language: String) async throws -> Articles {
        let url = URL(string: self.urlPath + "/news/articles/language/\(language)")!
        let urlRequest = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let articleResults = try JSONDecoder().decode(Articles.self, from: data)
        return articleResults
        
    }
    
    static func fetchArticles(_ language: String, completion: @escaping ((Articles) -> Void)) {
        Task {
            do {
                let articles = try await ArticleService.getArticlesByLanguage(language: language)
                completion(articles)
            } catch {
                print(error)
            }
        }
    }
}
