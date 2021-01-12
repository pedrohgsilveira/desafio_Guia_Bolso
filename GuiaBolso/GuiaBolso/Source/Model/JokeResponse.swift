//
//  JokeResponse.swift
//  GuiaBolso
//
//  Created by Pedro Henrique Guedes Silveira on 10/01/21.
//

import Foundation

struct JokeResponse: Decodable {
    let value: String
    let categories: [String]
    let icon_url: String
}

extension JokeResponse: Equatable {
    static func == (lhs: JokeResponse, rhs: JokeResponse) -> Bool {
        return lhs.value == rhs.value
            && lhs.categories == rhs.categories
    }
}
