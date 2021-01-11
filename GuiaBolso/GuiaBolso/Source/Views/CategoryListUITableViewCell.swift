//
//  CategoryListUITableViewCell.swift
//  GuiaBolso
//
//  Created by Pedro Henrique Guedes Silveira on 11/01/21.
//

import UIKit

final class CategoryListUITableViewCell: UITableViewCell {
    
    private var categoryName: String
    
    private lazy var categoryNameLabel: UILabel = {
        let label = UILabel()
        label.text = categoryName
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        
        return label
    }()
    
    init(categoryName: String) {
        self.categoryName = categoryName
        super.init(style: .default, reuseIdentifier: CategoryListUITableViewCell.cellID())
        
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        createConstraints()
    }
    
    required convenience init?(coder: NSCoder) {
        guard let categoryName = coder.decodeObject(forKey: "categoryName") as? String else {
            return nil
        }
        self.init(categoryName: categoryName)
    }
    
    class func cellID() -> String {
        "CategoryListUITableViewCell"
    }
    
    private func createConstraints() {
        categoryNameLabel.addAnchor(top: self.topAnchor, leading: self.leadingAnchor, trailing: nil, bottom: nil, padding: .init(top: 14, left: -16, bottom: 0, right: 0), widht: self.frame.width * 0.8, height: self.frame.height * 0.4)
    }
}
