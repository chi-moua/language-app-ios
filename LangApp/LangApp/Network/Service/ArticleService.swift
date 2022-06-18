//
//  ArticleService.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 6/11/22.
//

import Foundation

class ArticleService {
    let urlPath = "https://news-app-backend-fastapi.herokuapp.com"
    let categoryOrder: [Category] = [.business, .technology, .entertainment, .sports, .science, .health]
    
    init() {}
    
    
    func getArticlesByLanguage(language: String, completionHandler: @escaping (Articles) -> Void){
        let url = URL(string: self.urlPath + "/news/articles/language/\(language)")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                print("Error with fetching articles with language \(language)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                        (200...299).contains(httpResponse.statusCode) else {
                            print("Error with the response, unexpected status code: \(response)")
                    return
                  }
            
            if let data = data,
               let articleResults = try? JSONDecoder().decode(Articles.self, from: data) {
                completionHandler(articleResults)
            }
            
        })
        task.resume()
    }
}
