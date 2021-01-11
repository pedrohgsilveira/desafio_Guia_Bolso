//
//  CategoryListTableViewDataSource.swift
//  GuiaBolso
//
//  Created by Pedro Henrique Guedes Silveira on 11/01/21.
//

import UIKit

final class CategoryListTableViewDataSource: NSObject, UITableViewDataSource {
    
    private var viewModel: CategoryListViewModel
    
    init(viewModel: CategoryListViewModel) {
        self.viewModel = viewModel
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoriesNames = viewModel.categoryNames
        let categoryName = categoriesNames[indexPath.row]
        
        let cell = CategoryListUITableViewCell(categoryName: categoryName)
        
        return cell
    }
}
