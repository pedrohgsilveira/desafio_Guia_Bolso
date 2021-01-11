//
//  CategoryListViewController.swift
//  GuiaBolso
//
//  Created by Pedro Henrique Guedes Silveira on 11/01/21.
//

import UIKit

final class CategoryListViewController: UIViewController {
    
    private lazy var pickerTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private lazy var tableViewDelegate: CategoryListTableViewDelegate = CategoryListTableViewDelegate { [weak self] (cell) in 
        // TODO
    }
    
    private lazy var tableViewDataSource: CategoryListTableViewDataSource = CategoryListTableViewDataSource(viewModel: viewModel)

    private let viewModel: CategoryListViewModel
        
    init(viewModel: CategoryListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    required convenience init?(coder: NSCoder) {
        guard let viewModel = coder.decodeObject(forKey: "viewModel") as? CategoryListViewModel else {
            return nil
        }
        self.init(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupTableViewConstraints()
    }
    
    private func setupTableViewConstraints() {
        self.view.addSubview(pickerTableView)
        pickerTableView.addAnchor(top: self.view.safeAreaLayoutGuide.topAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, widht: nil, height: nil)
    }
}

extension CategoryListViewController: CategoryListViewModelDelegate {
    func updateUI() {
        pickerTableView.reloadData()
    }
}
