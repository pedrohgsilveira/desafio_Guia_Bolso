//
//  ChucknorrisAPI.swift
//  GuiaBolso
//
//  Created by Pedro Henrique Guedes Silveira on 09/01/21.
//

import Foundation

enum ChucknorrisAPICategories: String {
    case animal = "animal"
    case career = "career"
    case celebrity = "celebrity"
    case dev = "dev"
    case explicit = "explicit"
    case fashion = "fashion"
    case food = "food"
    case history = "history"
    case money = "money"
    case movie = "movie"
    case music = "music"
    case political = "political"
    case religion = "religion"
    case science = "science"
    case sport = "sport"
    case travel = "travel"
}

enum ChucknorrisAPI {
    case categories
    case category
}

extension ChucknorrisAPI {
    
    var url: String? {
        
        switch self {
        case .categories:
            return "https://api.chucknorris.io/jokes/categories"
        case .category:
            return "https://api.chucknorris.io/jokes/random?category="
        }
    }
}
