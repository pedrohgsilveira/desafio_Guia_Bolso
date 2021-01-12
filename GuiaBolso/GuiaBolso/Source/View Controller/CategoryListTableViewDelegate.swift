//
//  CategoryListTableViewDelegate.swift
//  GuiaBolso
//
//  Created by Pedro Henrique Guedes Silveira on 11/01/21.
//

import UIKit

final class CategoryListTableViewDelegate: NSObject, UITableViewDelegate {
    
    private var didSelectCell: (Int, CategoryListUITableViewCell) -> Void?
    
    init(_ didSelectCell: @escaping (Int, CategoryListUITableViewCell) -> Void) {
        self.didSelectCell = didSelectCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? CategoryListUITableViewCell else {
            return
        }
        
        didSelectCell(indexPath.row, cell)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
}
