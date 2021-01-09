//
//  UIAlert+Extension.swift
//  GuiaBolso
//
//  Created by Pedro Henrique Guedes Silveira on 09/01/21.
//

import UIKit

extension UIAlertController {

    internal func makeErrorMessage(with logMessage: String) -> UIAlertController {
        let action = UIAlertAction(title: "Done", style: .default) { _ in
            NSLog(logMessage)
        }
        
        self.addAction(action)
        self.view.tintColor = .black
        
        return self
    }
}
