//
//  ArticlesModel.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 5/30/22.
//

import Foundation

enum Category: String, Codable {
    case business, entertainment, health, science, sports, technology, general
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
