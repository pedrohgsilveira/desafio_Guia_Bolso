//
//  JokeViewModeling.swift
//  GuiaBolso
//
//  Created by Pedro Henrique Guedes Silveira on 11/01/21.
//

import Foundation

protocol JokeViewModeling {
    var delegate: ViewModelDelegate? { get set }
    
    var jokeResponse: JokeResponse { get }
}
