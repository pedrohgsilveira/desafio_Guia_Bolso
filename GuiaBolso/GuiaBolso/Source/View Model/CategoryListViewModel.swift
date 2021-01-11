//
//  CategoryListViewModel.swift
//  GuiaBolso
//
//  Created by Pedro Henrique Guedes Silveira on 10/01/21.
//

import Foundation
import UIKit

final class CategoryListViewModel: CategoryListViewModeling {
    
    var delegate: CategoryListViewModelDelegate?
    
    var categoryNames: [String] = [] {
        didSet {
            DispatchQueue.main.async { [unowned self] in
                self.delegate?.updateUI()
            }
        }
    }
    
    private var selectedCategory: String = "" {
        didSet {
            fetchJokeFromCategory()
        }
    }
    
    private var selectedJoke: JokeResponse?
    
    private let requestManager: RequestManager
    
    private let coordinator: MainCoordinator
    
    init(requestManager: RequestManager, coordinator: MainCoordinator) {
        self.requestManager = requestManager
        self.coordinator = coordinator
        fetchCategoriesNames()
    }
    
    func fetchCategoriesNames() {
        guard let url = ChucknorrisAPI.categories.url else {
            return
        }
        
        self.requestManager.getRequest(url: url, decodableType: [String].self) { [weak self] (result) in
            switch result {
            case .success(let result):
                self?.categoryNames = result
            case .failure(let error):
                ErrorHandler().genericErrorHandling(title: "Error Fetching Response", message: error.localizedDescription)
            }
        }
    }
    
    func fetchJokeFromCategory() {
        guard let url = ChucknorrisAPI.category.url else {
            return
        }
        
        let jokeUrl = url + selectedCategory
        
        self.requestManager.getRequest(url: jokeUrl, decodableType: JokeResponse.self) { [weak self] (result) in
            switch result {
            case .success(let result):
                self?.selectedJoke = result
            case .failure(let error):
                ErrorHandler().genericErrorHandling(title: "Error Fetching Response", message: error.localizedDescription)
            }
        }
    }
        
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows() -> Int {
        return categoryNames.count
    }
}
