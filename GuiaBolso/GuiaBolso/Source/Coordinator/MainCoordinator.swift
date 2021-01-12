//
//  MainCoordinator.swift
//  GuiaBolso
//
//  Created by Pedro Henrique Guedes Silveira on 10/01/21.
//

import UIKit

final class MainCoordinator: CategorySelectorService {
    
    private let requestManager: RequestManager
    var navigationController: UINavigationController

    
    init(requestManager: RequestManager, navigationController: UINavigationController) {
        self.requestManager = requestManager
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = CategoryListViewModel(requestManager: requestManager, coordinator: self)
        let viewController = CategoryListViewController(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func selectCategory(response: JokeResponse) {
        let viewModel = JokeViewModel(requestManager: requestManager, jokeResponse: response)
        let viewController = JokeViewController(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
