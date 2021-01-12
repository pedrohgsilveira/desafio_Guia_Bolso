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
    
    private lazy var tableViewDelegate: CategoryListTableViewDelegate = CategoryListTableViewDelegate { [unowned self] (index, cell)  in 
        self.view.addSubview(self.activityIndicator)
        NSLayoutConstraint.activate(self.indicatorConstraints)
        self.viewModel.pushToJokeViewController(index: index)
        cell.setSelected(false, animated: true)
    }
    
    private lazy var tableViewDataSource: CategoryListTableViewDataSource = CategoryListTableViewDataSource(viewModel: viewModel)
    
    private var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        return indicator
    }()
    
    private lazy var indicatorConstraints: [NSLayoutConstraint] = {
       [
        activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
       ] 
    }()

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
        self.view.addSubview(pickerTableView)
        self.view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        setupTableViewConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.activityIndicator.removeFromSuperview()
        super.viewDidDisappear(animated)
    }
    
    private func setupTableViewConstraints() {
        pickerTableView.addAnchor(top: self.view.safeAreaLayoutGuide.topAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, trailing: self.view.safeAreaLayoutGuide.trailingAnchor, bottom: self.view.safeAreaLayoutGuide.bottomAnchor, widht: nil, height: nil)
    }
}

extension CategoryListViewController: ViewModelDelegate {
    func updateUI() {
        pickerTableView.reloadData()
    }
}
