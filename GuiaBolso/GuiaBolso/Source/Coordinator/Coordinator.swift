//
//  Coordinator.swift
//  GuiaBolso
//
//  Created by Pedro Henrique Guedes Silveira on 09/01/21.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

