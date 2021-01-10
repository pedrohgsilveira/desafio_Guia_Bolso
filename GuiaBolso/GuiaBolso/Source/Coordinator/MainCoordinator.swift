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

    }
    
    func selectCategory() {
        
    }
}
