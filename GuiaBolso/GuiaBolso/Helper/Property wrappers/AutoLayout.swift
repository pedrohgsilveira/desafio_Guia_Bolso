//
//  AutoLayout.swift
//  GuiaBolso
//
//  Created by Pedro Henrique Guedes Silveira on 11/01/21.
//

import UIKit

@propertyWrapper final class AutoLayout<View: UIView> {
    
    private lazy var view: View = {
        let view = View(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var wrappedValue: View {
        return view
    }
}
