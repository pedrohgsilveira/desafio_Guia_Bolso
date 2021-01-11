//
//  CategoryListViewModeling.swift
//  GuiaBolso
//
//  Created by Pedro Henrique Guedes Silveira on 10/01/21.
//

import Foundation
import UIKit

protocol CategoryListViewModeling {
    var delegate: CategoryListViewModelDelegate? { get set }
    
    var categoryNames: [String] { get }
}
