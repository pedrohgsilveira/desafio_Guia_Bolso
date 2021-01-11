//
//  CategoryListTableViewDelegate.swift
//  GuiaBolso
//
//  Created by Pedro Henrique Guedes Silveira on 11/01/21.
//

import UIKit

final class CategoryListTableViewDelegate: NSObject, UITableViewDelegate {
    
    private var didSelectCell: (CategoryListUITableViewCell) -> Void?
    
    init(_ didSelectCell: @escaping (CategoryListUITableViewCell) -> Void) {
        self.didSelectCell = didSelectCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let currencyCell = tableView.cellForRow(at: indexPath) as? CategoryListUITableViewCell else {
            return
        }
        didSelectCell(currencyCell)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
}
