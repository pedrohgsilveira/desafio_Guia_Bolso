//
//  JokeViewController.swift
//  GuiaBolso
//
//  Created by Pedro Henrique Guedes Silveira on 11/01/21.
//

import UIKit

final class JokeViewController: UIViewController {
    
    @AutoLayout private var jokeLabel: UILabel
        
    private lazy var chuckImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = viewModel.chuckImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let viewModel: JokeViewModel
    
    init(viewModel: JokeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setUpJokeLabel()
        viewModel.delegate = self
    }
    
    private var constraintsIsActivated: Bool = false
    
    private lazy var chuckImageViewConstraints: [NSLayoutConstraint] = {
        [
            chuckImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40),
            chuckImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            chuckImageView.widthAnchor.constraint(equalToConstant: 60),
            chuckImageView.heightAnchor.constraint(equalToConstant: 60)
        ]
    }()
    
    
    required convenience init?(coder: NSCoder) {
        guard let viewModel = coder.decodeObject(forKey: "viewModel") as? JokeViewModel else {
            return nil
        }
        self.init(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(chuckImageView)
        self.view.addSubview(jokeLabel)
        self.view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
    
    private func setupConstraints() {
        if !constraintsIsActivated {
            NSLayoutConstraint.activate(chuckImageViewConstraints)
            jokeLabel.addAnchor(top: self.chuckImageView.bottomAnchor, leading: self.view.leadingAnchor, trailing: self.view.trailingAnchor, bottom: nil, padding: .init(top: 40, left: -20, bottom: 0, right: -20), widht: nil, height: 100)
            constraintsIsActivated = true
        } else {
            return
        }
    }
    
    private func setUpJokeLabel() {
        self.jokeLabel.text = self.viewModel.getJokeString()
        self.jokeLabel.numberOfLines = 0
    }
}

extension JokeViewController: ViewModelDelegate {
    func updateUI() {
        chuckImageView.image = viewModel.chuckImage
    }
}
